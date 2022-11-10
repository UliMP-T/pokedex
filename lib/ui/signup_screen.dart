import 'package:amplify_auth_cognito/amplify_auth_cognito.dart';
import 'package:amplify_flutter/amplify_flutter.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  bool isSignUpComplete = false;

  TextEditingController _UsernameController = TextEditingController();
  TextEditingController _EmailController = TextEditingController();
  TextEditingController _PasswordConfirmationController =
      TextEditingController();
  TextEditingController _PasswordController = TextEditingController();
  TextEditingController _TOTPController = TextEditingController();

  Future<bool> _isUserSignedIn() async {
    final result = await Amplify.Auth.fetchAuthSession();
    print([result, '-----No user loged-----']);
    return result.isSignedIn;
  }

  Future<void> _signUpUser(
      String user, String mail, String pass, String confirm) async {
    try {
      final userAttributes = <CognitoUserAttributeKey, String>{
        CognitoUserAttributeKey.email: mail,
        CognitoUserAttributeKey.preferredUsername: mail,
        CognitoUserAttributeKey.phoneNumber: '+525533420550',
      };
      final result = await Amplify.Auth.signUp(
        username: user,
        password: confirm,
        options: CognitoSignUpOptions(userAttributes: userAttributes),
      );
      setState(() {
        isSignUpComplete = result.isSignUpComplete;
        print('Sending confirmation mail :D');
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  Future<void> _signOutCurrentUser() async {
    try {
      await Amplify.Auth.signOut();
    } on AuthException catch (e) {
      print(e.message);
    }
  }

  Future<AuthUser> _getCurrentUser() async {
    final user = await Amplify.Auth.getCurrentUser();
    return user;
  }

  Future<void> _confirmMFAUser(String totp) async {
    try {
      final result = await Amplify.Auth.confirmSignUp(
          confirmationCode: totp, username: _UsernameController.text);
      setState(() {
        isSignUpComplete = result.isSignUpComplete;

        print('MFAU Sended Successfully');
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  bool isSignedIn = false;

  // Future<void> signInUser(String username, String password) async {
  //   try {
  //     final result = await Amplify.Auth.signIn(
  //       username: username,
  //       password: password,
  //     );

  //     setState(() {
  //       isSignedIn = result.isSignedIn;
  //     });
  //   } on AuthException catch (e) {
  //     safePrint([e.message, 'CANNOT SIGN IN USER']);
  //   }
  // }

  Future<void> signInUser(String username, String password) async {
    try {
      final result = await Amplify.Auth.signIn(
        username: username,
        password: password,
        options: CognitoSignInOptions(
            authFlowType: AuthenticationFlowType.customAuth),
      );
      setState(() {
        isSignUpComplete = result.isSignedIn;

        print('-----User signed in Successfully-----');
      });
    } on AuthException catch (e) {
      safePrint(e.message);
    }
  }

  @override
  void initState() {
    super.initState();
    _isUserSignedIn();
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double screenHeight = MediaQuery.of(context).size.height;
    // TODO: implement build
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.all(20),
          height: screenHeight,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text('Signup'),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _UsernameController,
                  decoration: InputDecoration(label: Text('Username')),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _EmailController,
                  decoration: InputDecoration(label: Text('Email')),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _PasswordController,
                  decoration: InputDecoration(label: Text('Password')),
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _PasswordConfirmationController,
                  decoration:
                      InputDecoration(label: Text('Password confirmation')),
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                        onPressed: () {
                          signInUser(_UsernameController.text,
                              _PasswordController.text);
                        },
                        child: Text('Login')),
                    ElevatedButton(
                        onPressed: () {
                          _signUpUser(
                              _EmailController.text,
                              _UsernameController.text,
                              _PasswordController.text,
                              _PasswordConfirmationController.text);
                        },
                        child: Text('Register')),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                TextField(
                  controller: _TOTPController,
                  decoration:
                      InputDecoration(label: Text('Password confirmation')),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    onPressed: () {
                      _confirmMFAUser(_TOTPController.text);
                    },
                    child: Text('Code'))
              ],
            ),
          ),
        ),
      ),
      bottomSheet: Container(
        height: 60,
        width: screenWidth,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(bottom: 30),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
                onPressed: () {
                  _getCurrentUser();
                },
                child: Text('Is user signed in?')),
            ElevatedButton(onPressed: () {}, child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
