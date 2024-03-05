import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:social_app/cubit/app_states.dart';
import 'package:social_app/layout/home_layout.dart';
import 'package:social_app/model/user_model.dart';
import 'package:social_app/module/login_screen.dart';
import 'package:social_app/shared/component/constants.dart';

class RegisterCubit extends Cubit<AppStates> {
  RegisterCubit() : super(InitState());

  static RegisterCubit get(context) => BlocProvider.of(context);

  Future<void> registerUserFirebase(
      {required context,
      required String username,
      required String email,
      required String phone,
      required String dateOfBirth,
      required String password}) async {
    emit(RegisterUserFirebaseLoadingState());
    try {
      await FirebaseAuth.instance
          .createUserWithEmailAndPassword(
        email: email,
        password: password,
      )
          .then((value) {
        addUserFirestore(
            username: username,
            email: email,
            phone: phone,
            dateOfBirth: dateOfBirth,
            password: password,
            uId: FirebaseAuth.instance.currentUser!.uid);
        emit(RegisterUserFirebaseSuccessState());
        navigate(context: context, requiredScreen: LoginScreen());
        return ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.green,
          content: Text('Successfully registered'),
        ));
      });
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('The password provided is too weak.'),
        ));
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          backgroundColor: Colors.red,
          content: Text('The account already exists for that email.'),
        ));
      }
    } catch (e) {
      print(e);
      emit(RegisterUserFirebaseErrorState(errorMessage: e.toString()));
    }
  }

  void addUserFirestore(
      {required String username,
      required String email,
      required String phone,
      required String dateOfBirth,
      required String password,
      required String uId}) {
    UserModel userModel = UserModel(
      username: username,
      email: email,
      phone: phone,
      dateOfBirth: dateOfBirth,
      profilePic:
          'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      coverPic:
          'https://image.freepik.com/free-photo/photo-attractive-bearded-young-man-with-cherful-expression-makes-okay-gesture-with-both-hands-likes-something-dressed-red-casual-t-shirt-poses-against-white-wall-gestures-indoor_273609-16239.jpg',
      bio: "write your bio ...",
      uId: uId,
      isEmailVerified: false,
    );

    FirebaseFirestore.instance
        .collection('users')
        .doc(uId)
        .set(userModel.toFirebase())
        .then((value) {
      emit(AddUserFirestoreSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(AddUserFirestoreErrorState(errorMessage: error.toString()));
    });
  }
}
