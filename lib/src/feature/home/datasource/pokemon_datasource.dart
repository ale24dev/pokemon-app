import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';

abstract class PokemonDataSource {
  ///GET pagination of Pokemons
  Future<dynamic> getPageOfPokemons(
      {int pageCount = 150, int pageOffset = 150});

  ///GET Details of pokemon
  Future<Pokemon> getDetailsOfPokemon({required String url});
}
