import '../../select%20species/Legume/Legumes.dart';
import '../../select%20species/fodder%20beet/Fodder_Beet.dart';
import '../../select%20species/forage%20grass/Annual_Ryegrass.dart';
import '../../select%20species/forage%20grass/Cocksfoot_grass.dart';
import '../../select%20species/forage%20grass/Hybrid_Ryegrass.dart';
import '../../select%20species/forage%20grass/Italian_Ryegrass.dart';
import '../../select%20species/forage%20grass/Perennial_Grass.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Species_Tool_List.dart';
import 'abouttheguide.dart';
import 'main.dart';
import 'orders/orderform.dart';
import 'select species/brassica/Brassicas.dart';
import 'select species/forage herbs/Herbs.dart';
import 'webpage.dart';

class SeedType extends StatefulWidget {
  final String country, region, representative, headshot, phonenum, retailname;

  const SeedType({
    Key? key,
    required this.country,
    required this.region,
    required this.representative,
    required this.headshot,
    required this.phonenum,
    required this.retailname,
  }) : super(key: key);

  @override
  State<SeedType> createState() => _SeedTypeState();
}

class _SeedTypeState extends State<SeedType> {
  static const List<String> forageTypes = [
    'Perennial grasses\n     5+ years',
    'Hybrid ryegrass\n   2-5 years',
    'Italian ryegrass\n   18 months',
    'Annual ryegrass\n   9 months',
    'Cocksfoot\n  5+ years',
    'Herbs',
    'Legumes',
    'Fodder Beet',
    'Brassicas',
  ];

  static const List<String> animalTypes = [
    'Sheep',
    'Beef',
    'Dairy',
    'Horses',
    'Goats',
    'Deer',
    'Alpacas',
  ];

  static const List<String> summerRainOptions = [
    '      Low\n(<150mm)',
    '      Medium\n(150-300mm)',
    '      High\n(>300mm)',
  ];

  static const List<String> soilAcidityOptions = [
    '   Acid\n<pH5.5',
    '   Normal\npH5.5 to pH6.5',
    'Alkaline\n>pH6.5',
  ];

  int selectedForageTypeIndex = 0;
  int selectedAnimalTypeIndex = 2;
  int selectedSummerRainIndex = 1;
  int selectedSoilAcidityIndex = 1;

