import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/shared/component/constants.dart';

class LoginCubit extends Cubit<AppStates> {
  LoginCubit() : super(InitState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> loginFirebase({
    required context,
    required String email,
    required String password,
  }) async {
    emit(LoginUserFirebaseLoadingState());
    try {
      await FirebaseAuth.instance
          .signInWithEmailAndPassword(email: email, password: password)
          .then((value) {
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
