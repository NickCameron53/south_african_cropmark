import '../../abouttheguide.dart';
import '../../grasses/annual%20ryegrasses/bullet.dart';
import '../../grasses/annual%20ryegrasses/dash.dart';
import '../../grasses/annual%20ryegrasses/hogan.dart';
import '../../grasses/annual%20ryegrasses/jivet.dart';
import '../../grasses/annual%20ryegrasses/rampage.dart';
import '../../grasses/annual%20ryegrasses/sultan.dart';
import '../../grasses/annual%20ryegrasses/tama.dart';
import '../../grasses/annual%20ryegrasses/winterstar2.dart';
import '../../grasses/annual%20ryegrasses/zoom.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import 'cultivar_card_grasses.dart';
import 'grass_maturity_card.dart';

class annualryegrasssafe extends StatefulWidget {
  annualryegrasssafe({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<annualryegrasssafe> createState() {
    return _annualryegrasssafeState();
  }
}

class _annualryegrasssafeState extends State<annualryegrasssafe> {
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
                  'Annual ryegrass',
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
                    'assets/annualryegrasspic.png',
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
                            Row(
                              children: [
                                Text('Annual ryegrass',
                                    style: TextStyle(
                                        fontSize: 24,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[700])),
                                IconButton(
                                  icon: _buildInfoIconButton(),
                                  onPressed: () => Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              const MaturityCard())),
                                ),
                              ],
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
                            Container(
                              child: Text(
                                  "Annual (Westerwolds) ryegrasses are used as a temporary cool season feed between crops and will produce seed from a spring sowing."
                                  "\n\nSown in late summer or autumn, it persists for only 6-8 months, producing high volumes of quality feed."
                                  "\n\nCommonly sown between maize crops, annual ryegrass can also be mixed with short term brassicas or cereals to maximise winter DM yield.",
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
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('   Recommended cultivars',
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[700])),
                              ],
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Dash',
                                  link: dash(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Dash is quick out of the ground with rapid re-growth and excellent winter growth activity.',
                                  date: 'Late +25',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Rampage',
                                  link: rampage(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Rampage is the highest yielding annual ryegrass in the National Forage Variety Trials\u00ae with exceptional yield across all seasons.',
                                  date: 'Medium to Late +15',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Bullet\u2122',
                                  link: bullet(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Bullet displays superior establishment speed, very strong autumn, winter and early spring growth with very high pasture quality and palatability.',
                                  date: 'Medium to Late +14',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Zoom',
                                  link: zoom(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A densely tillered, high yielding annual ryegrass with large, upright, leafy tillers.',
                                  date: 'Medium to Late +14',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Hogan',
                                  link: hogan(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Hogan has very quick establishment, good winter and spring yields, and feed high quality over a six to eight month growth period.',
                                  date: 'Medium to Late +14',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Jivet',
                                  link: jivet(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Jivet is most suited for silage production and its characteristics include a large upright leaf for ease of mowing.',
                                  date: 'Late +18',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Winter Star II',
                                  link: winterstar2(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Improved rust resistance and recommended for quick winter to early spring feed.',
                                  date: 'Late +18',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Tama',
                                  link: tama(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' An older public tetraploid Westerwolds cultivar. Will not tolerate summer dry conditions. Superseded by newer cultivars for yield.',
                                  date: 'Medium to Late +14',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Sultan\u2122',
                                  link: sultan(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A European bred mid flowering diploid Westerwolds cultivar with fast establishment, good cool season growth, palatability and disease tolerance.',
                                  date: 'Medium to Late +15',
                                  ploidy: 'tetraploid'),
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
