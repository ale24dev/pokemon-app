import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_page.dart';
import 'package:test_pokemon_app/src/feature/home/service/pokemon_repository.dart';

part 'pokemon_event.dart';
part 'pokemon_state.dart';

class PokemonBloc extends Bloc<PokemonEvent, PokemonState> {
  PokemonBloc({required PokemonRepository pokemonRepository})
      : super(PokemonState.initial()) {
    on<PokemonLoad>((event, emit) async {
      emit(state.copyWith(pokemonStatus: PokemonStatus.loading));
      try {
        final pokemonPage = await pokemonRepository.getPageOfPokemons();
        emit(state.copyWith(
            pokemonStatus: PokemonStatus.success, pokemonPage: pokemonPage));
      } catch (e) {
        emit(state.copyWith(pokemonStatus: PokemonStatus.error));
      }
    });

    on<PokemonSelected>((event, emit) async {
      emit(state.copyWith(pokemonStatus: PokemonStatus.loading));
      try {
        final pokemon =
            await pokemonRepository.getDetailsOfPokemon(url: event.url);
        emit(state.copyWith(
            pokemonStatus: PokemonStatus.success, pokemonSelected: pokemon));
      } catch (e) {
        emit(state.copyWith(pokemonStatus: PokemonStatus.error));
      }
    });
  }
}
