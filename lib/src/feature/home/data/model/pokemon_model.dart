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
  @JsonKey(name: "abilities")
  final List<Ability> abilities;
  @override
  @JsonKey(name: "base_experience")
  int baseExperience;
  @override
  @JsonKey(name: "forms")
  List<Species> forms;
  @override
  @JsonKey(name: "game_indices")
  List<GameIndex> gameIndices;
  @override
  @JsonKey(name: "height")
  int height;
  @override
  @JsonKey(name: "held_items")
  List<HeldItem> heldItems;
  @override
  @JsonKey(name: "id")
  int id;
  @override
  @JsonKey(name: "is_default")
  bool isDefault;
  @override
  @JsonKey(name: "location_area_encounters")
  String locationAreaEncounters;
  @override
  @JsonKey(name: "moves")
  List<Move> moves;
  @override
  @JsonKey(name: "name")
  String name;
  @override
  @JsonKey(name: "order")
  int order;
  @override
  @JsonKey(name: "past_types")
  List<dynamic> pastTypes;
  @override
  @JsonKey(name: "species")
  Species species;
  @override
  @JsonKey(name: "sprites")
  Sprites sprites;
  @override
  @JsonKey(name: "stats")
  List<Stat> stats;
  @override
  @JsonKey(name: "types")
  List<Type> types;
  @override
  @JsonKey(name: "weight")
  int weight;

  PokemonModel({
    required this.abilities,
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
    required this.sprites,
    required this.stats,
    required this.types,
    required this.weight,
  });

  factory PokemonModel.fromJson(Map<String, dynamic> json) =>
      _$PokemonModelFromJson(json);

  Map<String, dynamic> toJson() => _$PokemonModelToJson(this);
}

@JsonSerializable()
class Ability {
  @JsonKey(name: "ability")
  Species ability;
  @JsonKey(name: "is_hidden")
  bool isHidden;
  @JsonKey(name: "slot")
  int slot;

  Ability({
    required this.ability,
    required this.isHidden,
    required this.slot,
  });

  factory Ability.fromJson(Map<String, dynamic> json) =>
      _$AbilityFromJson(json);

  Map<String, dynamic> toJson() => _$AbilityToJson(this);
}

@JsonSerializable()
class Species {
  @JsonKey(name: "name")
  String name;
  @JsonKey(name: "url")
  String url;

  Species({
    required this.name,
    required this.url,
  });

  factory Species.fromJson(Map<String, dynamic> json) =>
      _$SpeciesFromJson(json);

  Map<String, dynamic> toJson() => _$SpeciesToJson(this);
}

@JsonSerializable()
class GameIndex {
  @JsonKey(name: "game_index")
  int gameIndex;
  @JsonKey(name: "version")
  Species version;

  GameIndex({
    required this.gameIndex,
    required this.version,
  });

  factory GameIndex.fromJson(Map<String, dynamic> json) =>
      _$GameIndexFromJson(json);

  Map<String, dynamic> toJson() => _$GameIndexToJson(this);
}

@JsonSerializable()
class HeldItem {
  @JsonKey(name: "item")
  Species item;
  @JsonKey(name: "version_details")
  List<VersionDetail> versionDetails;

  HeldItem({
    required this.item,
    required this.versionDetails,
  });

  factory HeldItem.fromJson(Map<String, dynamic> json) =>
      _$HeldItemFromJson(json);

  Map<String, dynamic> toJson() => _$HeldItemToJson(this);
}

@JsonSerializable()
class VersionDetail {
  @JsonKey(name: "rarity")
  int rarity;
  @JsonKey(name: "version")
  Species version;

  VersionDetail({
    required this.rarity,
    required this.version,
  });

  factory VersionDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VersionDetailToJson(this);
}

@JsonSerializable()
class Move {
  @JsonKey(name: "move")
  Species move;
  @JsonKey(name: "version_group_details")
  List<VersionGroupDetail> versionGroupDetails;

  Move({
    required this.move,
    required this.versionGroupDetails,
  });

  factory Move.fromJson(Map<String, dynamic> json) => _$MoveFromJson(json);

  Map<String, dynamic> toJson() => _$MoveToJson(this);
}

@JsonSerializable()
class VersionGroupDetail {
  @JsonKey(name: "level_learned_at")
  int levelLearnedAt;
  @JsonKey(name: "move_learn_method")
  Species moveLearnMethod;
  @JsonKey(name: "version_group")
  Species versionGroup;

  VersionGroupDetail({
    required this.levelLearnedAt,
    required this.moveLearnMethod,
    required this.versionGroup,
  });

  factory VersionGroupDetail.fromJson(Map<String, dynamic> json) =>
      _$VersionGroupDetailFromJson(json);

  Map<String, dynamic> toJson() => _$VersionGroupDetailToJson(this);
}

@JsonSerializable()
class GenerationV {
  @JsonKey(name: "black-white")
  Sprites blackWhite;

  GenerationV({
    required this.blackWhite,
  });

