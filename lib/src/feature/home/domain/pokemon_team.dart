class PokemonTeam {
  final String teamName;
  final List<String> pokemonNames;

  PokemonTeam({required this.teamName, required this.pokemonNames});

  // Convert the team data to a Map
  Map<String, dynamic> toMap() {
    return {
      'teamName': teamName,
      'pokemonNames': pokemonNames,
    };
  }

  // Create a PokemonTeam from a Map
  factory PokemonTeam.fromMap(Map<String, dynamic> map) {
    return PokemonTeam(
      teamName: map['teamName'],
      pokemonNames: List<String>.from(map['pokemonNames']),
    );
  }
}
