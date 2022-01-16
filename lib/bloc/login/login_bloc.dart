import 'package:cryptowatcherx/bloc/login/login_state.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

import 'login_event.dart';

class LoginBloc {

  PublishSubject<LoginEvent> _loginEventSubject = PublishSubject();

  Stream<LoginEvent> get loginEvents => _loginEventSubject.stream;

  Stream<LoginState> get loginState =>
      FirebaseAuth.instance.authStateChanges().map(
        (User? user) {
          if (user != null) {
            return LoginState.loggedIn;
          } else {
            return LoginState.loggedOut;
          }
        },
      );

  Future<void> login({
    required String email,
    required String password,
  }) async {
    try {
      var result = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _loginEventSubject.add(SuccessEvent(result));
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        _loginEventSubject.add(UserNotFoundEvent(email));
      } else if (e.code == 'wrong-password') {
        _loginEventSubject.add(WrongPasswordEvent());
      }
    }
  }

  Future<void> logout() {
    return FirebaseAuth.instance.signOut();
  }

}
