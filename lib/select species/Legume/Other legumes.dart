import '../../AboutTheGuide.dart';
import '../../legumes/other%20legumes/arrowleafclover.dart';
import '../../legumes/other%20legumes/caucasianclover.dart';
import '../../legumes/other%20legumes/persianclover.dart';
import '../../legumes/other%20legumes/strawberryclover.dart';
import '../../legumes/other%20legumes/taipan.dart';
import '../../legumes/other%20legumes/viper.dart';
import '../../orders/orderform.dart';
import '../../select%20species/Legume/cultivar_card_otherlegumes.dart';
import '../../WebPage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../legumes/other legumes/lotus.dart';
import '../../main.dart';

class otherlegumes extends StatefulWidget {
  otherlegumes({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<otherlegumes> createState() {
    return _otherlegumesState();
  }
}

class _otherlegumesState extends State<otherlegumes> {
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
                  'Other Legumes',
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
                    'assets/whitecloverpic.png',
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
                            Text('Other Legumes',
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
                                  "Perennial types include Caucasian Clover, Lotus species and Strawberry Clover which may last greater than 5 years. Annual clovers are often used in place of red or white clovers due to their superior early season growth, or their ability to survive dry periods.",
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
                              child: cultivarcardotherlegumes(
                                  title: 'Caucasian Clover',
                                  link: caucasianclover(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A very slow establishing, strongly rhizomatous, tap rooted, perennial legume.',
                                  species: 'Trifolium ambiguum',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardotherlegumes(
                                  title: 'Strawberry Clover',
                                  link: strawberryclover(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A vigorous, large leaf species with good production in spring and summer and fair winter growth.',
                                  species: 'Trifolium fragiferum',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardotherlegumes(
                                  title: 'Lotus',
                                  link: lotus(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Performs well where other clovers fail and is often used in hill country forestry situations noted for their tough environments.',
                                  species: 'Lotus pedunculatus',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardotherlegumes(
                                  title: 'Zulu II Arrowleaf Clover',
                                  link: arrowleafclover(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Tap-rooted annual clover with roots that can reach 1.5m deep. Has excellent tolerance to acid soils but will not tolerate extended waterlogging and heavy soils must be avoided.',
                                  species: 'Trifolium vesiculosum',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardotherlegumes(
                                  title: 'Laser Persian Clover',
                                  link: persianclover(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Excellent tolerance to wet conditions, significantly out-yields sub clovers in wet years in waterlogged paddocks. Tolerates mild soil salinity.',
                                  species: 'Trifolium resupinatum\n ssp majus',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardotherlegumes(
                                  title: 'Taipan Balansa Clover',
                                  link: taipan(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A self regenerating annual that survives by producing large amounts of hard seed. Tolerant to waterlogging.',
                                  species: 'Trifolium balansae',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardotherlegumes(
                                  title: 'Viper Balansa Clover',
                                  link: viper(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A self regenerating annual that survives by producing large amounts of hard seed. Tolerant to waterlogging.',
                                  species: 'Trifolium balansae',
                                  persistence: '1 year'),
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
