import '../../style/listtile.dart';
import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  final void Function()? onGoogleTap;
  const MyDrawer({super.key, required this.onGoogleTap});

  @override
  Widget build(BuildContext context) {
    return Drawer(
        backgroundColor: Colors.green[700],
        child: Column(
          children: [
            // Header with icon and text
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.green, // Adjust background color if desired
              ),
              child: Center( // Center both icon and text vertically
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center, // Center horizontally
                  children: const [
                    Icon(
                      Icons.map,
                      color: Colors.white,
                      size: 64,
                    ),
                    SizedBox(height: 8.0), // Add some spacing between icon and text
                    Text(
                      "Use this map to find your location",
                      style: TextStyle(color: Colors.white, fontSize: 16.0),
                    ),
                  ],
                ),
              ),
            ),

            // home list tile
            MyListTile(
              icon: Icons.home,
              text: 'Home',
              onTap: () => Navigator.pop(context),
            ),

            // google map list tile
            MyListTile(icon: Icons.location_pin, text: 'Tap to find your location', onTap: onGoogleTap),
          ],
        ));
  }
}
