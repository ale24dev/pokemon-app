import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/core/extensions.dart';
import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_page_model.dart';

class PokemonCard extends StatelessWidget {
  const PokemonCard({
    super.key,
    required this.pokemonPokemonResult,
  });

  final PokemonResult pokemonPokemonResult;

  @override
  Widget build(BuildContext context) {
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
              pokemonPokemonResult.name.capitalize(),
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  color: Colors.white,
                  fontSize: 18),
            )),
      ),
    );
  }
}
