import 'dart:convert';

import 'package:shared_preferences/shared_preferences.dart';
import 'package:test_pokemon_app/src/feature/home/datasource/pokemon_local_datasource.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_team.dart'; // Import this to use JSON encoding and decoding

class PokemonLocalRepository implements PokemonLocalDataSource{
  static const _teamsKey = 'teams_key';

  // Save a new team to SharedPreferences
   @override
  Future<bool> saveTeam(PokemonTeam team) async {
    final prefs = await SharedPreferences.getInstance();
    final existingTeams = await getTeams();
    existingTeams.add(team);
   return await prefs.setStringList(_teamsKey, _encodeTeams(existingTeams));
  }

  // Get all teams from SharedPreferences
   @override
  Future<List<PokemonTeam>> getTeams() async {
    final prefs = await SharedPreferences.getInstance();
    final teamsData = prefs.getStringList(_teamsKey);
    if (teamsData == null) {
      return [];
    }
    return _decodeTeams(teamsData);
  }

  // Encode teams data to a List<String>
  static List<String> _encodeTeams(List<PokemonTeam> teams) {
    return teams.map((team) => json.encode(team.toMap())).toList();
  }

  // Decode teams data from List<String> to a List<PokemonTeam>
  static List<PokemonTeam> _decodeTeams(List<String> teamsData) {
    return teamsData.map((teamData) {
      final Map<String, dynamic> parsedData = json.decode(teamData);
      return PokemonTeam.fromMap(parsedData);
    }).toList();
  }
}
