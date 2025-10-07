import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class ViperScreen extends StatefulWidget {
  const ViperScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<ViperScreen> createState() => _ViperScreenState();
}

class _ViperScreenState extends State<ViperScreen> {
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
              'Balansa clover\nTrifolium balansae',
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
                  GlobalWidgets.buildSectionTitle('Viper'),
                  const SizedBox(height: 10),
                  const Text(
                    'A self regenerating annual that survives by producing large amounts of hard seed. Tolerant to waterlogging.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Viper is a late flowering long season balansa clover, known as a self-regenerating annual legume. It is a semi-erect, hollow stemmed species that can grow to 1 metre tall, but remains prostrate when grazed.'),
                      GlobalWidgets.buildBulletPoint(
                          'Leaves are white clover-like, but vary greatly in size, shape and leaf marking. Leaflet margins can be smooth or serrated.'),
                      GlobalWidgets.buildBulletPoint(
                          'Tolerant to waterlogging.'),
                      GlobalWidgets.buildBulletPoint('Although predominantly autumn sown, Viper can be strategically spring sown with spring cereals, Italian ryegrass or brassica. This provides a fast 3-4 month burst of legume growth.'),

                    ],
                  ),

                  const SizedBox(height: 20),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'For finishing animals or making silage from early spring through into summer.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Flowering Date', 'Medium'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Minimal Annual Rainfall', '450 mls'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Soil Fertility', 'Medium to High'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Persistence', '1 year'),
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
                  GlobalWidgets.buildInfoRow('Sowing rate alone', '5-8 kg/ha'),
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