import 'package:flutter/material.dart';
import 'package:flutter_lapor_book/pages/AddFormPage.dart';
import 'package:flutter_lapor_book/pages/DashboardPage.dart';
import 'package:flutter_lapor_book/pages/LoginPage.dart';
import 'package:flutter_lapor_book/pages/SplashPage.dart';
import 'package:flutter_lapor_book/pages/RegisterPage.dart';

void main() {
  runApp(MaterialApp(
    title: 'Lapor Book',
    initialRoute: '/',
    routes: {
      '/': (context) => SplashPage(),
      '/login': (context) => LoginPage(),
      '/register': (context) => RegisterPage(),
      '/dashboard': (context) => DashboardPage(),
      '/add': (context) => AddFormPage(),
    },
  ));
}
