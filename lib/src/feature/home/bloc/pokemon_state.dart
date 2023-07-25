part of 'pokemon_bloc.dart';

enum PokemonStatus { initial, loading, success, error }

@immutable
class PokemonState {
  final PokemonStatus pokemonStatus;
  final PokemonPage? pokemonPage;
  final Pokemon? pokemonSelected;
  final bool selecteableTeam;
  final List<String>? pokemonTeam;
  final int maxPokemonsByTeam;

  const PokemonState(
      {required this.pokemonStatus,
      this.pokemonPage,
      this.pokemonSelected,
      required this.selecteableTeam,
      this.pokemonTeam,
      required this.maxPokemonsByTeam});

  factory PokemonState.initial() => const PokemonState(
      pokemonStatus: PokemonStatus.initial,
      selecteableTeam: false,
      maxPokemonsByTeam: 6);

  PokemonState copyWith({
    PokemonStatus? pokemonStatus,
    PokemonPage? pokemonPage,
    Pokemon? pokemonSelected,
    bool? selecteableTeam,
    List<String>? pokemonTeam,
    int? maxPokemonsByTeam,
  }) {
    return PokemonState(
        pokemonSelected: pokemonSelected ?? this.pokemonSelected,
        pokemonStatus: pokemonStatus ?? this.pokemonStatus,
        pokemonPage: pokemonPage ?? this.pokemonPage,
        selecteableTeam: selecteableTeam ?? this.selecteableTeam,
        pokemonTeam: pokemonTeam ?? this.pokemonTeam,
        maxPokemonsByTeam: maxPokemonsByTeam ?? this.maxPokemonsByTeam
        // pokemonTeam: pokemonTeam != null
        //     ? this.pokemonTeam.add(pokemonTeam)
        //     : this.pokemonTeam,
        );
  }

  // List<int> addPokemonToTeam(int idPokemon) {
  //   if (pokemonTeam != null) {
  //     pokemonTeam!.add(idPokemon);
  //   }else{
  //    copyWith(pokemonTeam: 1);
  //   }
  // }
}
