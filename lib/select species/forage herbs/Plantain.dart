import '../../AboutTheGuide.dart';
import '../../herbs/plantain/agritonic.dart';
import '../../herbs/plantain/captaincsp.dart';
import '../../herbs/plantain/ecotain.dart';
import '../../herbs/plantain/oracle.dart';
import '../../herbs/plantain/oasis.dart';
import '../../orders/orderform.dart';
import '../../WebPage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';

import 'cultivar_card_herbs.dart';

class plantain extends StatefulWidget {
  plantain({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<plantain> createState() {
    return _plantainState();
  }
}

class _plantainState extends State<plantain> {
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
                  'Plantain',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
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
      body: ListView(
        children: [
          Container(
            // This container wraps all content within the list

            child: Column(
              // Use Column to manage the vertical layout

              children: [
                Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Takes full width of the screen
                  height: 100,
                  child: Image.asset(
                    'assets/plantainpic.png',
                    fit: BoxFit
                        .cover, // Use BoxFit.cover to cover the entire area
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 350,
                        child: Column(
                          children: [
                            Text('Plantain',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700])),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.green,
                              thickness: 1,
                              height: 20,
                              indent: 5,
                              endIndent: 5,
                            ),
                            SizedBox(height: 10),
                            Text(
                                "Plantain is a palatable, mineral rich perennial herb with a deep fibrous root system enabling good heat and drought tolerance and which is generally recommended for use in lower fertility dryland pasture mixes."
                                "\n\nIt will tolerate low phosphorus and potassium soils and grows within a broad soil pH range of 4.2 - 7.8.  It will not tolerate swampy soils."
                                "\n\nOften used with chicory for use in deer mixtures. It has nearly twice the uptake of Selenium and triple that of Copper compared to ryegrass and provides higher levels of Calcium, Sodium and Zinc in the diet to the grazing animal.",
                                style: TextStyle(fontSize: 15)),
                            SizedBox(height: 40),
                            Divider(
                              color: Colors.green,
                              thickness: 1,
                              height: 20,
                              indent: 5,
                              endIndent: 5,
                            ),
                            SizedBox(height: 10),
                            Text('Recommended cultivars:',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700])),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardherbs(
                                  title: 'Oracle',
                                  link: oracle(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Oracle is late heading, broad leafed plantain bred for high forage yields under grazing.',
                                  persistence: '3 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardherbs(
                                  title: 'Agritonic',
                                  link: agritonic(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A forage plantain cultivar which has many of the seasonal growth features of Tonic while having an increased leaf number.',
                                  persistence: '3 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardherbs(
                                  title: 'Captain CSP',
                                  link: captaincsp(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Improved cool-season activity and summer yields.',
                                  persistence: '3 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardherbs(
                                  title: 'Ecotain',
                                  link: ecotain(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A brand for a plantain mix that focuses on reducing N leaching from stock urine patches.',
                                  persistence: '3 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardherbs(
                                  title: 'Oasis',
                                  link: oasis(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred for persistence and uniformity, mid flowering (two weeks later than Tonic) with a broad medium-large leaf size with upright growth.',
                                  persistence: '3 years'),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
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
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => AboutTheGuide()),
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
}
