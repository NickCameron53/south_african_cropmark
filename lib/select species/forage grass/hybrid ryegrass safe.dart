import 'package:southafrica_seed_guide/grasses/hybrid%20grasses/mohakaar1.dart';

import '../../abouttheguide.dart';
import '../../grasses/hybrid grasses/forgenea.dart';
import '../../grasses/hybrid grasses/palliserar37.dart';
import '../../grasses/hybrid grasses/splicear1.dart';
import '../../grasses/hybrid%20grasses/delishlow.dart';
import '../../grasses/hybrid%20grasses/frenzylow.dart';
import '../../grasses/hybrid%20grasses/maverickg2.dart';
import '../../grasses/hybrid%20grasses/ohaulow.dart';
import '../../grasses/hybrid%20grasses/shogunlow.dart';
import '../../grasses/hybrid%20grasses/supremepluslow.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import 'cultivar_card_grasses.dart';
import 'grass_maturity_card.dart';

class hybridryegrasssafe extends StatefulWidget {
  hybridryegrasssafe({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<hybridryegrasssafe> createState() {
    return _hybridryegrasssafeState();
  }
}

class _hybridryegrasssafeState extends State<hybridryegrasssafe> {
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
                  'Hybrid ryegrass',
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
                    'assets/italianryegrasspic.png',
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
                                Text('Hybrid ryegrass',
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
                                  "A cross between Perennial ryegrass and Italian or Annual ryegrass. Hybrids generally have high annual yields and will persist for 2-3+ years depending on their percentage of perennial ryegrass parentage, climatic conditions, insect pressure and paddock management."
                                  "\n\nHybrids which contain a greater percentage of Italian ryegrass parentage, can grow almost as much winter feed as a straight Italian ryegrass cultivar but with improved persistence. Hybrids with a greater percentage of perennial ryegrass tend to have greater persistence."
                                  "\n\nEndophyte can enhance insect tolerance and improve overall persistence. Tetraploid types are larger plants which perform best under high fertility moist conditions.",
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
                                  title: 'Frenzy',
                                  link: frenzylow(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Frenzy is a new very high yielding tetraploid hybrid (short rotation) ryegrass. Frenzy has unrivalled establishment speed compared to other cultivars trialled. It has improved year-round yields with very strong autumn-winter growth. Its very fast establishment makes it ideally suited for stitching into old or run-out pastures as well as short term (2-3 years) specialist pastures. Frenzy has excellent livestock performance potential and has excellent resistance to stem and crown rust.',
                                  date: 'Late +16',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Splice',
                                  link: splicear1(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' An improved heat tolerant, highly winter productive festulolium hybrid grass. Splice to be used as a medium term (2 - 4 year) pasture, or for over-sowing into run-out or damaged pastures to extend their life.',
                                  date: 'Late +19',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Palliser',
                                  link: palliserar37(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Can be used as either a short or long rotation ryegrass.',
                                  date: 'Very Late +25',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Mohaka',
                                  link: mohakaar1(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A cultivar bred for improved early growth and cool season activity. Mohaka is a broad leaved, well tillered hybrid suited to 2-4 year pastures.',
                                  date: 'Late +20',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Maverick GII',
                                  link: maverickg2(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A late heading short rotation ryegrass with good winter and spring yields, improved summer production and summer forage quality, low aftermath heading.',
                                  date: 'Late +17',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands \n       Supreme Plus',
                                  link: supremepluslow(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A late-heading diploid cultivar with high tiller density which provides advantages where heavy grazing and pugging are likely to occur.',
                                  date: 'Late +15',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Shogun',
                                  link: shogunlow(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A medium to late heading tetraploid providing good summer and autumn yields.',
                                  date: 'Late +13',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Forge',
                                  link: forgenea(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' Forge is a new tetraploid hybrid ryegrass with good cool season production.',
                                  date: 'Medium +11',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Delish',
                                  link: delishlow(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A fine leaved and densely tillered tetraploid short rotation ryegrass, with low aftermath heading.',
                                  date: 'Medium +9',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Ohau',
                                  link: ohaulow(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      ' A long rotation tetraploid with good winter and early spring growth. Moderate resistance to rust. Low aftermath heading.',
                                  date: 'Medium +8',
                                  ploidy: 'tetraploid'),
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
