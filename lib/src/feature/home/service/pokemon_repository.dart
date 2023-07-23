import 'dart:convert';

import 'package:test_pokemon_app/src/core/constants.dart';
import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_page_model.dart';
import 'package:test_pokemon_app/src/feature/home/datasource/pokemon_datasource.dart';
import 'package:http/http.dart' as http;
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_page.dart';

class PokemonRepository implements PokemonDataSource {
  @override
  Future<PokemonPage> getPageOfPokemons(
      {int pageCount = 150, int pageOffset = 150}) async {
    try {
      final response = await http.get(Uri.parse(
          '${Constants.BASE_URL}/pokemon-species/?offset=150&limit=150'));

      if (response.statusCode == 200) {
        final jsonDecoded = jsonDecode(response.body);
        final pokemonPage = pokemonPageModelFromJson(jsonDecoded);
        return pokemonPage;
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }
}
