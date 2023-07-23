import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/bloc/pokemon_bloc.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Initialize all pokemons
  @override
  void initState() {
    context.read<PokemonBloc>().add(PokemonLoad());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.menu),
        title: const Text('Pokedex'),),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          final content = switch (state.pokemonStatus) {
            PokemonStatus.initial => const Center(
                child: CircularProgressIndicator(),
              ),
            PokemonStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
            PokemonStatus.error => const Text('Unexpected error'),
            PokemonStatus.success => GridView.builder(
                itemCount: state.pokemonPage!.results.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 150,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final pokemonResult = state.pokemonPage!.results[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: const Color.fromARGB(165, 90, 78, 160),
                          borderRadius: BorderRadius.circular(20)),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text(
                            pokemonResult.name,
                          )),
                    ),
                  );
                },
              )
          };
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: content,
          );
        },
      ),
    );
  }
}
