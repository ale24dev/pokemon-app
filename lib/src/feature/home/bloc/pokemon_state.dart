part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, loading, success, error }

@immutable
class PokemonState {
  final PokemonStatus pokemonStatus;
  final PokemonPage? pokemonPage;

  const PokemonState({required this.pokemonStatus, this.pokemonPage});

  factory PokemonState.initial() =>
      const PokemonState(pokemonStatus: PokemonStatus.initial);

  PokemonState copyWith({
    PokemonStatus? pokemonStatus,
    PokemonPage? pokemonPage,
  }) {
    return PokemonState(
      pokemonStatus: pokemonStatus ?? this.pokemonStatus,
      pokemonPage: pokemonPage ?? this.pokemonPage,
    );
  }
}
