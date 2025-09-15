import '../../abouttheguide.dart';
import '../../legumes/red%20clover/aberclaret.dart';
import '../../legumes/red%20clover/amigain.dart';
import '../../legumes/red%20clover/morrow.dart';
import '../../legumes/red%20clover/rajah.dart';
import '../../legumes/red%20clover/reaper.dart';
import '../../legumes/red%20clover/relish.dart';
import '../../legumes/red%20clover/rossi.dart';
import '../../legumes/red%20clover/sensation.dart';
import '../../orders/orderform.dart';
import '../../select%20species/Legume/cultivar_card_clover.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';

class redclover extends StatefulWidget {
  redclover({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<redclover> createState() {
    return _redcloverState();
  }
}

class _redcloverState extends State<redclover> {
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
                  'Red Clover',
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
                    'assets/redcloverpic.png',
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
                            Text('Red Clover',
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
                                  "A short-lived, tap-rooted legume used in pasture mixes to provide high quality summer forage. Flowers later than white clover. May persist 2 to 4 years in mixed pastures and up to 5 years under favourable conditions. Performs best under low stocking rates, long summer rotations, or hay production. Red clovers contain phyto-oestrogens (formononetin) so should not be fed as a pure sward to breeding stock immediately prior to and during mating. The phyto-oestrogens help the plant tolerate insects (eg grass grub, black beetle) and leaf disease (eg pepper spot) attack. Highly preferred by deer. Tetraploid types usually have larger leaves but larger florets causing difficulty with pollination, leading to poorer seed set and poor re-establishment by seed. Spreading types need lax grazing to allow development of daughter plants from horizontal stems. Mixes well with specialist herbs such as Chico chicory.",
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
                              child: cultivarcardclover(
                                  title: 'Reaper',
                                  link: reaper(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A new, high yielding semi-erect growing diploid red clover. Has fine stems which are less stalky than traditional red clovers and is low in oestrogen levels. ',
                                  leafsize: 'Large',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Relish',
                                  link: relish(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A more persistent, semi-prostrate growth habit.',
                                  leafsize: 'Medium',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Aberclaret',
                                  link: aberclaret(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred for increased persistence. Semi-upright growth habit.',
                                  leafsize: 'Large',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Morrow',
                                  link: morrow(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'High yield with improved persistence under grazing.',
                                  leafsize: 'Large',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Rajah',
                                  link: rajah(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Low growing point red clover, highly persistent and tolerant to grazing.',
                                  leafsize: 'Large',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Rossi\u2122',
                                  link: rossi(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Early flowering cultivar bred for persistence under rotational grazing.',
                                  leafsize: 'Medium to Large',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Amigain',
                                  link: amigain(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Semi-prostrate growth habit to enhance persistence. Has root weevil tolerance.',
                                  leafsize: 'Medium to Large',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Sensation',
                                  link: sensation(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A very early, hay or pasture type. Very erect. Medium phyto-oestrogen levels.',
                                  leafsize: 'Medium to Large',
                                  persistence: '3-4 years'),
                            ),
                            SizedBox(height: 40),
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
