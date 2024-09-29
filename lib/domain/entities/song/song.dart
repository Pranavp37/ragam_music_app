import 'package:cloud_firestore/cloud_firestore.dart';

class SongEntities {
  final String titile;
  final String artist;
  final num duration;
  final Timestamp releaseDate;

  SongEntities(
      {required this.titile,
      required this.artist,
      required this.duration,
      required this.releaseDate});
}
