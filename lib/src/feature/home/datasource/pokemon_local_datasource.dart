import 'package:test_pokemon_app/src/feature/home/domain/pokemon_team.dart';

abstract class PokemonLocalDataSource {
  ///SAVE team of pokemons
  Future<bool> saveTeam(PokemonTeam team);

  //GET pokemon teams
  Future<List<PokemonTeam>> getTeams();
}
