import 'package:dartz/dartz.dart';
import 'package:ragam/core/usecase/usecase.dart';
import 'package:ragam/domain/repository/auth/auth.dart';
import 'package:ragam/service_locator.dart';

class GetUserUsecase implements Usecase<Either, dynamic> {
  @override
  Future<Either> call({params}) async {
    return await s1<AuthRepository>().getUser();
  }
}
