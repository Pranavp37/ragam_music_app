import 'package:dartz/dartz.dart';
import 'package:ragam/core/usecase/usecase.dart';
import 'package:ragam/data/models/auth/create_user_req.dart';
import 'package:ragam/data/sources/auth/auth_firebase_service.dart';
import 'package:ragam/domain/repository/auth/auth.dart';
import 'package:ragam/service_locator.dart';

class SignUpUsecase implements Usecase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async{
    return await s1<AuthRepository>().signup(params!);
  }
}
