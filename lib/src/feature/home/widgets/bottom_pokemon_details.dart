import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/detail_stats.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/details_info.dart';

class BottomPokemonDetails extends StatefulWidget {
  const BottomPokemonDetails({
    super.key,
    required this.pokemon,
  });

  final Pokemon pokemon;

  @override
  State<BottomPokemonDetails> createState() => _BottomPokemonDetailsState();
}

class _BottomPokemonDetailsState extends State<BottomPokemonDetails> {
  int indexCategorySelected = 0;

  void setCategoryCallback(int categoryIndex) {
    setState(() {
      indexCategorySelected = categoryIndex;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: Container(
      decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20), topRight: Radius.circular(20))),
      child: Column(
        children: [
          _CategoryPokemonDetails(setCategoryCallback: setCategoryCallback),
          indexCategorySelected == 0
              ? DetailsInfo(
                  pokemon: widget.pokemon,
                )
              : DetailStats(pokemon: widget.pokemon),
        ],
      ),
    ));
  }
}

class _CategoryPokemonDetails extends StatefulWidget {
  const _CategoryPokemonDetails({required this.setCategoryCallback});

  final Function setCategoryCallback;

  @override
  State<_CategoryPokemonDetails> createState() =>
      _CategoryPokemonDetailsState();
}

class _CategoryPokemonDetailsState extends State<_CategoryPokemonDetails> {
  int indexCategorySelected = 0;
  final categories = ['Info', 'Stats'];
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: double.infinity,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: categories.asMap().entries.map((e) {
              final index = e.key;
              final value = e.value;
              return InkWell(
                onTap: () {
                  setState(() {
                    indexCategorySelected = index;
                    widget.setCategoryCallback(indexCategorySelected);
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(14.0),
                  child: Column(
                    children: [
                      Text(
                        value,
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 17,
                            fontWeight: index == indexCategorySelected
                                ? FontWeight.w600
                                : FontWeight.normal,
                            color: index == indexCategorySelected
                                ? Colors.black
                                : Colors.grey),
                      ),
                      Container(
                        height: 1.4,
                        width: 60,
                        color: index == indexCategorySelected
                            ? const Color.fromARGB(165, 90, 78, 160)
                            : Colors.white,
                      )
                    ],
                  ),
                ),
              );
            }).toList()),
      ),
    );
  }
}
