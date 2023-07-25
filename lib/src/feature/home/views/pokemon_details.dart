import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon_app/src/core/extensions.dart';
import 'package:test_pokemon_app/src/feature/home/bloc/pokemon_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/bottom_pokemon_details.dart';

class PokemonDetails extends StatelessWidget {
  const PokemonDetails({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        final content = switch (state.pokemonStatus) {
          PokemonStatus.initial => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          PokemonStatus.loading => const Scaffold(
              body: Center(
                child: CircularProgressIndicator(),
              ),
            ),
          PokemonStatus.error => const Scaffold(
              body: Center(
                child: Text('Unexpected error'),
              ),
            ),
          PokemonStatus.success ||  PokemonStatus.teamCreated => PokemonDetailsWidget(
              pokemon: state.pokemonSelected!,
            )
        };
        return content;
      },
    );
  }
}

class PokemonDetailsWidget extends StatefulWidget {
  const PokemonDetailsWidget({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  State<PokemonDetailsWidget> createState() => _PokemonDetailsWidgetState();
}

class _PokemonDetailsWidgetState extends State<PokemonDetailsWidget> {
  bool favoriteSelected = false;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 187, 211, 175),
      appBar: AppBar(
        title: Text(widget.pokemon.name.capitalize()),
        actions: [
          IconButton(
              onPressed: () {
                setState(() {
                  favoriteSelected = !favoriteSelected;
                });
              },
              icon: favoriteSelected
                  ? const Icon(
                      Icons.favorite,
                      color: Colors.red,
                    )
                  : const Icon(Icons.favorite_border))
        ],
      ),
      body: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: size.height * .4,
              width: double.infinity,
              child: Image.network(
                widget.pokemon.sprites!.backDefault!,
                fit: BoxFit.cover,
                height: 200,
              ),
            ),        
            BottomPokemonDetails(
              pokemon: widget.pokemon,
            )
          ],
        ),
      ),
    );
  }
}
