import 'package:flutter/material.dart';
import '../../../../main.dart';
import '/../global_widgets.dart';

class WinterStar2Screen extends StatefulWidget {
  const WinterStar2Screen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<WinterStar2Screen> createState() => _WinterStar2ScreenState();
}

class _WinterStar2ScreenState extends State<WinterStar2Screen> {
  // Animal list for this specific crop
  final List<String> suitableAnimals = [
    'Dairy',
    'Beef',
    'Sheep',
    'Deer',
    'Horse',
    'Goat',
    'Alpaca'
  ];

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
              'Winterstar II',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Text(
              'Tetraploid Annual Ryegrass',
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
                'assets/annualryegrasspic.png',
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
                  GlobalWidgets.buildSectionTitle('Winterstar II'),
                  const SizedBox(height: 10),
                  const Text(
                    'Improved rust resistance and recommended for quick winter to early spring feed.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'A cultivar with very quick establishment, good winter and spring yields, and feed high quality over a six to eight month growth period.A tetraploid annual ryegrass selected under northern Australian growing conditions at Gatton QLD.'),
                      GlobalWidgets.buildBulletPoint(
                          'Improved rust resistance and recommended for quick winter to early spring feed.'),
                    ],
                  ),

                  const SizedBox(height: 20),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Where it fits'),
                  const SizedBox(height: 10),
                  const Text(
                    'An ideal winter feed and break crop as well as for silage or hay production. Well suited to be sown after maize',
                    style: TextStyle(fontSize: 15),
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Agronomic information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Ploidy', 'Tetraploid'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Heading date', 'Late +18 days'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow(
                      'Persistence', '8 to 12+ months subject to climate'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Winter activity', 'High'),

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
                  GlobalWidgets.buildAnimalIcons(
                    [
                      'Dairy',
                      'Beef',
                      'Sheep',
                      'Horse',
                      'Goat',
                      'Deer',
                      'Alpaca'
                    ],
                    iconSize: 70,
                  ),

                  GlobalWidgets.buildDivider(),

                  GlobalWidgets.buildSectionTitle('Sowing information'),
                  const SizedBox(height: 20),
                  GlobalWidgets.buildInfoRow('Sowing rate', '25 - 30 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Pasture mix', '10 - 15 kg/ha'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing depth', '1-2 cm'),
                  const SizedBox(height: 10),
                  GlobalWidgets.buildInfoRow('Sowing season', 'Autumn'),

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
