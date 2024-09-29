import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:ragam/data/models/song/song.dart';
import 'package:ragam/domain/entities/song/song.dart';

abstract class SongFirebaseService {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
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
        songs.add(songModel.toEntity());
      }
      // print(songs);
      return right(songs);
    } catch (e) {
      return left('An error occurred,please try again.');
    }
  }
}
