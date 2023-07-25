// ignore_for_file: use_build_context_synchronously

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test_pokemon_app/src/core/widgets/drawer.dart';
import 'package:test_pokemon_app/src/core/widgets/generic_text_field.dart';
import 'package:test_pokemon_app/src/feature/home/bloc/pokemon_bloc.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_team.dart';
import 'package:test_pokemon_app/src/feature/home/service/pokemon_local_repository.dart';
import 'package:test_pokemon_app/src/feature/home/views/pokemon_details.dart';
import 'package:test_pokemon_app/src/feature/home/widgets/pokemon_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  ///Initialize all pokemons
  @override
  void initState() {
    context.read<PokemonBloc>().add(PokemonLoad());
    super.initState();
  }

  void showSnackbar(BuildContext context, String message) {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          backgroundColor: Colors.green,
          content: Text(message),
          duration: const Duration(seconds: 3),
        ),
      );
      context
          .read<PokemonBloc>()
          .add(PokemonChangeStatus(pokemonStatus: PokemonStatus.success));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokedex'),
      ),
      drawer: const DrawerScreen(),
      body: BlocBuilder<PokemonBloc, PokemonState>(
        builder: (context, state) {
          if (PokemonStatus.teamCreated == state.pokemonStatus) {
            showSnackbar(context, 'Se ha guardado el equipo correctamente');
          }
          if (context.read<PokemonBloc>().state.pokemonTeam?.length == 6) {
            WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
              showDialog(
                  context: context,
                  builder: ((context) {
                    return _AddPokemonTeam(
                      pokemonTeam: state.pokemonTeam!,
                      pokemonLocalRepository: PokemonLocalRepository(),
                    );
                  }));
            });
          }
          final content = switch (state.pokemonStatus) {
            PokemonStatus.initial => const Center(
                child: CircularProgressIndicator(),
              ),
            PokemonStatus.loading => const Center(
                child: CircularProgressIndicator(),
              ),
            PokemonStatus.error => const Text('Unexpected error'),
            PokemonStatus.success ||
            PokemonStatus.teamCreated =>
              GridView.builder(
                itemCount: state.pokemonPage!.pokemonResult.length,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisSpacing: 5,
                    mainAxisSpacing: 20,
                    mainAxisExtent: 150,
                    crossAxisCount: 2),
                itemBuilder: (context, index) {
                  final pokemonPokemonResult =
                      state.pokemonPage!.pokemonResult[index];
                  return GestureDetector(
                      onTap: () {
                        if (state.selecteableTeam) {
                          context.read<PokemonBloc>().add(AddPokemonToTeam(
                              name: pokemonPokemonResult.name));
                        } else {
                          context
                              .read<PokemonBloc>()
                              .add(PokemonSelected(pokemonPokemonResult.url));
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: ((context) =>
                                      const PokemonDetails())));
                        }
                      },
                      child: PokemonCard(
                          pokemonPokemonResult: pokemonPokemonResult));
                },
              )
          };
          return Padding(
            padding: const EdgeInsets.all(20.0),
            child: content,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          context.read<PokemonBloc>().add(PokemonTeamEnable());
        },
        child: const Icon(Icons.swap_horizontal_circle_outlined),
      ),
    );
  }
}

class _AddPokemonTeam extends StatefulWidget {
  const _AddPokemonTeam(
      {required this.pokemonTeam, required this.pokemonLocalRepository});

  final PokemonLocalRepository pokemonLocalRepository;
  final List<String> pokemonTeam;

  @override
  State<_AddPokemonTeam> createState() => _AddPokemonTeamState();
}

class _AddPokemonTeamState extends State<_AddPokemonTeam> {
  final teamController = TextEditingController();
  @override
  void dispose() {
    teamController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text('Introduzca el nombre del equipo'),
      content: GenericTextField(
        textInputAction: TextInputAction.done,
        controller: teamController,
      ),
      actions: [
        ElevatedButton(
            onPressed: () async {
              if (teamController.text.isNotEmpty) {
                final success = await widget.pokemonLocalRepository.saveTeam(
                    PokemonTeam(
                        teamName: teamController.text,
                        pokemonNames: widget.pokemonTeam));
                if (success) {
                  Navigator.pop(context);
                  context
                      .read<PokemonBloc>()
                      .add(PokemonResetTeam(addedTeam: true));
                }
              }
            },
            child: const Text('Aceptar')),
        ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Cancelar')),
      ],
    );
  }
}
