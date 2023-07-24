// To parse this JSON data, do
//
//     final pokemonPageModel = pokemonPageModelFromJson(jsonString);

import 'package:json_annotation/json_annotation.dart';
import 'dart:convert';

import 'package:test_pokemon_app/src/feature/home/domain/pokemon_page.dart';

part 'pokemon_page_model.g.dart';

PokemonPageModel pokemonPageModelFromJson(String str) => PokemonPageModel.fromJson(json.decode(str));

String pokemonPageModelToJson(PokemonPageModel data) => json.encode(data.toJson());

@JsonSerializable()
class PokemonPageModel implements PokemonPage{
    @override
  @JsonKey(name:"count")
    int count;
    @override
  @JsonKey(name:"next")
    String next;
    @override
  @JsonKey(name:"previous")
    dynamic previous;
    @override
  @JsonKey(name:"results")
    List<PokemonResult> pokemonResult;

    PokemonPageModel({
        required this.count,
        required this.next,
        this.previous,
        required this.pokemonResult,
    });

    factory PokemonPageModel.fromJson(Map<String, dynamic> json) => _$PokemonPageModelFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonPageModelToJson(this);
}

@JsonSerializable()
class PokemonResult {
    @JsonKey(name:"name")
    String name;
    @JsonKey(name:"url")
    String url;

    PokemonResult({
        required this.name,
        required this.url,
    });



    factory PokemonResult.fromJson(Map<String, dynamic> json) => _$PokemonResultFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonResultToJson(this);
}
