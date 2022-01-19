import 'package:cryptowatcherx/bloc/login/login_bloc.dart';
import 'package:cryptowatcherx/bloc/login/login_event.dart';
import 'package:cryptowatcherx/data/injection/dependency_injector.dart';
import 'package:cryptowatcherx/ui/core/platform_components.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:cryptowatcherx/util/crypto_text_style.dart';
import 'package:cryptowatcherx/util/ui_utils.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginBloc _bloc = DependencyInjector.get<LoginBloc>();

  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    _bloc.loginEvents.listen(
      (event) async {
        if (event is UserNotFoundEvent) {
          await UiUtils.showUserDialog(
            context,
            title: 'User not found!',
            content: 'The user with the name ${event.userName} does not exist.',
          );
        } else if (event is WrongPasswordEvent) {
          await UiUtils.showUserDialog(
            context,
            title: 'Wrong password!',
            content: 'The password for the given user is wrong.',
          );
        }
      },
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CryptoColors.background,
      body: Center(
        child: ListView(
          physics: BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 52.0),
          shrinkWrap: true,
          children: [
            SizedBox(height: 32),
            Image.asset('assets/launcher-icon/ic_launcher.png'),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Log into\nCrypto Watcher',
                  style: CryptoTextStyle.header,
                  textAlign: TextAlign.center,
                ),
              ],
            ),
            SizedBox(height: 32),
            Text(
              'Username',
              style: CryptoTextStyle.textDefault,
            ),
            PlatformComponents.textInput(
              _emailController,
              inputType: TextInputType.emailAddress,
            ),
            SizedBox(height: 32),
            Text(
              'Password',
              style: CryptoTextStyle.textDefault,
            ),
            PlatformComponents.textInput(
              _passwordController,
              obscureText: true,
            ),
            SizedBox(height: 64),
            ElevatedButton(
              onPressed: () => _bloc.login(
                email: _emailController.text,
                password: _passwordController.text,
              ),
              child: Text('Login'),
            ),
            SizedBox(height: 48),
          ],
        ),
      ),
    );
  }
}
