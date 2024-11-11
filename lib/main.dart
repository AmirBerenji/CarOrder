import 'package:car_order/screens/loginpage.dart';
import 'package:car_order/screens/mainpage.dart';
import 'package:car_order/screens/registrationpage.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: const FirebaseOptions(
      apiKey: 'AIzaSyAARNFvbOkEU2kk_dU2c9rzli1n5ZFTwUA',
      appId: '1:500164612203:android:541e427edaefe5d92ba12e',
      messagingSenderId: '500164612203',
      projectId: 'geetaxi-c51a5',
      databaseURL:
          'https://geetaxi-c51a5-default-rtdb.asia-southeast1.firebasedatabase.app',
      storageBucket: 'geetaxi-c51a5.firebasestorage.app',
    ),
  );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Car Order',
      theme: ThemeData(
        fontFamily: 'Brand-Regular',
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: LoginPage.id,
      routes: {
        RegistrationPage.id: (context) =>  RegistrationPage(),
        LoginPage.id: (context) =>  LoginPage(),
        MainPage.id: (contexxt) => const MainPage()
      },
    );
  }
}
