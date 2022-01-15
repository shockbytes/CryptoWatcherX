

import 'package:cryptowatcherx/bloc/login/login_state.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc {

  BehaviorSubject<LoginState> _loginSubject = BehaviorSubject();

  Stream<LoginState> get loginState => _loginSubject.stream;

  LoginBloc() {
    _loginSubject.add(LoginState.loggedIn);
  }

}