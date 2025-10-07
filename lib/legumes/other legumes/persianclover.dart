import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../global_widgets.dart';

class PersiancloverScreen extends StatefulWidget {
  const PersiancloverScreen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<PersiancloverScreen> createState() => _PersiancloverScreenState();
}

class _PersiancloverScreenState extends State<PersiancloverScreen> {
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
              'Persian clover\nTrifolium resupinatum ssp majus',
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
                  GlobalWidgets.buildSectionTitle('Laser\nPersian clover'),
                  const SizedBox(height: 10),
                  const Text(
                    'Excellent tolerance to wet conditions, significantly out-yields sub clovers in wet years in waterlogged paddocks. Tolerates mild soil salinity.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'Mainly used as part of an annual crop with grass or as part of a finishing mix.'),
                      GlobalWidgets.buildBulletPoint(
                          'Persian clover provides increased forage yields in late spring to early summer.'),
                      GlobalWidgets.buildBulletPoint(
                          'Excellent tolerance to wet conditions, significantly out-yields sub clovers in wet years in waterlogged paddocks.'),
                      GlobalWidgets.buildBulletPoint('Tolerates mild soil salinity.'),

                    ],
                  ),

                  const SizedBox(height: 20),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'Suitable for multiple grazings and/or hay/silage cuts. Should be rotationally grazed.',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Flowering Date', 'Late'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Minimal Annual Rainfall', '600 mls'),
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

                  GlobalWidgets.buildSectionTitle('Insect Pest Control'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow(
                      'Red Legged Earth Mite', 'susceptible'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Lucerne Flea', 'susceptible'),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Sowing rate alone', '7-12 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Pasture mix', '3-6 kg/ha'),
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
