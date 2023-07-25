part of 'pokemon_bloc.dart';

@immutable
abstract class PokemonEvent {}

class PokemonLoad extends PokemonEvent {}

class PokemonSelected extends PokemonEvent {
  final String url;

  PokemonSelected(this.url);
}

class PokemonTeamEnable extends PokemonEvent {}

class AddPokemonToTeam extends PokemonEvent {
  final String name;

  AddPokemonToTeam({required this.name});
}

class PokemonResetTeam extends PokemonEvent {}
