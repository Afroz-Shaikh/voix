import 'package:flutter/material.dart';
import 'package:voix/views/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Voix',
      theme: ThemeData.dark().copyWith(
        brightness: Brightness.dark,
        appBarTheme: const AppBarTheme(backgroundColor: Colors.black),
        scaffoldBackgroundColor: Colors.black,
        primaryColor: Color(0xffD4EB46),
        iconTheme: const IconThemeData().copyWith(color: Colors.white),
        textTheme: TextTheme(
          headline2: const TextStyle(
            color: Colors.white,
            fontSize: 32.0,
            fontWeight: FontWeight.bold,
          ),
          // headline4: TextStyle(
          //   fontSize: 12.0,
          //   color: Colors.grey[300],
          //   fontWeight: FontWeight.w500,
          //   letterSpacing: 2.0,
          // ),
          bodyText1: TextStyle(
            color: Color(0xff676767),
            fontSize: 30.0,
            fontWeight: FontWeight.w600,
            letterSpacing: 1.0,
          ),
          bodyText2: TextStyle(
              fontSize: 16, fontWeight: FontWeight.normal, color: Colors.white),
        ),
      ),
      home: HomePage(),
    );
  }
}
