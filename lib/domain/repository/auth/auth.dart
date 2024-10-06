import 'package:dartz/dartz.dart';
import 'package:ragam/data/models/auth/create_user_req.dart';
import 'package:ragam/data/models/auth/signin_user_request.dart';

abstract class AuthRepository {
  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> signin(SigninUserRequest signinUserRequest);
  Future<Either> getUser();
}
