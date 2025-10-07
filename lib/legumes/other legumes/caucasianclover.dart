import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class CaucasiancloverScreen extends StatefulWidget {
  const CaucasiancloverScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<CaucasiancloverScreen> createState() => _CaucasiancloverScreenState();
}

class _CaucasiancloverScreenState extends State<CaucasiancloverScreen> {
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
              'Caucasian Clover\nTrifolium ambiguum',
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
                'assets/whitecloverpic.png',
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
                  GlobalWidgets.buildSectionTitle('Caucasian Clover'),
                  const SizedBox(height: 10),
                  const Text(
                    'A very slow establishing, strongly rhizomatous, tap rooted, perennial legume.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Once established caucasian clover offers strong spring and summer growth and is very tolerant of grass grub attack.'),
                      GlobalWidgets.buildBulletPoint('Winter dormant.'),
                      GlobalWidgets.buildBulletPoint(
                          'Under drought conditions it becomes dormant to persist.'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Useful for areas prone to drought and under grass grub stress.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                                GlobalWidgets.buildInfoRow(
                      'Minimal Annual Rainfall', '500 mls'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Soil Fertility', 'Medium to High'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Persistence', '5+ years'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Growth Peaks', 'Spring to Summer'),
                  const SizedBox(height: 10),

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
                    'Goat',
                    'Horse',
                    'Alpaca'
                  ]),
                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Insect Pest Control'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Grass grub', 'very tolerant'),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Sowing rate alone', '2-5 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Pasture mix', '1-2 kg/ha'),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildInfoRow('Sowing depth', '10-15 mm'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Sowing season', 'Autumn or Spring'),

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
