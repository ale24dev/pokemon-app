import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/core/extensions.dart';
import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_model.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/stats_bar.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/table_list_tile.dart';

class DetailStats extends StatelessWidget {
  const DetailStats({super.key, required this.pokemon});

  final Pokemon pokemon;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        itemCount: pokemon.stats.length,
        itemBuilder: (context, index) {
          Stat stat = pokemon.stats[index];
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Table(
              children: [
                TableRow(children: [
                  Leading(Text(stat.stat!.name!.capitalize())),
                  Leading(Text(
                    stat.baseStat.toString(),
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )),
                  Detail(StatsBar(
                    value: stat.baseStat!,
                  )),
                ])
              ],
            ),
          );
        },
      ),
    );
  }
}
