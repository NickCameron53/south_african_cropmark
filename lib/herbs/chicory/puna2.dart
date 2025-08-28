import 'package:flutter/material.dart';
import '../../../../abouttheguide.dart';
import '../../../../main.dart';
import '../../../../webpage.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../../Species_Tool_List.dart';



void launchURL(url) async {
  if (await launchUrl(Uri.parse(url))) {
    print("Successfully launched URL: $url"); // Optional success message
  } else {
    // Handle case where url can't be launched (e.g., show a message)
    print("Could not launch $url");
  }
}

class puna2 extends StatefulWidget {
  puna2({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<puna2> createState() {
    return _puna2State();
  }
}

class _puna2State extends State<puna2> {
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
                    'Grasslands Puna II',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Chicory',
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
                  'assets/chicorypic.png',
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
                          child: Text('Grasslands Puna II',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'A New Zealand bred, broad leafed, winter dormant but summer active cultivar bred for improved perenniality.',
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
                            "\u25BA A New Zealand bred, broad leafed, winter dormant but summer active cultivar bred for improved perenniality."
                            "\n\u25BA Has high nutritional quality, producing high yields from spring to late autumn. Tolerant to sclerotinia",
                            style: TextStyle(fontSize: 15)),
                        SizedBox(height: 20),
                        Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              ElevatedButton(
                                onPressed: () {
                                  launchURL(
                                      'https://pggwrightsonseeds.com/punaii');
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
                        Text('A valuable addition to most pasture seed mixes.',
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
                                        text: 'Leaf Size: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Large',
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
                                        text: 'Winter Activity: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Medium',
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
                                      text: '2 to 3 years',
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
                                        text: 'Growth Peaks: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Spring to Autumn',
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

                        SizedBox(height: 20),
                        SizedBox(
                          width: double.infinity,
                          child: Text('Animal safety',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
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
                          child: Text('Insect pest control',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
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
                                        text: 'Grass grub: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          'some tolerance for the established plant',
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
                                        text: 'Black Beetle larvae: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text:
                                          'some tolerance for the established plant',
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

                        Container(
                          width: double.infinity,
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

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
                                              text: '8 - 10 kg/ha',
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
                                              text: '1 - 2 kg/ha',
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
                                              text: '10 mm',
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
                                              text: 'Autumn or Spring',
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
