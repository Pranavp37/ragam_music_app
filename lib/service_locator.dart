import 'package:get_it/get_it.dart';
import 'package:ragam/data/repository/auth/auth_repository_impl.dart';
import 'package:ragam/data/repository/song/song_repository_impl.dart';
import 'package:ragam/data/sources/auth/auth_firebase_service.dart';
import 'package:ragam/data/sources/song/song_firebase_services.dart';
import 'package:ragam/domain/repository/auth/auth.dart';
import 'package:ragam/domain/repository/song/song.dart';
import 'package:ragam/domain/usecases/auth/get_user.dart';
import 'package:ragam/domain/usecases/auth/signin.dart';
import 'package:ragam/domain/usecases/auth/signup.dart';
import 'package:ragam/domain/usecases/song/add_or_remove.dart';
import 'package:ragam/domain/usecases/song/get_favorate_songs.dart';
import 'package:ragam/domain/usecases/song/get_news_songs.dart';
import 'package:ragam/domain/usecases/song/get_play_list.dart';
import 'package:ragam/domain/usecases/song/is_favotate.dart';

final s1 = GetIt.instance;

Future<void> initilizeDependecies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImple());

  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  s1.registerSingleton<SongFirebaseService>(SongFirebaseServiceImp());

  s1.registerSingleton<SongRepository>(SongRepositoryImpl());

  s1.registerSingleton<SignUpUsecase>(SignUpUsecase());

  s1.registerSingleton<SigninUsecase>(SigninUsecase());

  s1.registerSingleton<GetNewsSongsUsecase>(GetNewsSongsUsecase());

  s1.registerSingleton<GetPlayListUsecase>(GetPlayListUsecase());

  s1.registerSingleton<AddOrRemoveSongsUsecase>(AddOrRemoveSongsUsecase());

  s1.registerSingleton<IsFavotateSongsUsecase>(IsFavotateSongsUsecase());

  s1.registerSingleton<GetUserUsecase>(GetUserUsecase());

  s1.registerSingleton<GetFavorateUseCase>(GetFavorateUseCase());
}
