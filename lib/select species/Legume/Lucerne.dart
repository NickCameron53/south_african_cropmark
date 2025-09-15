import '../../abouttheguide.dart';
import '../../legumes/lucerne/714ql.dart';
import '../../legumes/lucerne/914ql.dart';
import '../../legumes/lucerne/galaxiemax.dart';
import '../../legumes/lucerne/kaituna.dart';
import '../../legumes/lucerne/pioneer54v09.dart';
import '../../legumes/lucerne/staminagt5.dart';
import '../../legumes/lucerne/takahe.dart';
import '../../legumes/lucerne/titan5.dart';
import '../../legumes/lucerne/torlesse.dart';
import '../../orders/orderform.dart';
import '../../select%20species/Legume/cultivar_card_lucerne.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../legumes/lucerne/force4.dart';
import '../../main.dart';

class lucerne extends StatefulWidget {
  lucerne({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<lucerne> createState() {
    return _lucerneState();
  }
}

class _lucerneState extends State<lucerne> {
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
                  'Lucerne',
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
                    'assets/galaxiemaxpic.png',
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
                            Text('Lucerne',
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
                                  "Lucerne is an erect growing, tap rooted perennial, generally grown in pure stands for sheep, cattle, horse, and deer grazing or hay production."
                                  "\n\nPrefers well drained neutral soils of pH 5.6 or greater, and is intolerant of water-logging. "
                                  "\n\nThe international lucerne dormancy scale of 1-10 is used where 1 = highly winter dormant, 10 = highly winter active."
                                  "\n\nWinter active varieties should be used in warmer climates and can produce 20% of their growth during winter months but tend to have a shorter stand life of 3-4 years."
                                  "\n\nSemi-dormant cultivars produce 5-10% of their growth in the winter and under good management may have a stand life of 5-7 years or more."
                                  "\n\nWinter dormant cultivars produce little or no winter growth but tend to have the longest stand life with a lower crown making them more suitable to grazing."
                                  "\n\nAvoid sowing lucerne into areas with an immediate pre-history of red clover, chicory, potatoes or onions as these crops can act as a host crop to ",
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
                              child: cultivarcardlucerne(
                                title: 'Galaxie Max',
                                link: galaxiemax(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Galaxie Max is a ready-to-use mixture of two elite lucerne varieties (50% Galaxie and 50% Timbale) both with a dormancy rating of 4.',
                                dormancy: '4',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Pioneer 54V09',
                                link: pioneer54v09(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Offers an excellent disease resistant package.',
                                dormancy: '4',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Force 4\u2122',
                                link: force4(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Excellent cold and drought tolerance. Shows good early season growth and good persistence.',
                                dormancy: '4',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Grasslands Torlesse',
                                link: torlesse(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'A highly persistent winter dormant NZ bred variety.',
                                dormancy: '4',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Takahē™',
                                link: takahe(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Bred for superior shoot density, and grows excellent quality forage with improved leaf:stem ratios.',
                                dormancy: '4',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Grasslands Kaituna',
                                link: kaituna(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Fine stemmed. Highly persistent. A general purpose variety.',
                                dormancy: '5',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Stamina® GT5',
                                link: staminagt5(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Bred for increased persistence, enabling it to tolerate set stocking and close grazing.',
                                dormancy: '5',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'Titan 5',
                                link: titan5(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    ' A semi-winter dormant and resilient cultivar combining a 50:50 cross between "Medicago sativa" lucerne (purple flower) and "Medicago falcata" (yellow flower) lucerne.',
                                dormancy: '5',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: '714QL',
                                link: sf714ql(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    ' A semi-winter active soft stemmed variety suitable for cutting or grazing.',
                                dormancy: '7',
                              ),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: '914QL',
                                link: sf914ql(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    ' A highly winter active type with improved persistence.',
                                dormancy: '7',
                              ),
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
                    MaterialPageRoute(builder: (context) => abouttheguide()),
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
