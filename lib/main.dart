import 'package:cryptowatcherx/bloc/login/login_bloc.dart';
import 'package:cryptowatcherx/ui/home/home_page.dart';
import 'package:cryptowatcherx/util/crypto_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'bloc/login/login_state.dart';
import 'ui/login/login_page.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: CryptoColors.backgroundDark
  ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  final LoginBloc _bloc = LoginBloc();

  MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'CryptoWatcherX',
      // localizationsDelegates: AppLocalizations.localizationsDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      theme: ThemeData(
        // fontFamily: 'Spartan',
        primaryColor: CryptoColors.highlight,
        backgroundColor: CryptoColors.background,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        textSelectionTheme: const TextSelectionThemeData(
          selectionHandleColor: CryptoColors.accent,
        ),
      ),
      home: StreamBuilder<LoginState>(
        stream: _bloc.loginState,
        builder: (context, snapshot) {

          LoginState? state = snapshot.data;
          if (state != null && state == LoginState.loggedIn) {
            return HomePage();
          } else {
            return const LoginPage();
          }
        }
      ),
    );
  }
}
