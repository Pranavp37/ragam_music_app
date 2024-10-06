import 'package:ragam/core/usecase/usecase.dart';
import 'package:ragam/domain/repository/song/song.dart';

import 'package:ragam/service_locator.dart';

class IsFavotateSongsUsecase implements Usecase<bool, String> {
  @override
  Future<bool> call({String? params}) async {
    return await s1<SongRepository>().isFavoriteSongs(params!);
  }
}
