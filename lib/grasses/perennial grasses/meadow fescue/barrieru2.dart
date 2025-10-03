import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
import '/../global_widgets.dart';

class BarrierScreen extends StatefulWidget {
  const BarrierScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<BarrierScreen> createState() => _BarrierScreenState();
}

class _BarrierScreenState extends State<BarrierScreen> {
  // Animal list for this specific crop
  final List<String> suitableAnimals = ['Dairy', 'Beef', 'Sheep'];

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
              'Barrier',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Text(
              'diploid festulolium',
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
            // Header Image
            Container(
              width: MediaQuery.of(context).size.width,
              height: 100,
              child: Image.asset(
                'assets/barrierpic.png',
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
                  GlobalWidgets.buildSectionTitle('Barrier'),
                  const SizedBox(height: 10),
                  const Text(
                    'A persistent perennial inter-species cross.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'A persistent perennial inter-species cross.'),
                      GlobalWidgets.buildBulletPoint(
                          'Broad insect resistance above and below ground.'),
                      GlobalWidgets.buildBulletPoint(
                          'Highly palatable to livestock and will not cause grass staggers or heat stress.'),
                      GlobalWidgets.buildBulletPoint(
                          'Barrier should not be sown with other grass species which are not fully insect tolerant as this will attract unwanted insect activity.'),

                    ],
                  ),

                  const SizedBox(height: 20),
                  GlobalWidgets.buildActionButton(
                    text: 'Learn More',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/Forage-Products-from-Cropmark-Seeds/Barrier-festulolium'),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Suited to high performance farming systems where high insect pressure limits persistence.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Ploidy', 'Diploid'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Heading date', 'Medium +10 days'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Persistence', '5+ years'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Winter activity', 'High'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Rust resistance', '9'),
                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Animal safety'),
                  const SizedBox(height: 10),
                  const Text(
                    'Suitable for all livestock types.',
                    style: TextStyle(fontSize: 15),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Suitable for:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildAnimalIcons(suitableAnimals),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Downloads'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildDownloadButton(
                    text: 'Brochure',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/wp-content/uploads/2024/06/Barrier_TS-1.pdf'),
                    icon: MdiIcons.fileOutline,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Sowing rate', '20 - 25 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Pasture mix', '8 - 15 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing depth', '1-2 cm'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Sowing season', 'Autumn & Spring'),

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
