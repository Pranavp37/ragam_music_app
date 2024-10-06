import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/domain/entities/song/song.dart';
import 'package:ragam/domain/usecases/song/get_favorate_songs.dart';
import 'package:ragam/presentation/profile/bloc/favt_songs_state.dart';
import 'package:ragam/service_locator.dart';

class FavtSongsCubit extends Cubit<FavtSongsState> {
  FavtSongsCubit() : super(FavtSongsLoading());

  List<SongEntities> favoratesSongs = [];
  Future<void> getFavoriteSongd() async {
    var result = await s1<GetFavorateUseCase>().call();
    result.fold(
      (l) {
        emit(FavtSongsFailed());
      },
      (r) {
        favoratesSongs = r;
        emit(FavtSongsLoaded(favorateSongd: favoratesSongs));
      },
    );
  }
}
