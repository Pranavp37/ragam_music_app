import 'package:ragam/domain/entities/song/song.dart';

abstract class FavtSongsState {}

class FavtSongsLoading extends FavtSongsState {}

class FavtSongsLoaded extends FavtSongsState {
  final List<SongEntities> favorateSongd;

  FavtSongsLoaded({required this.favorateSongd});
}

class FavtSongsFailed extends FavtSongsState {}
