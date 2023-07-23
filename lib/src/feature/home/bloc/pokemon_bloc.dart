import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_page.dart';
import 'package:test_pokemon_app/src/feature/home/service/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({required PokemonRepository pokemonRepository})
      : super(PokemonState.initial()) {
    on<PokemonLoad>((event, emit) async {
      try {
        final pokemonPage = await pokemonRepository.getPageOfPokemons();
        emit(state.copyWith(
            pokemonStatus: PokemonStatus.success, pokemonPage: pokemonPage));
      } catch (e) {
        emit(state.copyWith(pokemonStatus: PokemonStatus.error));
      }
    });
  }
}
