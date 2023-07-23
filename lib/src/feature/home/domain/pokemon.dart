import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_model.dart';

class Pokemon {
  final int baseHappiness;
  final int captureRate;
  final Color color;
  final List<Color> eggGroups;
  final EvolutionChain evolutionChain;
  final dynamic evolvesFromSpecies;
  final List<FlavorTextEntry> flavorTextEntries;
  final List<dynamic> formDescriptions;
  final bool formsSwitchable;
  final int genderRate;
  final List<Genus> genera;
  final Color generation;
  final Color growthRate;
  final Color habitat;
  final bool hasGenderDifferences;
  final int hatchCounter;
  final int id;
  final bool isBaby;
  final bool isLegendary;
  final bool isMythical;
  final String name;
  final List<Name> names;
  final int order;
  final List<PalParkEncounter> palParkEncounters;
  final List<PokedexNumber> pokedexNumbers;
  final Color shape;
  final List<Variety> varieties;

  const Pokemon({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    required this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.hatchCounter,
    required this.hasGenderDifferences,
    required this.habitat,
    required this.growthRate,
    required this.generation,
    required this.genera,
    required this.genderRate,
    required this.formsSwitchable,
    required this.order,
    required this.names,
    required this.name,
    required this.isMythical,
    required this.isLegendary,
    required this.isBaby,
    required this.id,
    required this.palParkEncounters,
    required this.varieties,
    required this.shape,
    required this.pokedexNumbers,
  });
}
