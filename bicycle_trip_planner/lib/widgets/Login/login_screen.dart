import 'package:flutter/material.dart';
import 'package:bicycle_trip_planner/constants.dart';
import 'package:bicycle_trip_planner/widgets/Login/forgot_password_screen.dart';
import 'package:bicycle_trip_planner/widgets/Login/background.dart';
import 'package:bicycle_trip_planner/widgets/Login/signup_screen.dart';
import 'package:bicycle_trip_planner/widgets/Login/welcome_screen.dart';
import 'package:bicycle_trip_planner/widgets/Login//components/already_have_account.dart';
import 'package:bicycle_trip_planner/widgets/Login//components/rounded_button.dart';
import 'package:bicycle_trip_planner/widgets/Login//components/rounded_input_field.dart';
import 'package:bicycle_trip_planner/widgets/Login//components/rounded_password_field.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:provider/provider.dart';
import '../../bloc/application_bloc.dart';
import 'components/error_snackbar.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final applicationBloc = Provider.of<ApplicationBloc>(context);
    Size size = MediaQuery.of(context).size;

    final _auth = FirebaseAuth.instance;
    late String email;
    late String password;
    return Scaffold(
        body: Background(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Login",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 20,
                  color: ThemeStyle.mainFontColor,
                ),
              ),
              Flexible(
                child: Image.asset(
                  "assets/login_image.png",
                  height: size.height * 0.35,
                ),
                flex: 1,
              ),
              Flexible(
                child: RoundedInputField(
                  key: Key("emailField"),
                  hintText: "Email",
                  onChanged: (value) {
                    email = value;
                  },
                ),
                flex: 2,
              ),
              RoundedPasswordField(
                  key: Key("passwordField"),
                  text: "Password",
                  onChanged: (value) {
                    password = value;
                  }
              ),
              RoundedButton(
                key: Key("login"),
                text: "Login",
                press: () async {
                  try {
                    final user = await _auth.signInWithEmailAndPassword(
                        email: email, password: password);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) {
                        return WelcomeScreen();
                      }),
                    );
                  } catch (e) {
                    ErrorSnackBar.buildErrorSnackbar(context, e.toString());
                  }
                },
              ),
              AlreadyHaveAnAccount(
                key: Key("signUp"),
                press: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return SignUpScreen();
                    }),
                  );
                },
              ),
              SizedBox(height: size.height * 0.01),
              GestureDetector(
                key: Key("resetPassword"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) {
                      return ForgotPasswordScreen();
                    }),
                  );
                },
                child: Text(
                  "Reset Password",
                  style: TextStyle(
                    color: ThemeStyle.secondaryFontColor,
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
              SizedBox(height: size.height * 0.02),
              BackButton(
                key: Key("back"),
              )
            ],
          ),
        ),
    );
  }
}