  factory GenerationV.fromJson(Map<String, dynamic> json) =>
      _$GenerationVFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationVToJson(this);
}

@JsonSerializable()
class GenerationIv {
  @JsonKey(name: "diamond-pearl")
  Sprites diamondPearl;
  @JsonKey(name: "heartgold-soulsilver")
  Sprites heartgoldSoulsilver;
  @JsonKey(name: "platinum")
  Sprites platinum;

  GenerationIv({
    required this.diamondPearl,
    required this.heartgoldSoulsilver,
    required this.platinum,
  });

  factory GenerationIv.fromJson(Map<String, dynamic> json) =>
      _$GenerationIvFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIvToJson(this);
}

@JsonSerializable()
class Versions {
  @JsonKey(name: "generation-i")
  GenerationI generationI;
  @JsonKey(name: "generation-ii")
  GenerationIi generationIi;
  @JsonKey(name: "generation-iii")
  GenerationIii generationIii;
  @JsonKey(name: "generation-iv")
  GenerationIv generationIv;
  @JsonKey(name: "generation-v")
  GenerationV generationV;
  @JsonKey(name: "generation-vi")
  Map<String, Home> generationVi;
  @JsonKey(name: "generation-vii")
  GenerationVii generationVii;
  @JsonKey(name: "generation-viii")
  GenerationViii generationViii;

  Versions({
    required this.generationI,
    required this.generationIi,
    required this.generationIii,
    required this.generationIv,
    required this.generationV,
    required this.generationVi,
    required this.generationVii,
    required this.generationViii,
  });

  factory Versions.fromJson(Map<String, dynamic> json) =>
      _$VersionsFromJson(json);

  Map<String, dynamic> toJson() => _$VersionsToJson(this);
}

@JsonSerializable()
class Sprites {
  @JsonKey(name: "back_default")
  String backDefault;
  @JsonKey(name: "back_female")
  dynamic backFemale;
  @JsonKey(name: "back_shiny")
  String backShiny;
  @JsonKey(name: "back_shiny_female")
  dynamic backShinyFemale;
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_female")
  dynamic frontFemale;
  @JsonKey(name: "front_shiny")
  String frontShiny;
  @JsonKey(name: "front_shiny_female")
  dynamic frontShinyFemale;
  @JsonKey(name: "other")
  Other? other;
  @JsonKey(name: "versions")
  Versions? versions;
  @JsonKey(name: "animated")
  Sprites? animated;

  Sprites({
    required this.backDefault,
    this.backFemale,
    required this.backShiny,
    this.backShinyFemale,
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
    this.other,
    this.versions,
    this.animated,
  });

  factory Sprites.fromJson(Map<String, dynamic> json) =>
      _$SpritesFromJson(json);

  Map<String, dynamic> toJson() => _$SpritesToJson(this);
}

@JsonSerializable()
class GenerationI {
  @JsonKey(name: "red-blue")
  RedBlue redBlue;
  @JsonKey(name: "yellow")
  RedBlue yellow;

  GenerationI({
    required this.redBlue,
    required this.yellow,
  });

  factory GenerationI.fromJson(Map<String, dynamic> json) =>
      _$GenerationIFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIToJson(this);
}

@JsonSerializable()
class RedBlue {
  @JsonKey(name: "back_default")
  String backDefault;
  @JsonKey(name: "back_gray")
  String backGray;
  @JsonKey(name: "back_transparent")
  String backTransparent;
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_gray")
  String frontGray;
  @JsonKey(name: "front_transparent")
  String frontTransparent;

  RedBlue({
    required this.backDefault,
    required this.backGray,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontGray,
    required this.frontTransparent,
  });

  factory RedBlue.fromJson(Map<String, dynamic> json) =>
      _$RedBlueFromJson(json);

  Map<String, dynamic> toJson() => _$RedBlueToJson(this);
}

@JsonSerializable()
class GenerationIi {
  @JsonKey(name: "crystal")
  Crystal crystal;
  @JsonKey(name: "gold")
  Gold gold;
  @JsonKey(name: "silver")
  Gold silver;

  GenerationIi({
    required this.crystal,
    required this.gold,
    required this.silver,
  });

  factory GenerationIi.fromJson(Map<String, dynamic> json) =>
      _$GenerationIiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiToJson(this);
}

@JsonSerializable()
class Crystal {
  @JsonKey(name: "back_default")
  String backDefault;
  @JsonKey(name: "back_shiny")
  String backShiny;
  @JsonKey(name: "back_shiny_transparent")
  String backShinyTransparent;
  @JsonKey(name: "back_transparent")
  String backTransparent;
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_shiny")
  String frontShiny;
  @JsonKey(name: "front_shiny_transparent")
  String frontShinyTransparent;
  @JsonKey(name: "front_transparent")
  String frontTransparent;

  Crystal({
    required this.backDefault,
    required this.backShiny,
    required this.backShinyTransparent,
    required this.backTransparent,
    required this.frontDefault,
    required this.frontShiny,
    required this.frontShinyTransparent,
    required this.frontTransparent,
  });

