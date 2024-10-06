import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/common/bloc/favorite_button/favorite_button_state.dart';
import 'package:ragam/domain/usecases/song/add_or_remove.dart';
import 'package:ragam/service_locator.dart';

class FavoriteButtonCubit extends Cubit<FavoriteButtonState> {
  FavoriteButtonCubit() : super(FavoriteButtonInitial());

  void favorateBottonUpdated(String songId) async {
    var result = await s1<AddOrRemoveSongsUsecase>().call(params: songId);

    
    result.fold(
      (l) {},
      (isFavorate) {
        emit(FavoriteBUttonUpdated(isFavorate: isFavorate));
      },
    );
  }
}
