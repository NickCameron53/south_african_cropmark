import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class PillarScreen extends StatefulWidget {
  const PillarScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<PillarScreen> createState() => _PillarScreenState();
}

class _PillarScreenState extends State<PillarScreen> {
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
              'Pillar Forage Rape',
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
                'assets/pillarpic.png',
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
                  GlobalWidgets.buildSectionTitle('Pillar'),
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
                          'A new fast establishing, high yielding multi-graze giant type rape with good aphid tolerance and disease resistance.'),
                      GlobalWidgets.buildBulletPoint(
                          'Suitable for sowing in summer for late summer, autumn feed with re-growth potential and autumn sown for winter grazing.'),
                      ],
                  ),

                  const SizedBox(height: 20),
                  GlobalWidgets.buildActionButton(
                    text: 'Learn More',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/Forage-Products-from-Cropmark-Seeds/Pillar-forage-rape'),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'A fast-growing brassica that thrives in cooler temperatures. This makes it a valuable source of nutritious feed for livestock during winter when pastures are dormant or less productive.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Days from sowing to grazing', '90 to 110'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Grazing type', 'multiple (up to 4 grazings)'),
                  const SizedBox(height: 10),


                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Animal safety'),
                  const SizedBox(height: 10),

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
                      'Club Root Tolerance', 'susceptible'),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildSectionTitle('Insect pest control'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Aphids', 'Moderate to good tolerance'),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Downloads'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildDownloadButton(
                    text: 'Tech Sheet',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/wp-content/uploads/2025/10/Pillar-tech-sheet_1.pdf'),
                    icon: MdiIcons.fileOutline,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Sowing rate alone', '3 - 4 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing rate mixture', '1 to 2 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing depth', '10 mm'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Sowing season', 'Spring or Autumn'),

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
