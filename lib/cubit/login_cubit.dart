import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/module/profile_screen.dart';
import 'package:social_app/model/user_model.dart';
import 'package:social_app/shared/component/constants.dart';

class LoginCubit extends Cubit<AppStates> {
  LoginCubit() : super(InitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  UserModel? userModel;

  Future<void> getUserData({required String? uId}) async {
    emit(LoginUserFirebaseLoadingState());

    await FirebaseFirestore.instance.collection('users').doc(uId).get().then((value) {
      //print(value.data());
      userModel = UserModel.fromFirebase(value.data());
      // print("user: ${userModel!.email}");
      emit(LoginUserFirebaseSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(LoginUserFirebaseErrorState(errorMessage: error.toString()));
    });
  }

  Future<void> loginFirebase({
    required context,
    required String email,
    required String password,
  }) async {
    emit(LoginUserFirebaseLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) async {
        await getUserData(uId: value.user?.uid);
        navigate(context: context, requiredScreen: HomeLayout());
        emit(LoginUserFirebaseSuccessState());
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No user found for that email.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('No user found for that email.'),
        ));
      } else if (e.code == 'wrong-password') {
        print('Wrong password provided for that user.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('Wrong password provided for that user.'),
        ));
      }
    } catch (error) {
      emit(LoginUserFirebaseErrorState(errorMessage: error.toString()));
    }
  }
}
