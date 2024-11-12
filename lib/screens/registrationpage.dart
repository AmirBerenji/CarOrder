import 'package:car_order/brand_colors.dart';
import 'package:car_order/screens/loginpage.dart';
import 'package:car_order/screens/mainpage.dart';
import 'package:car_order/widget/progress_dialog.dart';
import 'package:car_order/widget/taxi_button.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class RegistrationPage extends StatefulWidget {
  static const String id = "registration";

  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  // final GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final TextEditingController fullnameController = TextEditingController();

  final TextEditingController phoneController = TextEditingController();

  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> registerUser() async {

 showDialog(
      barrierDismissible: false,
      context: context, builder: (BuildContext context) => ProgressDialog(status: 'Logging you in'));



    var user = (await _auth
            .createUserWithEmailAndPassword(
                email: emailController.text, password: passwordController.text)
            .catchError((ex) {
      PlatformException eex = ex;
      print("Amir Insert Error: " + eex.message.toString());
    }))
        .user;

    if (user != null) {
      DatabaseReference newUserRef =
          FirebaseDatabase.instance.ref().child('users/${user.uid}');
      Map userMap = {
        'fullname': fullnameController.text,
        'email': emailController.text,
        'phone': phoneController.text
      };

      newUserRef.set(userMap);

      Navigator.pop(context);

      Navigator.pushNamedAndRemoveUntil(context, MainPage.id, (route) => false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 100),
            const Image(
              alignment: Alignment.center,
              width: 100,
              height: 100,
              image: AssetImage('images/logo.png'),
            ),
            const SizedBox(height: 40),
            const Text(
              'Create a Rider\'s Account',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 25, fontFamily: 'Brand-Bold'),
            ),
            Padding(
              padding: const EdgeInsets.all(30.0),
              child: Column(
                children: [
                  TextField(
                    controller: fullnameController,
                    keyboardType: TextInputType.text,
                    decoration: const InputDecoration(
                      labelText: 'Full name',
                      labelStyle: TextStyle(fontSize: 14),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: const InputDecoration(
                      labelText: 'Email Address',
                      labelStyle: TextStyle(fontSize: 14),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: phoneController,
                    keyboardType: TextInputType.phone,
                    decoration: const InputDecoration(
                      labelText: 'Phone number',
                      labelStyle: TextStyle(fontSize: 14),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: 'Password',
                      labelStyle: TextStyle(fontSize: 14),
                      hintStyle: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    style: const TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 40),
                  TaxiButton(
                    color: BrandColors.colorGreen,
                    text: "REGISTER",
                    onPressed: () {
                      // if(fullnameController.text.length < 3 )
                      // {
                      //     showSnakBar("title");
                      //     return;
                      // }

                      registerUser();
                    },
                  ),
                ],
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.restorablePushNamedAndRemoveUntil(
                  context,
                  LoginPage.id,
                  (route) => false,
                );
              },
              child: const Text("Already have a RIDER account? Log in"),
            ),
          ],
        ),
      ),
    );
  }
}
