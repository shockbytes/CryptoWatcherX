import 'package:firebase_auth/firebase_auth.dart';

abstract class LoginEvent {}

class SuccessEvent implements LoginEvent {
  final UserCredential userCredential;

  SuccessEvent(this.userCredential);
}

class UserNotFoundEvent implements LoginEvent {
  final String userName;

  UserNotFoundEvent(this.userName);
}

class WrongPasswordEvent implements LoginEvent {}
