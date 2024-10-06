import 'package:dartz/dartz.dart';
import 'package:ragam/core/usecase/usecase.dart';
import 'package:ragam/domain/repository/song/song.dart';

import 'package:ragam/service_locator.dart';

class AddOrRemoveSongsUsecase implements Usecase<Either, String> {
  @override
  Future<Either> call({String? params}) async {
    return await s1<SongRepository>().addOrRemoveFvtSongs(params!);
  }
}
