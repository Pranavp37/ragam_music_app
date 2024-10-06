import 'package:dartz/dartz.dart';
import 'package:ragam/data/sources/song/song_firebase_services.dart';
import 'package:ragam/domain/repository/song/song.dart';
import 'package:ragam/service_locator.dart';

class SongRepositoryImpl extends SongRepository {
  @override
  Future<Either> getNewSongs() async {
    return await s1<SongFirebaseService>().getNewSongs();
  }

  @override
  Future<Either> getPlayList() async {
    return await s1<SongFirebaseService>().getPlayList();
  }

  @override
  Future<Either> addOrRemoveFvtSongs(String songId) async {
    return await s1<SongFirebaseService>().addOrRemoveFvtSongs(songId);
  }

  @override
  Future<bool> isFavoriteSongs(String songId) async {
    return await s1<SongFirebaseService>().isFavoriteSong(songId);
  }
  
  @override
  Future<Either> getUserFavoteSongs() async{
  return await s1<SongFirebaseService>().getUserFavoriteSongs();
  }
}
