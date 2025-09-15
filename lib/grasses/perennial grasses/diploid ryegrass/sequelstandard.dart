import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
import '/../global_widgets.dart';

class SequelScreen extends StatefulWidget {
  const SequelScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<SequelScreen> createState() => _SequelScreenState();
}

class _SequelScreenState extends State<SequelScreen> {
  // Animal list for this specific crop - adjust based on Sequel's suitability
  final List<String> suitableAnimals = ['Dairy', 'Beef', 'Sheep', 'Deer'];

  Future<void> _launchURL(String url) async {
    try {
      if (await launchUrl(Uri.parse(url))) {
        debugPrint("Successfully launched URL: $url");
      } else {
        _showSnackBar('Could not launch URL');
      }
    } catch (e) {
      _showSnackBar('Error launching URL: $e');
    }
  }

  void _showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(message)),
    );
  }

  void _navigateToHome() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: '')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Sequel',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Text(
              'diploid perennial ryegrass', // Update if different type
              style: TextStyle(
                color: Colors.white,
                fontSize: 15.0,
              ),
            ),
          ],
        ),
        backgroundColor: GlobalWidgets.primaryGreen,
        foregroundColor: Colors.white,
        actions: [
          IconButton(
            icon: const Icon(Icons.home),
            onPressed: _navigateToHome,
            tooltip: 'Home',
          ),
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            // Header Image - update with Sequel image
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Image.asset(
                'assets/diploidlp.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  child: const Icon(Icons.image, size: 60, color: Colors.grey),
                ),
              ),
            ),

            // Content
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  GlobalWidgets.buildSectionTitle('Sequel'),
                  const SizedBox(height: 10),
                  const Text(
                    'A high-performing perennial ryegrass with excellent persistence and yield.', // Update description
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Exceptional dry matter production throughout the growing season'),
                      GlobalWidgets.buildBulletPoint(
                          'Excellent persistence under grazing and cutting regimes'),
                      GlobalWidgets.buildBulletPoint(
                          'High nutritional quality with excellent palatability'),
                      GlobalWidgets.buildBulletPoint(
                          'Strong resistance to common ryegrass diseases'),
                      GlobalWidgets.buildBulletPoint(
                          'Good winter activity and early spring growth'),
                    ],
                  ),

                  const SizedBox(height: 20),
                  GlobalWidgets.buildActionButton(
                    text: 'Learn More',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/Forage-Products-from-Cropmark-Seeds/Sequel-Enhanced-Perennial-Ryegrass'), // Update URL
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Ideal for high-performance dairy and beef systems requiring reliable year-round production.', // Update description
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Ploidy', 'Diploid'), // Update if different
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Heading date', 'Medium +7 days'), // Update
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Persistence', '5+ years'), // Update
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Winter activity', 'High'), // Update
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Rust resistance', '8'), // Update

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Animal safety'),
                  const SizedBox(height: 10),
                  const Text(
                    'Suitable for all livestock types with excellent palatability.', // Update
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Suitable for:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildAnimalIcons(
                    suitableAnimals,
                    iconSize: 70,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Downloads'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildDownloadButton(
                    text: 'Tech Sheet',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/wp-content/uploads/2024/06/Sequel_TS.pdf'), // Update URL
                    icon: MdiIcons.fileOutline,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Sowing rate', '20 - 25 kg/ha'), // Update
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Pasture mix', '8 - 15 kg/ha'), // Update
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing depth', '1-2 cm'), // Update
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Sowing season', 'Autumn & Spring'), // Update if different

                  // Bottom spacing
                  const SizedBox(height: 80),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),
    );
  }
}