  factory Crystal.fromJson(Map<String, dynamic> json) =>
      _$CrystalFromJson(json);

  Map<String, dynamic> toJson() => _$CrystalToJson(this);
}

@JsonSerializable()
class Gold {
  @JsonKey(name: "back_default")
  String backDefault;
  @JsonKey(name: "back_shiny")
  String backShiny;
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_shiny")
  String frontShiny;
  @JsonKey(name: "front_transparent")
  String? frontTransparent;

  Gold({
    required this.backDefault,
    required this.backShiny,
    required this.frontDefault,
    required this.frontShiny,
    this.frontTransparent,
  });

  factory Gold.fromJson(Map<String, dynamic> json) => _$GoldFromJson(json);

  Map<String, dynamic> toJson() => _$GoldToJson(this);
}

@JsonSerializable()
class GenerationIii {
  @JsonKey(name: "emerald")
  OfficialArtwork emerald;
  @JsonKey(name: "firered-leafgreen")
  Gold fireredLeafgreen;
  @JsonKey(name: "ruby-sapphire")
  Gold rubySapphire;

  GenerationIii({
    required this.emerald,
    required this.fireredLeafgreen,
    required this.rubySapphire,
  });

  factory GenerationIii.fromJson(Map<String, dynamic> json) =>
      _$GenerationIiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationIiiToJson(this);
}

@JsonSerializable()
class OfficialArtwork {
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_shiny")
  String frontShiny;

  OfficialArtwork({
    required this.frontDefault,
    required this.frontShiny,
  });

  factory OfficialArtwork.fromJson(Map<String, dynamic> json) =>
      _$OfficialArtworkFromJson(json);

  Map<String, dynamic> toJson() => _$OfficialArtworkToJson(this);
}

@JsonSerializable()
class Home {
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_female")
  dynamic frontFemale;
  @JsonKey(name: "front_shiny")
  String frontShiny;
  @JsonKey(name: "front_shiny_female")
  dynamic frontShinyFemale;

  Home({
    required this.frontDefault,
    this.frontFemale,
    required this.frontShiny,
    this.frontShinyFemale,
  });

  factory Home.fromJson(Map<String, dynamic> json) => _$HomeFromJson(json);

  Map<String, dynamic> toJson() => _$HomeToJson(this);
}

@JsonSerializable()
class GenerationVii {
  @JsonKey(name: "icons")
  DreamWorld icons;
  @JsonKey(name: "ultra-sun-ultra-moon")
  Home ultraSunUltraMoon;

  GenerationVii({
    required this.icons,
    required this.ultraSunUltraMoon,
  });

  factory GenerationVii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiToJson(this);
}

@JsonSerializable()
class DreamWorld {
  @JsonKey(name: "front_default")
  String frontDefault;
  @JsonKey(name: "front_female")
  dynamic frontFemale;

  DreamWorld({
    required this.frontDefault,
    this.frontFemale,
  });

  factory DreamWorld.fromJson(Map<String, dynamic> json) =>
      _$DreamWorldFromJson(json);

  Map<String, dynamic> toJson() => _$DreamWorldToJson(this);
}

@JsonSerializable()
class GenerationViii {
  @JsonKey(name: "icons")
  DreamWorld icons;

  GenerationViii({
    required this.icons,
  });

  factory GenerationViii.fromJson(Map<String, dynamic> json) =>
      _$GenerationViiiFromJson(json);

  Map<String, dynamic> toJson() => _$GenerationViiiToJson(this);
}

@JsonSerializable()
class Other {
  @JsonKey(name: "dream_world")
  DreamWorld dreamWorld;
  @JsonKey(name: "home")
  Home home;
  @JsonKey(name: "official-artwork")
  OfficialArtwork officialArtwork;

  Other({
    required this.dreamWorld,
    required this.home,
    required this.officialArtwork,
  });

  factory Other.fromJson(Map<String, dynamic> json) => _$OtherFromJson(json);

  Map<String, dynamic> toJson() => _$OtherToJson(this);
}

@JsonSerializable()
class Stat {
  @JsonKey(name: "base_stat")
  int baseStat;
  @JsonKey(name: "effort")
  int effort;
  @JsonKey(name: "stat")
  Species stat;

  Stat({
    required this.baseStat,
    required this.effort,
    required this.stat,
  });

  factory Stat.fromJson(Map<String, dynamic> json) => _$StatFromJson(json);

  Map<String, dynamic> toJson() => _$StatToJson(this);
}

@JsonSerializable()
class Type {
  @JsonKey(name: "slot")
  int slot;
  @JsonKey(name: "type")
  Species type;

  Type({
    required this.slot,
    required this.type,
  });

  factory Type.fromJson(Map<String, dynamic> json) => _$TypeFromJson(json);

  Map<String, dynamic> toJson() => _$TypeToJson(this);
}
