// To parse this JSON data, do
//
//     final pokemonModel = pokemonModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';

part 'pokemon_model.g.dart';

PokemonModel pokemonModelFromJson(String str) =>
    PokemonModel.fromJson(json.decode(str));

String pokemonModelToJson(PokemonModel data) => json.encode(data.toJson());

@JsonSerializable()
class PokemonModel implements Pokemon {
  @override
  @JsonKey(name: "base_happiness")
  final int baseHappiness;
  @override
  @JsonKey(name: "capture_rate")
  int captureRate;
  @override
  @JsonKey(name: "color")
  Color color;
  @override
  @JsonKey(name: "egg_groups")
  List<Color> eggGroups;
  @override
  @JsonKey(name: "evolution_chain")
  EvolutionChain evolutionChain;
  @override
  @JsonKey(name: "evolves_from_species")
  dynamic evolvesFromSpecies;
  @override
  @JsonKey(name: "flavor_text_entries")
  List<FlavorTextEntry> flavorTextEntries;
  @override
  @JsonKey(name: "form_descriptions")
  List<dynamic> formDescriptions;
  @override
  @JsonKey(name: "forms_switchable")
  bool formsSwitchable;
  @override
  @JsonKey(name: "gender_rate")
  int genderRate;
  @override
  @JsonKey(name: "genera")
  List<Genus> genera;
  @override
  @JsonKey(name: "generation")
  Color generation;
  @override
  @JsonKey(name: "growth_rate")
  Color growthRate;
  @override
  @JsonKey(name: "habitat")
  Color habitat;
  @override
  @JsonKey(name: "has_gender_differences")
  bool hasGenderDifferences;
  @override
  @JsonKey(name: "hatch_counter")
  int hatchCounter;
  @override
  @JsonKey(name: "id")
  int id;
  @override
  @JsonKey(name: "is_baby")
  bool isBaby;
  @override
  @JsonKey(name: "is_legendary")
  bool isLegendary;
  @override
  @JsonKey(name: "is_mythical")
  bool isMythical;
  @override
  @JsonKey(name: "name")
  String name;
  @override
  @JsonKey(name: "names")
  List<Name> names;
  @override
  @JsonKey(name: "order")
  int order;
  @override
  @JsonKey(name: "pal_park_encounters")
  List<PalParkEncounter> palParkEncounters;
  @override
  @JsonKey(name: "pokedex_numbers")
  List<PokedexNumber> pokedexNumbers;
  @override
  @JsonKey(name: "shape")
  Color shape;
  @override
  @JsonKey(name: "varieties")
  List<Variety> varieties;

  PokemonModel({
    required this.baseHappiness,
    required this.captureRate,
    required this.color,
    required this.eggGroups,
    required this.evolutionChain,
    this.evolvesFromSpecies,
    required this.flavorTextEntries,
    required this.formDescriptions,
    required this.formsSwitchable,
    required this.genderRate,
    required this.genera,
    required this.generation,
    required this.growthRate,
    required this.habitat,
    required this.hasGenderDifferences,
    required this.hatchCounter,
    required this.id,
    required this.isBaby,
    required this.isLegendary,
    required this.isMythical,
    required this.name,
    required this.names,
    required this.order,
    required this.palParkEncounters,
    required this.pokedexNumbers,
    required this.shape,
    required this.varieties,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable()
class Color {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "url")
  String url;

  Color({
    required this.name,
    required this.url,
  });

  factory Color.fromJson(Map<String, dynamic> json) => _$ColorFromJson(json);

  Map<String, dynamic> toJson() => _$ColorToJson(this);
}

@JsonSerializable()
class EvolutionChain {
  @JsonKey(name: "url")
  String url;

  EvolutionChain({
    required this.url,
  });

  factory EvolutionChain.fromJson(Map<String, dynamic> json) =>
      _$EvolutionChainFromJson(json);

  Map<String, dynamic> toJson() => _$EvolutionChainToJson(this);
}

@JsonSerializable()
class FlavorTextEntry {
  @JsonKey(name: "flavor_text")
  String flavorText;
  @JsonKey(name: "language")
  Color language;
  @JsonKey(name: "version")
  Color version;

  FlavorTextEntry({
    required this.flavorText,
    required this.language,
    required this.version,
  });

  factory FlavorTextEntry.fromJson(Map<String, dynamic> json) =>
      _$FlavorTextEntryFromJson(json);

  Map<String, dynamic> toJson() => _$FlavorTextEntryToJson(this);
}

@JsonSerializable()
class Genus {
  @JsonKey(name: "genus")
  String genus;
  @JsonKey(name: "language")
  Color language;

  Genus({
    required this.genus,
    required this.language,
  });

  factory Genus.fromJson(Map<String, dynamic> json) => _$GenusFromJson(json);

  Map<String, dynamic> toJson() => _$GenusToJson(this);
}

@JsonSerializable()
class Name {
  @JsonKey(name: "language")
  Color language;
  @JsonKey(name: "name")
  String name;

  Name({
    required this.language,
    required this.name,
  });

  factory Name.fromJson(Map<String, dynamic> json) => _$NameFromJson(json);

  Map<String, dynamic> toJson() => _$NameToJson(this);
}

@JsonSerializable()
class PalParkEncounter {
  @JsonKey(name: "area")
  Color area;
  @JsonKey(name: "base_score")
  int baseScore;
  @JsonKey(name: "rate")
  int rate;

  PalParkEncounter({
    required this.area,
    required this.baseScore,
    required this.rate,
  });

  factory PalParkEncounter.fromJson(Map<String, dynamic> json) =>
      _$PalParkEncounterFromJson(json);

  Map<String, dynamic> toJson() => _$PalParkEncounterToJson(this);
}

@JsonSerializable()
class PokedexNumber {
  @JsonKey(name: "entry_number")
  int entryNumber;
  @JsonKey(name: "pokedex")
  Color pokedex;

  PokedexNumber({
    required this.entryNumber,
    required this.pokedex,
  });

  factory PokedexNumber.fromJson(Map<String, dynamic> json) =>
      _$PokedexNumberFromJson(json);

  Map<String, dynamic> toJson() => _$PokedexNumberToJson(this);
}

@JsonSerializable()
class Variety {
  @JsonKey(name: "is_default")
  bool isDefault;
  @JsonKey(name: "pokemon")
  Color pokemon;

  Variety({
    required this.isDefault,
    required this.pokemon,
  });

  factory Variety.fromJson(Map<String, dynamic> json) =>
      _$VarietyFromJson(json);

  Map<String, dynamic> toJson() => _$VarietyToJson(this);
}
