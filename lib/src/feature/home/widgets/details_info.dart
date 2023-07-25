import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/core/extensions.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/table_list_tile.dart';

class DetailsInfo extends StatelessWidget {
  const DetailsInfo({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Table(
            children: [
              TableRow(children: [
                const Leading(Text('Specie')),
                Detail(Text(pokemon.species.name!.capitalize(),
                    style: const TextStyle(fontWeight: FontWeight.w700))),
              ]),
              TableRow(children: [
                const Leading(Text('Height')),
                Detail(Text(
                  '${pokemon.height}cm',
                  style: const TextStyle(fontWeight: FontWeight.w700),
                )),
              ]),
              TableRow(children: [
                const Leading(Text('Weight')),
                Detail(Row(
                  children: [
                    Text('${pokemon.weight}lbs',
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                    const SizedBox.square(dimension: 5),
                    Text('(${(pokemon.weight / 2.2).toStringAsFixed(2)}kg)',
                        style: const TextStyle(fontWeight: FontWeight.w700)),
                  ],
                )),
              ]),
            ],
          ),
        )
      ],
    ));
  }
}
