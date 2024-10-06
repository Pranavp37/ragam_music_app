import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ragam/data/models/song/song.dart';
import 'package:ragam/domain/entities/song/song.dart';
import 'package:ragam/domain/usecases/song/is_favotate.dart';
import 'package:ragam/service_locator.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFvtSongs(String songId);
  Future<bool> isFavoriteSong(String songId);
  Future<Either> getUserFavoriteSongs();
}

class SongFirebaseServiceImp extends SongFirebaseService {
  @override
  Future<Either> getNewSongs() async {
    try {
      List<SongEntities> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releasedate', descending: true)
          .limit(3)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavorate = await s1<IsFavotateSongsUsecase>()
            .call(params: element.reference.id);
        songModel.isFavorate = isFavorate;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }
      // print(songs);
      return right(songs);
    } catch (e) {
      return left('An error occurred,please try again.');
    }
  }

  @override
  Future<Either> getPlayList() async {
    try {
      List<SongEntities> songs = [];
      var data = await FirebaseFirestore.instance
          .collection('Songs')
          .orderBy('releasedate', descending: true)
          .get();
      for (var element in data.docs) {
        var songModel = SongModel.fromJson(element.data());
        bool isFavorate = await s1<IsFavotateSongsUsecase>()
            .call(params: element.reference.id);
        songModel.isFavorate = isFavorate;
        songModel.songId = element.reference.id;
        songs.add(songModel.toEntity());
      }
      // print(songs);
      return right(songs);
    } catch (e) {
      return left('An error occurred,please try again.');
    }
  }

  @override
  Future<Either> addOrRemoveFvtSongs(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      late bool isFavorite;

      var user = firebaseAuth.currentUser;
      String uId = user!.uid;
      QuerySnapshot favoritesongs = await firebaseFirestore
          .collection('User')
          .doc(uId)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if (favoritesongs.docs.isNotEmpty) {
        await favoritesongs.docs.first.reference.delete();
        isFavorite = false;
      } else {
        firebaseFirestore
            .collection('User')
            .doc(uId)
            .collection('Favorites')
            .add({
          'songId': songId,
          'addedDate': Timestamp.now(),
        });
        isFavorite = true;
      }
      return Right(isFavorite);
    } catch (e) {
      return const Left('An error occured');
    }
  }

  @override
  Future<bool> isFavoriteSong(String songId) async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = firebaseAuth.currentUser;
      String uId = user!.uid;
      QuerySnapshot favoritesongs = await firebaseFirestore
          .collection('User')
          .doc(uId)
          .collection('Favorites')
          .where('songId', isEqualTo: songId)
          .get();

      if (favoritesongs.docs.isNotEmpty) {
        return true;
      } else {
        return false;
      }
    } catch (e) {
      return false;
    }
  }

  @override
  Future<Either> getUserFavoriteSongs() async {
    try {
      final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      final FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
      var user = firebaseAuth.currentUser;
      List<SongEntities> favoriteSongs = [];
      String uId = user!.uid;
      QuerySnapshot favoritesSnapshot = await firebaseFirestore
          .collection('User')
          .doc(uId)
          .collection('Favorites')
          .get();

      for (var element in favoritesSnapshot.docs) {
        String songId = element['songId'];
        var song =
            await firebaseFirestore.collection('Songs').doc(songId).get();
        SongModel songModel = SongModel.fromJson(song.data()!);
        songModel.isFavorate = true;
        songModel.songId = songId;
        favoriteSongs.add(songModel.toEntity());
      }

      return Right(favoriteSongs);
    } catch (e) {
      print(e);
      return const Left('An error occurred');
    }
  }
}
