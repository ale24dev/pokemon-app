import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon_app/src/core/extensions.dart';
import 'package:test_pokemon_app/src/feature/home/bloc/pokemon_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_page_model.dart';
import 'package:test_pokemon_app/src/utils/utils.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemonPokemonResult,
    this.padding = 10,
  });

  final PokemonResult pokemonPokemonResult;
  final double padding;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PokemonBloc, PokemonState>(
      builder: (context, state) {
        final isInTeam = Utils.pokemonIsInTeam(
            listPokemons: state.pokemonTeam ?? [],
            pokemonName: pokemonPokemonResult.name);
        return Padding(
          padding: EdgeInsets.all(isInTeam ? 20 : 10),
          child: Container(
            height: 50,
            width: 50,
            decoration: BoxDecoration(
                color: isInTeam
                    ? const Color.fromARGB(163, 27, 24, 48)
                    : const Color.fromARGB(165, 90, 78, 160),
                borderRadius: BorderRadius.circular(20)),
            child: Align(
                alignment: Alignment.center,
                child: Text(
                  pokemonPokemonResult.name.capitalize(),
                  style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                      fontSize: 18),
                )),
          ),
        );
      },
    );
  }
}
