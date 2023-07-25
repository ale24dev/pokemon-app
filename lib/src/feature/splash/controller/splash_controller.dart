// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_pokemon_app/src/feature/home/views/home_screen.dart';
import 'package:test_pokemon_app/src/feature/login/login_screen.dart';

abstract class SplashController {
  static Future<void> checkLogin(BuildContext context) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    ///Check if session is active
    if (sharedPreferences.getString('name') == null) {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const LoginScreen())));
    } else {
      Navigator.push(context,
          MaterialPageRoute(builder: ((context) => const HomeScreen())));
    }
  }
}
