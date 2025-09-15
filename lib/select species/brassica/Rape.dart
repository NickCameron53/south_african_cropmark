import 'package:flutter/material.dart';
import 'package:southafrica_seed_guide/brassicas/rape/rifleman.dart';
import '../../Species_Tool_List.dart';
import '../../AboutTheGuide.dart';
import '../../brassicas/rape/pillar.dart';
import '../../main.dart';
import '../../orders/orderform.dart';
import '../../WebPage.dart';
import 'cultivar_card_brassica.dart';

class rape extends StatefulWidget {
  rape({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<rape> createState() {
    return _rapeState();
  }
}

class _rapeState extends State<rape> {
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
                  'Forage Rape',
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
                    'assets/rapepic.png',
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
                            Text('Forage Rape',
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
                            Container(
                              child: Text(
                                  "Forage rape may be sown alone or in mixtures as a specialist summer to winter feed.\n"
                                  " Rape is often included in pasture mixes and sown at 1-2 kg/ha. It can be sown from early spring to late summer and is generally ready to graze 12-16 weeks after sowing.\n"
                                  " Aphids need to be controlled if using susceptible cultivars.\n"
                                  " Do not grow in clubroot infected areas unless resistant cultivars are used. \n"
                                  "Some care is required when grazing rape and it is best to allow the crop to fully mature before grazing and also gradually increase rape as their diet. Do not allow hungry livestock that were previously on pasture to adlib feed on rape, as problems such as nitrate poisoning and rape scald can occur.",
                                  style: TextStyle(fontSize: 15)),
                            ),
                            SizedBox(height: 10),
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
                              child: cultivarcardbrassica(
                                  title: 'Rifleman',
                                  link: rifleman(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A new fast establishing, high yielding multi-graze intermediate type rape with good aphid tolerance and disease resistance.',
                                  daystomaturity: '70-90',
                                  grazing: 'multi-grazing'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardbrassica(
                                  title: 'Pillar',
                                  link: pillar(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A new fast establishing, high yielding multi-graze giant type rape with good aphid tolerance and disease resistance.',
                                  daystomaturity: '90-110',
                                  grazing: 'multi-grazing'),
                            ),
                            SizedBox(height: 30),
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
