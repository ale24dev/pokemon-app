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
    List<Result> results;

    PokemonPageModel({
        required this.count,
        required this.next,
        this.previous,
        required this.results,
    });

    factory PokemonPageModel.fromJson(Map<String, dynamic> json) => _$PokemonPageModelFromJson(json);

    Map<String, dynamic> toJson() => _$PokemonPageModelToJson(this);
}

@JsonSerializable()
class Result {
    @JsonKey(name:"name")
    String name;
    @JsonKey(name:"url")
    String url;

    Result({
        required this.name,
        required this.url,
    });

    factory Result.fromJson(Map<String, dynamic> json) => _$ResultFromJson(json);

    Map<String, dynamic> toJson() => _$ResultToJson(this);
}
