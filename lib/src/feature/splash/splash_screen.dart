import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/feature/splash/controller/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 800)).then((value) {
      SplashController.checkLogin(context);
    });
    return const Scaffold(
      body: SizedBox(
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Cargando...'),
            SizedBox.square(
              dimension: 10,
            ),
            CircularProgressIndicator()
          ],
        ),
      ),
    );
  }
}
