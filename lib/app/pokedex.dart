import 'package:flutter/material.dart';
import 'package:pokedex/amplifyconfiguration.dart';
import 'package:pokedex/presentation/resources/routes_manager.dart';
// import 'package:orbi/screens/splash_screen.dart';
import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_authenticator/amplify_authenticator.dart';
import 'package:amplify_flutter/amplify_flutter.dart';

class Pokedex extends StatefulWidget {
  Pokedex._internal();
  int appState = 0;

  static final Pokedex instance = Pokedex._internal();

  factory Pokedex() => instance;

  @override
  State<Pokedex> createState() => _PokedexState();
}

class _PokedexState extends State<Pokedex> {
  final _amplify = Amplify;
  // final _authService = AuthService();

  void _configureAmplify() async {
    try {
      await Amplify.addPlugin(AmplifyAuthCognito());
      await Amplify.configure(amplifyconfig);
      print('Successfully configured');
    } catch (e) {
      print('Could not configure Amplify ☠️');
    }
  }

  @override
  void initState() {
    super.initState();
    _configureAmplify();
  }

  @override
  Widget build(BuildContext context) {
    return Authenticator(
      initialStep: AuthenticatorStep.signIn,
      child: MaterialApp(
        // builder: Authenticator.builder(),
        debugShowCheckedModeBanner: false,
        title: 'Pokedex',
        themeMode: ThemeMode.system,
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.routes,
      ),
    );
  }
}
