import 'package:flutter/material.dart';
import 'package:redex/Components/my_drawer_tile.dart';
import 'package:redex/Pages/settings_page.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.background,  // Background color based on theme
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: Icon(
              Icons.lock_open_rounded,
              size: 80,
              color: Theme.of(context).colorScheme.primary,  // Primary color for the icon
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(25.0),
            child: Divider(
              color: Theme.of(context).colorScheme.secondary,  // Divider color based on theme
            ),
          ),
          MyDrawerTile(
            text: 'H O M E',
            icon: Icons.home,
            onTap: () => Navigator.pop(context),
          ),
          MyDrawerTile(
            text: 'S E T T I N G S',
            icon: Icons.settings,
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingsPage(),
                ),
              );
            },
          ),
          const Spacer(),
          MyDrawerTile(
            text: 'L O G O U T',
            icon: Icons.exit_to_app,
            onTap: () {
              // Add your logout functionality here
            },
          ),
        ],
      ),
    );
  }
}
