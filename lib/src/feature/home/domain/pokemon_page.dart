import 'package:test_pokemon_app/src/feature/home/data/model/pokemon_page_model.dart';

class PokemonPage {
  final int count;
  final String next;
  final dynamic previous;
  final List<Result> results;

  const PokemonPage({
    required this.count,
    required this.next,
    required this.previous,
    required this.results,
  });
}
