import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class KeaScreen extends StatefulWidget {
  const KeaScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<KeaScreen> createState() => _KeaScreenState();
}

class _KeaScreenState extends State<KeaScreen> {
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
              'Kea Kale',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
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
            // Header Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: 300,
              child: Image.asset(
                'assets/keapic.png',
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) => Container(
                  color: Colors.grey.shade200,
                  // Using shade instead of opacity
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
                  GlobalWidgets.buildSectionTitle('Kea'),
                  const SizedBox(height: 10),
                  const Text(
                    'A NZ bred kale with exceptional yield performance.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Bred in New Zealand, Kea is an intermediate kale selected for its high dry matter yield and leaf percentage'),
                      GlobalWidgets.buildBulletPoint(
                          'Thanks to its rapid growth and high leaf content, Kea offers flexibility: it can be used as a high-yielding single-graze Winter feed or as a multigrazed option.'),
                      GlobalWidgets.buildBulletPoint(
                          'When planted in early Spring, Kea can be grazed multiple times throughout the Summer and Autumn months. This adaptability adds flexibility to farm systems and transforms how kales have been historically utilised on New Zealand farms.'),
                      GlobalWidgets.buildBulletPoint(
                          'Kea was bred to combine the winter yield characteristics of intermediate and giant type kales with increased leafiness, enhancing quality, utilisation, and animal performance.'),
                    ],
                  ),

                  const SizedBox(height: 20),
                  GlobalWidgets.buildActionButton(
                    text: 'Learn More',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/forage-seeds/kea/'),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Provides a reliable and nutritious feed source during winter when pasture quality might be lower. '
                    'Kale\'s deep root system helps break up compacted soil and improve drainage.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Days from sowing to grazing', '50 to 220'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Stem type', 'Intermediate to giant'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Leaf to stem ratio', 'Very high'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Winter hardiness', 'Very high'),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Animal safety'),
                  const SizedBox(height: 10),
                  const Text(
                    'Exhibits low SMCO and nitrates.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Suitable for:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildAnimalIcons(
                      ['Dairy', 'Beef', 'Sheep', 'Deer']),
                  GlobalWidgets.buildDivider(),

                  const SizedBox(height: 10),
                  GlobalWidgets.buildSectionTitle('Disease control'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Club Root Tolerance', 'Very good'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Dry Rot Resistance', 'Very good'),
                  GlobalWidgets.buildDivider(),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildSectionTitle('Insect pest control'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Aphids', 'Good resistance'),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Downloads'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildDownloadButton(
                    text: 'Tech Sheet',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/wp-content/uploads/2025/09/Kea-Kale-tech-sheet.pdf'),
                    icon: MdiIcons.fileOutline,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Sowing rate alone', '4 - 5 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing rate mixture', '2 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing depth', '10-20 mm'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Sowing season', 'November - December'),

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
