import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/domain/usecases/song/get_play_list.dart';
import 'package:ragam/presentation/home/bloc/play_list_state.dart';
import 'package:ragam/service_locator.dart';

class PlayListCubit extends Cubit<PlayListState> {
  PlayListCubit() : super(PlayListLoading());
  Future<void> getPlayListSongs() async {
    var returnedSongs = await s1<GetPlayListUsecase>().call();
    returnedSongs.fold(
      (l) {
        // left if failed
        emit(PlayListFailed());
      },
      (data) {
        //right if success
        emit(PlayListLoaded(songs: data));
      },
    );
  }
}
