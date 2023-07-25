import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/bloc/pokemon_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/views/pokemon_details.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/pokemon_card.dart';

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
        title: const Text('Pokedex'),
      ),
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
                itemCount: state.pokemonPage!.pokemonResult.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 150,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final pokemonPokemonResult =
                      state.pokemonPage!.pokemonResult[index];
                  return GestureDetector(
                      onTap: () {
                        context
                            .read<PokemonBloc>()
                            .add(PokemonSelected(pokemonPokemonResult.url));
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: ((context) =>
                                    const PokemonDetails())));
                      },
                      child: PokemonCard(
                          pokemonPokemonResult: pokemonPokemonResult));
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
