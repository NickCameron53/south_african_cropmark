import 'package:flutter/material.dart';
import '../../../../AboutTheGuide.dart';
import '../../../../main.dart';
import '../../../../WebPage.dart';
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

class denmark extends StatefulWidget {
  denmark({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<denmark> createState() {
    return _denmarkState();
  }
}

class _denmarkState extends State<denmark> {
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
                    'Denmark',
                    style: TextStyle(color: Colors.white, fontSize: 18.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Sub Clover',
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
                  'assets/whitecloverpic.png',
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
                          child: Text('Denmark',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'High yielding variety. Moderate hard seed levels (15%). Is adapted to higher rainfall situations.',
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
                            "\u25BA A late flowering, high yielding variety."
                            "\n\u25BA Is adapted to higher rainfall situations."
                            "\n\u25BA Resistant to clover scorch and root rot. "
                            "\n\u25BA Has a prostrate growth habit which handles intensive sheep grazing and can continue to grow after flowering."
                            "\n\u25BA Persists well on moderate to heavy soils",
                            style: TextStyle(fontSize: 15)),
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
                          child: Text('Where it fits',
                              textAlign: TextAlign.left,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.green[700])),
                        ),
                        SizedBox(height: 10),
                        Text(
                            'Used for grazing or hay production in true dryland environments where white clover struggles to persist.',
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
                                        text: 'Seasonal Maturity: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Late season',
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
                                        text: 'Minimum Annual Rainfall: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: '600 mls',
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
                                        text: 'Soil Fertility: ',
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold)),
                                    TextSpan(
                                      text: 'Low to Medium',
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
                                      text: '1 year',
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
                                      text: 'Spring and Autumn',
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
                                              text: '10 kg/ha',
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
                                              text: '5 kg/ha',
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
                                              text: '10-15 mm',
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
                                              text: 'Autumn and Spring',
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
                            builder: (context) => AboutTheGuide()),
                      );
                      break;
                    case 1:
                      // Navigate to WebPage
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => WebPage()),
                      );
                      break;
                    case 2:
                      // Navigate to Toolkit page
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ToolList()),
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
