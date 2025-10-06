import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class RiflemanScreen extends StatefulWidget {
  const RiflemanScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<RiflemanScreen> createState() => _RiflemanScreenState();
}

class _RiflemanScreenState extends State<RiflemanScreen> {
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
              'Rifleman Forage Rape',
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
                'assets/riflemanpic.png',
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
                  GlobalWidgets.buildSectionTitle('Rifleman'),
                  const SizedBox(height: 10),
                  const Text(
                    'Bred in New Zealand, Rifleman is a dual purpose rape that is exceptionally leafy with a high regrowth ability for multiple grazings.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Bred in New Zealand, Rifleman is a dual purpose rape that is exceptionally leafy with a high regrowth ability for multiple grazings.'),
                      GlobalWidgets.buildBulletPoint(
                          'Rifleman is mid maturity rape and is ready for grazing on average 70 to 90 days post sowing, depending on environmental conditions which will dictate exact maturity time till grazing.'),
                      GlobalWidgets.buildBulletPoint(
                          'Post grazing, regrowth is leafy with new leaves developing from low on the main stem delivering high quality feed for stock performance during Summer and Autumn.'),
                      GlobalWidgets.buildBulletPoint(
                          'Expect two to three Summer and Autumn grazings depending on management and seasonal conditions.'),
                      GlobalWidgets.buildBulletPoint(
                          'Rifleman yields well from a late Spring/early Autumn sowing and can also be used as a single graze option providing quality forage throughout the Winter.'),
                      GlobalWidgets.buildBulletPoint(
                          'Suitable for sowing in summer for late summer, autumn feed with re-growth potential and autumn sown for winter grazing.'),
                    ],
                  ),

                  const SizedBox(height: 20),
                  GlobalWidgets.buildActionButton(
                    text: 'Learn More',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/forage-seeds/rifleman/'),
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
                      'Days from sowing to grazing', '70 to 90'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Grazing type', 'multiple (up to 3 grazings)'),
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
                      'Disease Tolerance', 'very good'),
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
                        'https://www.cropmarkseeds.com/wp-content/uploads/2025/10/Rifleman-Rape_1.pdf'),
                    icon: MdiIcons.fileOutline,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Sowing rate alone', '4 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing rate mixture', '1 - 2 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing depth', '5 - 15 mm'),
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
