// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_pokemon_app/src/core/widgets/generic_text_field.dart';
import 'package:test_pokemon_app/src/feature/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final nameController = TextEditingController();

  bool isValidName = true;

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Registrar Sesión',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge
                  ?.copyWith(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            GenericTextField(
                controller: nameController,
                labelText: 'Nombre',
                textInputAction: TextInputAction.done),
            const SizedBox.square(
              dimension: 20,
            ),
            if (!isValidName)
              const Align(
                alignment: Alignment.center,
                child: Text(
                  'Debe insertar su nombre antes de guardar',
                  style: TextStyle(color: Colors.red),
                ),
              ),
            SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () async {
                      if (nameController.text.isEmpty) {
                        setState(() {
                          isValidName = false;
                        });
                      } else {
                        SharedPreferences sharedPreferences =
                            await SharedPreferences.getInstance();
                        sharedPreferences.setString(
                            'name', nameController.text);

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => const HomeScreen()));
                      }
                    },
                    child: const Text('Guardar')))
          ],
        ),
      ),
    );
  }
}
