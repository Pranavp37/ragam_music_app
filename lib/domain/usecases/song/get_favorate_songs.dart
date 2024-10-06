import 'package:dartz/dartz.dart';
import 'package:ragam/core/usecase/usecase.dart';
import 'package:ragam/domain/repository/song/song.dart';

import 'package:ragam/service_locator.dart';

class GetFavorateUseCase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await s1<SongRepository>().getUserFavoteSongs();
  }
}
