import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/domain/usecases/song/get_news_songs.dart';
import 'package:ragam/presentation/home/bloc/news_songs_state.dart';
import 'package:ragam/service_locator.dart';

class NewsSongsCubit extends Cubit<NewsSongsState> {
  NewsSongsCubit() : super(NewsSongsLoading());
  Future<void> getNewsSongs() async {
    var returnedSongs = await s1<GetNewsSongsUsecase>().call();
    returnedSongs.fold(
      (l) {
        // left if failed
        emit(NewsSongFailed());
      },
      (data) {
        //right if success
        emit(NewsSongsLoaded(songs: data));
      },
    );
  }
}
