import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntities {
  final String titile;
  final String artist;
  final num duration;
  final Timestamp releaseDate;
  final bool isFavorate;
  final String songId;

  SongEntities({
    required this.titile,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorate,
    required this.songId,
  });
}
