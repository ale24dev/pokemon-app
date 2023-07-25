abstract class Utils {
  ///Function to know if [pokemonName] is in team
  static bool pokemonIsInTeam(
      {required List<String> listPokemons, required String pokemonName}) {
    for (var pokemon in listPokemons) {
      if (pokemon.toLowerCase().compareTo(pokemonName.toLowerCase()) == 0) {
        return true;
      }
    }
    return false;
  }
}
