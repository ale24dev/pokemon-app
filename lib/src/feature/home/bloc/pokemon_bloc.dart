import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_page.dart';
import 'package:test_pokemon_app/src/feature/home/service/pokemon_repository.dart';
import 'package:test_pokemon_app/src/utils/utils.dart';

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

    on<PokemonTeamEnable>((event, emit) async {
      emit(state.copyWith(selecteableTeam: true));
    });

    on<AddPokemonToTeam>((event, emit) async {
      // Check if the Pokémon is already in the team
      if (state.pokemonTeam != null &&
          Utils.pokemonIsInTeam(
              listPokemons: state.pokemonTeam!, pokemonName: event.name)) {
        // If the Pokémon is already in the team, remove it from the team
        final updatedTeam = state.pokemonTeam!
            .where((pokemon) => pokemon != event.name)
            .toList();
        emit(state.copyWith(pokemonTeam: updatedTeam));
      } else {
        if (state.pokemonTeam == null) {
          // If the team is empty, add the new Pokémon to the team
          emit(state.copyWith(pokemonTeam: [event.name]));
        } else if (state.pokemonTeam!.length < state.maxPokemonsByTeam) {
          // If the team is not full, add the new Pokémon to the team
          emit(
              state.copyWith(pokemonTeam: [...state.pokemonTeam!, event.name]));
        }
      }
    });

    on<PokemonResetTeam>((event, emit) async {
      emit(state.copyWith(
          pokemonTeam: [],
          pokemonSelected: null,
          pokemonStatus: PokemonStatus.teamCreated));
    });

    on<PokemonChangeStatus>((event, emit) async {
      emit(state.copyWith(pokemonStatus: event.pokemonStatus));
    });
  }
}
