import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:prototypes/screens/SignUp/background.dart';
import 'package:prototypes/screens/components/back_button_to_welcome.dart';
import 'package:prototypes/screens/components/rounded_button.dart';
import 'package:prototypes/screens/components/rounded_input_field.dart';
import '../../constants.dart';

class Body extends StatefulWidget {

  const Body({
    Key? key,
  }) : super(key: key);

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  late String email;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "Reset Password",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20,
              color: mainFontColor,
            ),
          ),
          Image.asset(
            "assets/images/reset_password_image.png",
            height: size.height * 0.35,
          ),
          Text(
            "Please enter your email to reset password",
            style: TextStyle(
                color: secondaryFontColor,
            ),
          ),
          RoundedInputField(
            hintText: "Email",
            onChanged: (value) {
              email = value;
            },
          ),
          RoundedButton(
            text: "Send email to reset password",
            press: resetPassword, // to be modified...
          ),
          back_button(),
        ],
      ),
    );
  }
  Future resetPassword() async{
    try{
      await FirebaseAuth.instance.sendPasswordResetEmail(email: email);
    }catch(e){
       ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString()), duration: const Duration(seconds: 3),backgroundColor: Colors.blue));
    }
  }
}


