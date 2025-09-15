import 'package:flutter/material.dart';
import '../../../../main.dart';
import '/../global_widgets.dart';

class One50Screen extends StatefulWidget {
  const One50Screen({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);

  final String country;
  final String region;

  @override
  State<One50Screen> createState() => _One50ScreenState();
}

class _One50ScreenState extends State<One50Screen> {
  // Animal list for this specific crop
  final List<String> suitableAnimals = ['Dairy', 'Beef', 'Sheep', 'Deer'];



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
              'One50',
              style: TextStyle(color: Colors.white, fontSize: 18.0),
            ),
            Text(
              'diploid perennial ryegrass',
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
                'assets/diploidlp.png',
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
                  GlobalWidgets.buildSectionTitle('One50'),
                  const SizedBox(height: 10),
                  const Text(
                    'Late perennial ryegrass with robust disease resistance.',
                    style: TextStyle(fontSize: 18, color: Colors.black),
                  ),
                  const SizedBox(height: 10),

                  GlobalWidgets.buildDivider(),

                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GlobalWidgets.buildBulletPoint(
                          'A high yielding, medium leaf sized cultivar offering good summer, autumn & winter yields.'),
                      GlobalWidgets.buildBulletPoint(
                          'Bred using New Zealand & North-West Spanish germplasm.'),
                    ],
                  ),

                  const SizedBox(height: 20),

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
                  GlobalWidgets.buildInfoRow('Heading date', 'Late +20 days'),
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
                  GlobalWidgets.buildAnimalIcons(
                    suitableAnimals,
                    iconSize: 70,
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
