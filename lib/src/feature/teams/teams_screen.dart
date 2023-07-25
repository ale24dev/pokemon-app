import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/feature/home/domain/pokemon_team.dart';
import 'package:test_pokemon_app/src/feature/home/service/pokemon_local_repository.dart';

class TeamScreen extends StatelessWidget {
  const TeamScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('My Teams')),
      body: SizedBox(
        height: double.infinity,
        child: FutureBuilder(
          future: PokemonLocalRepository.getTeams(),
          builder: (context, AsyncSnapshot snapshot) {
            if (!snapshot.hasData) return const CircularProgressIndicator();

            if (snapshot.hasError) {
              return const Center(
                child: Text('Unexpected error'),
              );
            }
            return _PokemonTeamCard(
              pokemonTeamList: snapshot.data,
            );
          },
        ),
      ),
    );
  }
}

class _PokemonTeamCard extends StatelessWidget {
  const _PokemonTeamCard({required this.pokemonTeamList});

  final List<PokemonTeam> pokemonTeamList;

  @override
  Widget build(BuildContext context) {
    return pokemonTeamList.isEmpty
        ? const Center(
            child: Text('No tienes equipos guardados'),
          )
        : ListView.builder(
            itemCount: pokemonTeamList.length,
            itemBuilder: (context, index) {
              final pokemonTeam = pokemonTeamList[index];
              return Padding(
                padding: const EdgeInsets.all(20.0),
                child: Container(
                  decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Color(0x4D8FC5AA),
                            blurRadius: 5,
                            offset: Offset(0, 5))
                      ],
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          pokemonTeam.teamName,
                          style: const TextStyle(fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          height: 136,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 3, // Number of columns
                                crossAxisSpacing:
                                    4.0, // Horizontal spacing between items
                                mainAxisSpacing:
                                    4.0, // Vertical spacing between items
                              ),
                              itemCount: pokemonTeamList
                                  .length, // Replace this with the actual number of items in your list
                              itemBuilder: (context, index) {
                                // Replace this with your item widget
                                try {
                                  return Container(
                                    decoration: BoxDecoration(
                                        color: const Color.fromARGB(
                                            165, 90, 78, 160),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        pokemonTeam.pokemonNames[index],
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  );
                                } catch (e) {
                                  print('1');
                                }
                                return null;
                              },
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
          );
  }
}
