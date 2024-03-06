abstract class AppStates {}

class InitState extends AppStates {}

class BottomNavBarChanged extends AppStates {}

class RegisterUserFirebaseLoadingState extends AppStates {}
class RegisterUserFirebaseSuccessState extends AppStates {}
class RegisterUserFirebaseErrorState extends AppStates {
  String errorMessage;

  RegisterUserFirebaseErrorState({
    required this.errorMessage,
  });
}

class AddUserFirestoreLoadingState extends AppStates {}
class AddUserFirestoreSuccessState extends AppStates {}
class AddUserFirestoreErrorState extends AppStates {
  String errorMessage;

  AddUserFirestoreErrorState({
    required this.errorMessage,
  });
}

class LoginUserFirebaseLoadingState extends AppStates {}
class LoginUserFirebaseSuccessState extends AppStates {}
class LoginUserFirebaseErrorState extends AppStates {
  String errorMessage;

  LoginUserFirebaseErrorState({
    required this.errorMessage,
  });
}
