import 'package:dartz/dartz.dart';
import 'package:ragam/core/usecase/usecase.dart';
import 'package:ragam/data/models/auth/signin_user_request.dart';
import 'package:ragam/domain/repository/auth/auth.dart';
import 'package:ragam/service_locator.dart';

class SigninUsecase implements Usecase<Either, SigninUserRequest> {
  @override
  Future<Either> call({SigninUserRequest? params}) async {
    return await s1<AuthRepository>().signin(params!);
  }
}
