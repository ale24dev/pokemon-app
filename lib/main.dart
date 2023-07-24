import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/bloc/pokemon_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/service/pokemon_repository.dart';
import 'package:test_pokemon_app/src/feature/splash/splash_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
            create: (BuildContext context) =>
                PokemonBloc(pokemonRepository: PokemonRepository()))
      ],
      child: MaterialApp(
          title: 'Test Pokemon App',
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
          ),
          home: const SplashScreen()),
    );
  }
}
