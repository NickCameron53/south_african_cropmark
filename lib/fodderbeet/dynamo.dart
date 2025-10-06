import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class DynamoScreen extends StatefulWidget {
  const DynamoScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<DynamoScreen> createState() => _DynamoScreenState();
}

class _DynamoScreenState extends State<DynamoScreen> {
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
              'Dynamo Fodder Beet',
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
                'assets/dynamopic.png',
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
                  GlobalWidgets.buildSectionTitle('Dynamo'),
                  const SizedBox(height: 10),
                  const Text(
                    'A soft fleshed bulb sitting well above the ground making it suitable for grazing in situ with sheep, cattle or deer and especially younger stock.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'A newly bred monogerm, low dry matter, large red tankard bulb cultivar that sits +/- 60% above the ground.'),
                      GlobalWidgets.buildBulletPoint(
                          'It has very good disease and bolting tolerance which maintains quality throughout the crop.'),
                      GlobalWidgets.buildBulletPoint(
                          'Excellent disease and bolting tolerance.'),

                    ],
                  ),

                  const SizedBox(height: 20),
                  GlobalWidgets.buildActionButton(
                    text: 'Learn More',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/Forage-Products-from-Cropmark-Seeds/OE967-Fodder-Beet'),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Provides a reliable and nutritious feed source during autumn, winter, and early spring when pasture quality might be lower.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Days from sowing to grazing', '200+'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Bulb above ground', '+/-60%'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Bulb Dry matter', '12-14%'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Bolting tolerance', 'Good*'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Disease tolerance', 'Strong'),
                  const SizedBox(height: 10),


                  Text(
                      '*Subject to management and climatic conditions.',
                      style:
                      TextStyle(fontSize: 11, color: Colors.black)),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Animal safety'),
                  const SizedBox(height: 10),

                  const Text(
                    'Suitable for:',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildAnimalIcons([
                    'Dairy',
                    'Beef',
                    'Sheep',
                    'Deer',

                  ]),
                  GlobalWidgets.buildDivider(),

                  const SizedBox(height: 10),
                  GlobalWidgets.buildSectionTitle('Disease control'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Club Root Tolerance', 'good'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Dry Rot Tolerance', 'good'),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildSectionTitle('Insect pest control'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Aphids', 'good tolerance'),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Downloads'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildDownloadButton(
                    text: 'Brochure',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/wp-content/uploads/2025/10/Dynamo_B_1.pdf'),
                    icon: MdiIcons.fileOutline,
                  ),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildDownloadButton(
                    text: 'Tech Sheet',
                    onPressed: () => _launchURL(
                        'https://www.cropmarkseeds.com/wp-content/uploads/2025/10/Dynamo-tech-sheet.pdf'),
                    icon: MdiIcons.fileOutline,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Sowing rate alone', '100,000 seeds/Ha'),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildInfoRow('Sowing depth', '20 mm'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Sowing season', 'Spring'),

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
