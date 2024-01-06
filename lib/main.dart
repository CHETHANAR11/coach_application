import 'package:bounce_fit_coach/rive_app/home.dart';
import 'package:bounce_fit_coach/rive_app/on_boarding/on_boarding_view.dart';
//import 'package:bounce_fit_coach/rive_app/on_boarding/sign_in.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  RiveAppHome(),
    );
  }
}
