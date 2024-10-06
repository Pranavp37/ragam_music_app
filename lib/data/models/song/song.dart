import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ragam/domain/entities/song/song.dart';

class SongModel {
  String? titile;
  String? artist;
  num? duration;
  Timestamp? releaseDate;
  bool? isFavorate;
  String? songId;

  SongModel({
    required this.titile,
    required this.artist,
    required this.duration,
    required this.releaseDate,
    required this.isFavorate,
    required this.songId,
  });

  SongModel.fromJson(Map<String, dynamic> data) {
    titile = data['title'];
    artist = data['artist'];
    duration = data['duration'];
    releaseDate = data['releasedate'];
  }
  // SongModel.toJson(Map<String, dynamic> data) {
  //   data['title'] = data;
  //   data['artist'] = artist;
  //   data['duration'] = duration;
  //   data['releasedate'] = releaseDate;
  // }
}

extension SongModelX on SongModel {
  SongEntities toEntity() {
    return SongEntities(
      titile: titile!,
      artist: artist!,
      duration: duration!,
      releaseDate: releaseDate!,
      isFavorate: isFavorate!,
      songId: songId!,
    );
  }
}