  final Map<String, Widget Function(BuildContext, SelectionData)>
      _navigationMap = {
    'Annual ryegrass\n   9 months': (context, data) => annualryegrass(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Italian ryegrass\n   18 months': (context, data) => italianryegrass(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Hybrid ryegrass\n   2-5 years': (context, data) => hybridryegrass(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Cocksfoot\n  5+ years': (context, data) => cocksfoots(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Herbs': (context, data) => herbs(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Legumes': (context, data) => Legumes(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Fodder Beet': (context, data) => fodderbeet(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Brassicas': (context, data) => brassicas(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
    'Perennial grasses\n     5+ years': (context, data) => perennialgrass(
          country: data.country,
          region: data.region,
          representative: data.representative,
          headshot: data.headshot,
          phonenum: data.phonenum,
          animaltype: data.animalType,
          summerrain: data.summerRain,
          foragetype: data.forageType,
          soilacidity: data.soilAcidity,
        ),
  };

  Future<void> _makePhoneCall() async {
    final url = Uri.parse(widget.phonenum);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  bool _checkInputs() {
    final inputsToCheck = [
      selectedForageTypeIndex,
      selectedAnimalTypeIndex,
      selectedSummerRainIndex,
    ];

    if (selectedForageTypeIndex == forageTypes.indexOf('Cereals') ||
        selectedForageTypeIndex ==
            forageTypes.indexOf('Perennial grasses\n     5+ years')) {
      inputsToCheck.add(selectedSoilAcidityIndex);
    }

    if (inputsToCheck.any((index) => index == -1)) {
      _showValidationDialog();
      return false;
    }
    return true;
  }

  void _showValidationDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          content: const Text(
              'Please make sure you have selected every requirement'),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: const Text(
                'OK',
                style: TextStyle(color: Colors.black),
              ),
            ),
          ],
          backgroundColor: Colors.white,
          contentTextStyle: const TextStyle(color: Colors.black),
        );
      },
    );
  }

  void _navigateToSelectedPage() {
    if (!_checkInputs()) return;

    final selectionData = SelectionData(
      country: widget.country,
      region: widget.region,
      representative: widget.representative,
      headshot: widget.headshot,
      phonenum: widget.phonenum,
      animalType: animalTypes[selectedAnimalTypeIndex],
      summerRain: summerRainOptions[selectedSummerRainIndex],
      forageType: forageTypes[selectedForageTypeIndex],
      soilAcidity: soilAcidityOptions[selectedSoilAcidityIndex],
    );

    final selectedForageType = forageTypes[selectedForageTypeIndex];
    final builder = _navigationMap[selectedForageType];

    if (builder != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => builder(context, selectionData)));
    }
  }

  Widget _buildSelectionButton(String title, int currentIndex,
      ValueChanged<int> onChanged, List<String> options) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () => onChanged(options.indexOf(title)),
        child: Text(
          title,
          style: TextStyle(
            color: Colors.white,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          backgroundColor: currentIndex == options.indexOf(title)
              ? Colors.lime
              : Colors.green[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: const Size(60, 60),
        ),
      ),
    );
  }

  Widget _buildProceedButton() {
    return Container(
      padding: const EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
      child: Align(
        child: ElevatedButton(
          onPressed: _navigateToSelectedPage,
          child: Text(
              'Proceed to ${forageTypes[selectedForageTypeIndex].split('\n')[0]}'),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black,
            backgroundColor: Colors.lightGreen,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40.0),
            ),
            minimumSize: const Size(30, 50),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          children: [
            Text(
              widget.region,
              style: const TextStyle(color: Colors.white, fontSize: 20.0),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Call: ',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                Text(
                  widget.representative,
                  style: const TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ],
            ),
            const Text(
              'for any assistance in using this App.',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.call),
            onPressed: _makePhoneCall,
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.black,
              Colors.green,
              Colors.black,
            ],
          ),
        ),
        child: Center(
          child: ListView(
            padding: const EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 20.0),
            children: <Widget>[
              // Select your requirements
              Container(
                alignment: Alignment.bottomLeft,
                padding: const EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                child: const Text(
                  "Select your requirements",
                  style: TextStyle(
                    color: Colors.lime,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),

              // Forage Type
              _buildSelectionSection(
                "Forage Type:",
                forageTypes,
                selectedForageTypeIndex,
                (index) => setState(() => selectedForageTypeIndex = index),
              ),

              // Animal Grazing Type
              _buildSelectionSection(
                "Animal Grazing Type:",
                animalTypes,
                selectedAnimalTypeIndex,
                (index) => setState(() => selectedAnimalTypeIndex = index),
              ),

              // Summer Rainfall
              _buildSelectionSection(
                "Summer Rainfall:",
                summerRainOptions,
                selectedSummerRainIndex,
                (index) => setState(() => selectedSummerRainIndex = index),
              ),

              // Soil Acidity
              _buildSelectionSection(
                "Soil Acidity:",
                soilAcidityOptions,
                selectedSoilAcidityIndex,
                (index) => setState(() => selectedSoilAcidityIndex = index),
              ),

              // Proceed Button
              _buildProceedButton(),
            ],
          ),
        ),
      ),
      bottomNavigationBar: _buildBottomNavigationBar(),
    );
  }

  Widget _buildSelectionSection(
    String title,
    List<String> options,
    int selectedIndex,
    ValueChanged<int> onSelectionChanged,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 2.0),
          child: Text(
            title,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        SizedBox(
          height: 50,
          child: ListView(
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            children: options.map((option) {
              return _buildSelectionButton(
                option,
                selectedIndex,
                onSelectionChanged,
                options,
              );
            }).toList(),
          ),
        ),
      ],
    );
  }

  Widget _buildBottomNavigationBar() {
    return Container(
      color: Colors.green.shade800, // Add the background color here
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        child: Container(
          // This container is now just for the border
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 6.0, color: Colors.green.shade700),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            selectedItemColor: Colors.green.shade700,
            unselectedItemColor: Colors.green.shade700,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => abouttheguide()),
                  );
                  break;
                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => webpage()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toollist()),
                  );
                  break;
                case 3:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderForm()),
                  );
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                label: 'Seed Guide',
                icon: Icon(Icons.home),
              ),
              BottomNavigationBarItem(
                label: 'Web Hub',
                icon: Icon(Icons.search),
              ),
              BottomNavigationBarItem(
                label: 'Tools',
                icon: Icon(Icons.calculate),
              ),
              BottomNavigationBarItem(
                label: 'Order',
                icon: Icon(Icons.shopping_cart),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _onBottomNavigationTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(title: 'Home'),
          ),
        );
        break;
      case 1:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => webpage()),
        );
        break;
      case 2:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => toollist()),
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderForm()),
        );
        break;
    }
  }
}

class SelectionData {
  final String country;
  final String region;
  final String representative;
  final String headshot;
  final String phonenum;
  final String animalType;
  final String summerRain;
  final String forageType;
  final String soilAcidity;

  SelectionData({
    required this.country,
    required this.region,
    required this.representative,
    required this.headshot,
    required this.phonenum,
    required this.animalType,
    required this.summerRain,
    required this.forageType,
    required this.soilAcidity,
  });
}
