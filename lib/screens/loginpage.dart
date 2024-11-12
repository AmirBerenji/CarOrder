import 'package:car_order/brand_colors.dart';
import 'package:car_order/screens/mainpage.dart';
import 'package:car_order/screens/registrationpage.dart';
import 'package:car_order/widget/progress_dialog.dart';
import 'package:car_order/widget/taxi_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  LoginPage({super.key});

  static const String id = "login";

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = new TextEditingController();

  final TextEditingController passwordController = new TextEditingController();
  final FirebaseAuth _auth = FirebaseAuth.instance;
  void login() async {


    showDialog(
      barrierDismissible: false,
      context: context, builder: (BuildContext context) => ProgressDialog(status: 'Logging you in'));


    var user = (await _auth.signInWithEmailAndPassword(
            email: emailController.text, password: passwordController.text))
        .user;

    if (user != null) {
      var userRef = FirebaseDatabase.instance.ref().child('users/${user.uid}');
      userRef.once().then((value) => {
            
            if(value != null)
            {
                  
                Navigator.pushNamedAndRemoveUntil(
                    context, MainPage.id, (route) => false)
            }

          });
          Navigator.pop(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            const Image(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              image: AssetImage('images/logo.png'),
            ),
            const SizedBox(
              height: 40,
            ),
            const Text(
              'Sign In as a Rider',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextField(
                    keyboardType: TextInputType.emailAddress,
                    controller: emailController,
                    decoration: InputDecoration(
                        labelText: 'Email Addres',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        )),
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextField(
                    obscureText: true,
                    controller: passwordController,
                    decoration: InputDecoration(
                        labelText: 'Password',
                        labelStyle: TextStyle(
                          fontSize: 14,
                        ),
                        hintStyle: TextStyle(
                          color: Colors.grey,
                          fontSize: 10,
                        )),
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  TaxiButton(
                    color: BrandColors.colorGreen,
                    text: "LOGIN",
                    onPressed: () {
                      login();
                    },
                  )
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.restorablePushNamedAndRemoveUntil(
                    context, RegistrationPage.id, (route) => false);
              },
              child: const Text("Don't have an account, sign up here"),
            )
          ],
        ),
      ),
    );
  }
}
