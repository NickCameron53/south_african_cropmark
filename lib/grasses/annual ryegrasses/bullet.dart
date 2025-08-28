import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import '../../../../abouttheguide.dart';
import '../../../../main.dart';
import '../../../../webpage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Species_Tool_List.dart';
import '../../../select species/forage grass/endophyte_card.dart';



void launchURL(url) async {
  if (await launchUrl(Uri.parse(url))) {
    print("Successfully launched URL: $url"); // Optional success message
  } else {
    // Handle case where url can't be launched (e.g., show a message)
    print("Could not launch $url");
  }
}

class bullet extends StatefulWidget {
  bullet({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<bullet> createState() {
    return _bulletState();
  }
}

class _bulletState extends State<bullet> {
  List<String> endophytetype = [
    'Nil',
  ];

  int selectedIndex1 = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(70),
          child: AppBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Bullet\u2122',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Tetraploid annual ryegrass',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
              backgroundColor: Colors.green[800],
              foregroundColor: Colors.white,
              actions: <Widget>[
                IconButton(
                  icon: Icon(Icons.home),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => MyHomePage(
                                title: '',
                              )),
                    );
                  },
                ),
              ]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: MediaQuery.of(context)
                    .size
                    .width, // Takes full width of the screen
                height: 100,
                child: Image.asset(
                  'assets/annualryegrasspic.png',
                  fit:
                      BoxFit.cover, // Use BoxFit.cover to cover the entire area
                ),
              ),
              Container(
                child: Column(children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 3.0, 5.0),
                    margin: EdgeInsets.only(top: 50),
                    width: 350,
                    child: Column(
                      children: [
                        SizedBox(
                          width: double.infinity,
                          child: Text('Bullet\u2122',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Bullet displays superior establishment speed, very strong autumn, winter and early spring growth with very high pasture quality and palatability',
                            style:
                                TextStyle(fontSize: 18, color: Colors.black)),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.green,
                          thickness: 1,
                          height: 20,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 10),
                        Text(
                            "\u25BA A new tetraploid annual (Westerwolds type) cultivar with very large upright leafy tillers."
                            "\n\u25BA Bullet displays superior establishment speed, very strong autumn, winter and early spring growth with very high pasture quality and palatability."
                            "\n\u25BA Has low seed dormancy and fits well between crop cycles."
                            "\n\u25BA Survives longer into summer than traditional Westerwolds types.",
                            style: TextStyle(fontSize: 15)),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  launchURL(
                                      'https://www.cropmarkseeds.com/Forage-Products-from-Cropmark-Seeds/Bullet-annual-ryegrass');
                                },
                                child: Text('Learn More'),
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Colors.lightGreen,
                                  minimumSize: Size(100, 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(
                                        30), // Rounded corners
                                  ),
                                ),
                              ),
                            ]),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.green,
                          thickness: 1,
                          height: 20,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text('Where it fits',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'An ideal winter feed and break crop as well as for silage or hay production. Well suited to be sown after maize.',
                            style: TextStyle(fontSize: 15)),
                        SizedBox(height: 10),
                        Divider(
                          color: Colors.green,
                          thickness: 1,
                          height: 20,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text('Agronomic information',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'Ploidy: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Tetraploid',
                                    ),
                                  ])),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'Heading date: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Medium to Late +14 days',
                                    ),
                                  ])),
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'Persistence: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          '8 to 12+ months subject to climate',
                                    ),
                                  ])),
                        ),
                        SizedBox(height: 10),

                        SizedBox(
                          width: double.infinity,
                          child: RichText(
                              textAlign: TextAlign.left,
                              text: TextSpan(
                                  style: TextStyle(
                                    fontSize: 15,
                                    color: Colors.black,
                                  ),
                                  children: [
                                    TextSpan(
                                        text: 'Winter activity: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'High',
                                    ),
                                  ])),
                        ),
                        SizedBox(height: 10),

                        Divider(
                          color: Colors.green,
                          thickness: 1,
                          height: 20,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 10),

                        Row(
                          children: [
                            Container(
                              // Wrap Text with a container and define its width
                              width: 220.0, // Adjust width as needed
                              child: Text(
                                'Available Endophytes    ',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700]),
                                maxLines: 2, // Limit text lines (optional)
                                overflow: TextOverflow
                                    .ellipsis, // Add ellipsis for overflow (optional)
                              ),
                            ),
                            IconButton(
                              icon: _buildInfoIconButton(),
                              onPressed: () => Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const InfoCard()),
                              ),
                            ),
                          ],
                        ),

                        Container(
                          height: 50,
                          child: ListView(
                              shrinkWrap: true,
                              scrollDirection: Axis.horizontal,
                              children: endophytetype.map((endophyte) {
                                final bool isSelected = selectedIndex1 ==
                                    endophytetype.indexOf(endophyte);
                                return _standardendophyteButton(endophytetype,
                                    endophyte, selectedIndex1, isSelected, () {
                                  setState(() {
                                    // Call setState here
                                    selectedIndex1 =
                                        endophytetype.indexOf(endophyte);
                                  });
                                });
                              }).toList()),
                        ),

                        // ==================   nil endophyte information ============================================
                        if (selectedIndex1 == endophytetype.indexOf('Nil')) ...[
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Nil Endophyte',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ])),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: Text('Animal safety',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700])),
                          ),
                          SizedBox(height: 10),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Suitable for: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                    ])),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/Dairy.ico'),
                                height: 80,
                                width: 80,
                              ),
                              Image(
                                image: AssetImage('assets/Beef.ico'),
                                height: 80,
                                width: 80,
                              ),
                              Image(
                                image: AssetImage('assets/Sheep.ico'),
                                height: 80,
                                width: 80,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/Deer.ico'),
                                height: 80,
                                width: 80,
                              ),
                              Image(
                                image: AssetImage('assets/Goat.ico'),
                                height: 80,
                                width: 80,
                              ),
                              Image(
                                image: AssetImage('assets/Horse.ico'),
                                height: 80,
                                width: 80,
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Image(
                                image: AssetImage('assets/Alpaca.ico'),
                                height: 80,
                                width: 80,
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                          text: 'Ryegrass staggers: ',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold)),
                                      TextSpan(
                                        text:
                                            'Does not cause ryegrass staggers.\n\n',
                                      ),
                                    ])),
                          ),
                          SizedBox(
                            width: double.infinity,
                            child: Text('Insect pest control',
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700])),
                          ),
                          SizedBox(height: 20),
                          SizedBox(
                            width: double.infinity,
                            child: RichText(
                                textAlign: TextAlign.left,
                                text: TextSpan(
                                    style: TextStyle(
                                      fontSize: 15,
                                      color: Colors.black,
                                    ),
                                    children: [
                                      TextSpan(
                                        text: 'Provides no insect control.',
                                      ),
                                    ])),
                          ),
                          SizedBox(height: 10),
                          SizedBox(height: 10),
                        ],
                        // ========= end of nil endophyte ==================

                        Divider(
                          color: Colors.green,
                          thickness: 1,
                          height: 20,
                          indent: 1,
                          endIndent: 1,
                        ),
                        SizedBox(height: 10),
                        SizedBox(
                          width: double.infinity,
                          child: Text('Downloads',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 20),
                        Container(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                SizedBox(
                                  height: 10,
                                ),
                                ElevatedButton(
                                  onPressed: () {
                                    launchURL(
                                        'https://www.cropmarkseeds.com/wp-content/uploads/2024/06/Bullet_TS-1.pdf');
                                  },
                                  child: Container(
                                    width: 100,
                                    child: Row(
                                      children: [
                                        Icon(MdiIcons.fromString(
                                            'file-outline')),
                                        Text('Trial Data')
                                      ],
                                    ),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.lightGreen,
                                    minimumSize: Size(100, 50),
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(
                                          30), // Rounded corners
                                    ),
                                  ),
                                ),
                                SizedBox(height: 20),
                                Divider(
                                  color: Colors.green,
                                  thickness: 1,
                                  height: 20,
                                  indent: 1,
                                  endIndent: 1,
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: Text('Sowing information',
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                          fontSize: 24,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700])),
                                ),
                                SizedBox(height: 20),
                                SizedBox(
                                  width: double.infinity,
                                  child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'Sowing rate: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: '25 - 30 kg/ha',
                                            ),
                                          ])),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'Pasture mix: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: '10 - 15 kg/ha',
                                            ),
                                          ])),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'Sowing depth: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: '1-2 cm',
                                            ),
                                          ])),
                                ),
                                SizedBox(height: 10),
                                SizedBox(
                                  width: double.infinity,
                                  child: RichText(
                                      textAlign: TextAlign.left,
                                      text: TextSpan(
                                          style: TextStyle(
                                            fontSize: 15,
                                            color: Colors.black,
                                          ),
                                          children: [
                                            TextSpan(
                                                text: 'Sowing season: ',
                                                style: TextStyle(
                                                    fontWeight:
                                                        FontWeight.bold)),
                                            TextSpan(
                                              text: 'Autumn',
                                            ),
                                          ])),
                                ),
                                SizedBox(height: 10),
                                Divider(
                                  color: Colors.green,
                                  thickness: 1,
                                  height: 20,
                                  indent: 1,
                                  endIndent: 1,
                                ),
                              ]),
                        ),
                        //end sizebox to push content above bottomnavigationbar
                        SizedBox(height: 100),
                      ],
                    ),
                  )
                ]),
              )
            ],
          ),
        ),
        bottomNavigationBar: Container(
            decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(width: 6.0, color: Colors.green.shade700),
                ),
                borderRadius: BorderRadius.all(Radius.circular(20))),
            child: ClipRRect(
              borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
              child: new BottomNavigationBar(
                type: BottomNavigationBarType.fixed,
                backgroundColor: Colors.black,
                showUnselectedLabels: true,
                selectedItemColor: Colors.green.shade700,
                unselectedItemColor: Colors.green.shade700,
                onTap: (index) {
                  switch (index) {
                    case 0:
                      // Navigate to About the Guide page
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => abouttheguide()),
                      );
                      break;
                    case 1:
                      // Navigate to Webpage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => webpage()),
                      );
                      break;
                    case 2:
                      // Navigate to Toolkit page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => toollist()),
                      );
                      break;


                    // ...
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

                ],
              ),
            )));
  }
}

