import 'package:dartz/dartz.dart';

abstract class SongRepository {
  Future<Either> getNewSongs();
  Future<Either> getPlayList();
  Future<Either> addOrRemoveFvtSongs(String songId);
  Future<bool> isFavoriteSongs(String songId);
  Future<Either> getUserFavoteSongs();
}
