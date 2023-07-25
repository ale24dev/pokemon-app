import 'package:flutter/material.dart';
import 'package:test_pokemon_app/src/feature/teams/teams_screen.dart';

class DrawerScreen extends StatelessWidget {
  const DrawerScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: Color.fromARGB(165, 90, 78, 160),
            ),
            child: Text(
              'Pokedex Profile',
              style: TextStyle(color: Colors.white, fontSize: 24),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.gamepad),
            title: const Text('Teams'),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => const TeamScreen()));
              // Add your home page navigation here
              // Navigator.pop(context); // Closes the Drawer
            },
          ),
        ],
      ),
    );
  }
}
