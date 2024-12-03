import 'package:cinepolis_app/views/cinema_screen.dart';
import 'package:cinepolis_app/views/dashboard_screen.dart';
import 'package:cinepolis_app/views/login_screen.dart';
import 'package:cinepolis_app/views/movie_screen.dart';
import 'package:cinepolis_app/views/mybooking_screen.dart';
import 'package:cinepolis_app/views/splash_screen.dart';
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
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color.fromRGBO(24, 30, 115, 1).withOpacity(1),
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue, // Warna utama
        ).copyWith(
          secondary: Color.fromRGBO( 19, 24, 92, 1).withOpacity(1), // Warna sekunder
        ),
        fontFamily: 'Helvetica'
      ),
      routes: {
        '/': (context) => SplashScreen(),
        '/login':(context) => LoginScreen(),
        '/dashboard':(context) => DashboardScreen(),
        '/mybooking': (context) => MybookingScreen(),
        '/movie':(context) => MovieScreen(),
        '/cinema':(context) => CinemaScreen(),

      },
    );
  }
}


