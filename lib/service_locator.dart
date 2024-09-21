import 'package:get_it/get_it.dart';
import 'package:ragam/data/repository/auth/auth_repository_impl.dart';
import 'package:ragam/data/sources/auth/auth_firebase_service.dart';
import 'package:ragam/domain/repository/auth/auth.dart';
import 'package:ragam/domain/usecases/auth/signin.dart';
import 'package:ragam/domain/usecases/auth/signup.dart';

final s1 = GetIt.instance;

Future<void> initilizeDependecies() async {
  s1.registerSingleton<AuthFirebaseService>(AuthFirebaseServiceImple());

  s1.registerSingleton<AuthRepository>(AuthRepositoryImpl());

  s1.registerSingleton<SignUpUsecase>(SignUpUsecase());

  s1.registerSingleton<SigninUsecase>(SigninUsecase());
}
