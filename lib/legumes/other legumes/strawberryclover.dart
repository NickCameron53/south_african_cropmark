import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class StrawberrycloverScreen extends StatefulWidget {
  const StrawberrycloverScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<StrawberrycloverScreen> createState() => _StrawberrycloverScreenState();
}

class _StrawberrycloverScreenState extends State<StrawberrycloverScreen> {
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
              'Strawberry Clover\nTrifolium fragiferum',
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
                  GlobalWidgets.buildSectionTitle('Strawberry Clover'),
                  const SizedBox(height: 10),
                  const Text(
                    'A vigorous, large leaf species with good production in spring and summer and fair winter growth.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Widely sown in Australia.'),
                      GlobalWidgets.buildBulletPoint(
                          'The variety Palestine originates from an ecotype near the Dead Sea in Israel and was introduced in 1929.'),
                      GlobalWidgets.buildBulletPoint(
                          'It is a vigorous, large leaf variety with good production in spring and summer and fair winter growth..'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Useful for soil remediation with its deep tap root helping to loosen compacted soil. A nutritious forage for cattle, sheep, and horses.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                                   GlobalWidgets.buildInfoRow(
                      'Minimal Annual Rainfall', '700 mls'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Soil Fertility', 'Low to Medium'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Persistence', '5+ years'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Growth Peaks', 'Spring'),
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

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Sowing rate alone', '3 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Pasture mix', '1-1.5 kg/ha'),
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
