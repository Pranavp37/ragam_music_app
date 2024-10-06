import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ragam/domain/usecases/auth/get_user.dart';
import 'package:ragam/presentation/profile/bloc/profile_info_state.dart';
import 'package:ragam/service_locator.dart';

class ProfileInfoCubit extends Cubit<ProfileInfoState> {
  ProfileInfoCubit() : super(ProfileInfoLoading());

  Future<void> getUser() async {
    var user = await s1<GetUserUsecase>().call();
    user.fold(
      (l) {
        emit(ProfileInfoFailed());
      },
      (userEntity) {
        emit(ProfileInfoLoaded(userEntity: userEntity));
      },
    );
  }
}