Widget _standardendophyteButton(List<String> endophytetype, String title,
    int selectedIndex1, bool isSelected, void Function() onPressed) {
  final bool isSelected = selectedIndex1 == endophytetype.indexOf(title);
  return AnimatedContainer(
    duration: Duration(milliseconds: 200),
    curve: Curves.easeIn,
    child: ElevatedButton(
      onPressed: onPressed, // Call the passed-in callback function
      child: Text(
        title,
        style: TextStyle(
          color: Colors.black,
          fontSize: 13,
        ),
      ),
      style: ElevatedButton.styleFrom(
        foregroundColor: isSelected ? Colors.white : Colors.white,
        backgroundColor: isSelected ? Colors.lime : Colors.white,
        // Adjust background color based on selection
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(40.0),
        ),
        minimumSize: Size(60, 60),
        side: BorderSide(
          color: Colors.black, // Set the border color to black
          width: 1.0, // Adjust the border width as needed (optional)
        ),
      ),
    ),
  );
}

Widget _buildInfoIconButton() {
  return Container(
    decoration: const ShapeDecoration(
      shape: CircleBorder(),
      color: Colors.lime,
    ),
    padding: const EdgeInsets.all(1.0),
    child: const Icon(
      Icons.info,
      color: Colors.white,
    ),
  );
}
