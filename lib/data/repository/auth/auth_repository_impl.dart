import 'package:dartz/dartz.dart';
import 'package:ragam/data/models/auth/create_user_req.dart';
import 'package:ragam/data/models/auth/signin_user_request.dart';
import 'package:ragam/data/sources/auth/auth_firebase_service.dart';
import 'package:ragam/domain/repository/auth/auth.dart';
import 'package:ragam/service_locator.dart';

class AuthRepositoryImpl extends AuthRepository {
  @override
  Future<Either> signin(SigninUserRequest signinUserRequest) async {
    return await s1<AuthFirebaseService>().signin(signinUserRequest);
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    return await s1<AuthFirebaseService>().signup(createUserReq);
  }

  @override
  Future<Either> getUser() async {
    return await s1<AuthFirebaseService>().getUser();
  }
}
