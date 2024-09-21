import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ragam/data/models/auth/create_user_req.dart';
import 'package:ragam/data/models/auth/signin_user_request.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest signinUserRequest);

  Future<Either> signup(CreateUserReq createUserReq);
}

class AuthFirebaseServiceImple extends AuthFirebaseService {
  @override
  Future<Either> signin(SigninUserRequest signinUserRequest) async {
    try {
      await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: signinUserRequest.email,
        password: signinUserRequest.password,
      );
      return const Right('Signin was succeful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'invalid-email') {
        message = 'Not user found for that email';
      } else if (e.code == 'invalid-credential') {
        message = 'Worng password povided for that user. ';
      }
      return left(message);
    }
  }

  @override
  Future<Either> signup(CreateUserReq createUserReq) async {
    try {
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      return const Right('Signup was succeful');
    } on FirebaseAuthException catch (e) {
      String message = '';
      if (e.code == 'weak-password') {
        message = 'The password provided is too weak';
      } else if (e.code == 'email-already-in-use') {
        message = 'An account already exists with that email. ';
      }
      return left(message);
    }
  }
}
