import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_model.dart';

class Pokemon {
  final List<Ability> abilities;
  final int baseExperience;
  final List<Species> forms;
  final List<GameIndex> gameIndices;
  final int height;
  final List<HeldItem> heldItems;
  final int id;
  final bool isDefault;
  final String locationAreaEncounters;
  final List<Move> moves;
  final String name;
  final int order;
  final List<dynamic> pastTypes;
  final Species species;
  final Sprites? sprites;
  final List<Stat> stats;
  final List<Type> types;
  final int weight;

  const Pokemon(
      {required this.abilities,
      required this.baseExperience,
      required this.forms,
      required this.gameIndices,
      required this.height,
      required this.heldItems,
      required this.id,
      required this.isDefault,
      required this.locationAreaEncounters,
      required this.moves,
      required this.name,
      required this.order,
      required this.pastTypes,
      required this.species,
      this.sprites,
      required this.stats,
      required this.types,
      required this.weight});
}
