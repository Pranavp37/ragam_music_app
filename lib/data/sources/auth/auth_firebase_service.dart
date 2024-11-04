import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:ragam/core/configs/constant/app_urls.dart';
import 'package:ragam/data/models/auth/create_user_req.dart';
import 'package:ragam/data/models/auth/signin_user_request.dart';
import 'package:ragam/data/models/auth/user.dart';
import 'package:ragam/domain/entities/auth/user.dart';

abstract class AuthFirebaseService {
  Future<Either> signin(SigninUserRequest signinUserRequest);

  Future<Either> signup(CreateUserReq createUserReq);

  Future<Either> getUser();
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
      var data = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: createUserReq.email,
        password: createUserReq.password,
      );
      FirebaseFirestore.instance.collection('User').doc(data.user?.uid).set({
        'name': createUserReq.fullName,
        'email': data.user?.email,
      });

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

  @override
  Future<Either> getUser() async {
    try {
      FirebaseAuth firebaseAuth = FirebaseAuth.instance;
      FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;

      var user = await firebaseFirestore
          .collection('User')
          .doc(firebaseAuth.currentUser?.uid)
          .get();

      UserModel userModel = UserModel.fromJson(user.data()!);
      userModel.imageUrl =
          firebaseAuth.currentUser?.photoURL ?? AppURLs.defaultUrl;
      UserEntity userEntity = userModel.toEntity();
      return Right(userEntity);
    } catch (e) {
      return const Left('An error occured');
    }
  }
}
