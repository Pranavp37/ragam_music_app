import 'package:ragam/domain/entities/song/song.dart';

abstract class NewsSongsState {}

class NewsSongsLoading extends NewsSongsState {}

class NewsSongsLoaded extends NewsSongsState {
  final List<SongEntities> songs;
  NewsSongsLoaded({required this.songs});
}

class NewsSongFailed extends NewsSongsState {}
