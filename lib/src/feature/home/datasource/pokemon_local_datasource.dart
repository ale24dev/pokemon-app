
abstract class PokemonLocalDataSource {
  ///Get pagination of Pokemons
  Future<dynamic> getPageOfPokemons({int pageCount = 150, int pageOffset = 150});
}
