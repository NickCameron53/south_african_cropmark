import '../../AboutTheGuide.dart';
import '../../grasses/perennial grasses/diploid ryegrass/arraynea2.dart';
import '../../grasses/perennial grasses/diploid ryegrass/maxsynnea4.dart';
import '../../grasses/perennial grasses/diploid ryegrass/midwayar37.dart';
import '../../grasses/perennial grasses/diploid ryegrass/sequelstandard.dart';
import '../../grasses/perennial grasses/diploid ryegrass/stampedecm142.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/abergreennil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/abermagicnil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/excessar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/expoar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/governornil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/hustlear1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/legionar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/matrixnil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/moxienil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/nuinil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/one50nil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/platformar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/prospectar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/reasonar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/relyar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/requestar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/rohannil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/samsonnil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/three60ar1.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/trojannil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/tysonnil.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/ultranil.dart';
import '../../orders/orderform.dart';
import '../../WebPage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';

import 'cultivar_card_grasses.dart';
import 'grass_maturity_card.dart';

class DiploidRyegrassSafe extends StatefulWidget {
  DiploidRyegrassSafe({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<DiploidRyegrassSafe> createState() {
    return _DiploidRyegrassSafeState();
  }
}

class _DiploidRyegrassSafeState extends State<DiploidRyegrassSafe> {
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
                  'Diploid perennial ryegrass',
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
                    'assets/diploidlp.png',
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
                                Text('Diploid perennial ryegrass',
                                    style: TextStyle(
                                        fontSize: 22,
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
                                  'Bred specifically for tougher environments Diploids combine yield and robustness, meaning that even in less than ideal conditions, they are more likely to deliver for your stock. Generally sown at 18 to 20 kg/ha alone or 8 to 15 kg/ha in a mixture. They tolerate harder grazing management than tetraploids, and need less moisture (minimum 550mm p.a.) to perform well. Newer later-heading cultivars tend to produce higher amounts of quality pasture late spring and often have greater winter activity than some of the older, early-heading cultivars.',
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

                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Stampede',
                                  link: StampedeScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'Attractive dark green cultivar which produces strongly year round particularly through the spring & autumn.',
                                  date: 'Medium +11',
                                  ploidy: 'diploid'),
                            ),
                            // Sequel Enhanced
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Sequel',
                                  link: SequelScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'Late perennial ryegrass with robust disease resistance.',
                                  date: 'Late +20',
                                  ploidy: 'diploid'),
                            ),

                            // Matrix
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Matrix',
                                  link: MatrixScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'Reliable, high producing and high quality, palatable pasture which persists well.',
                                  date: 'Late +17',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Ultra',
                                  link: UltraScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'Consistently high yield and persistence for good animal health and insect control.',
                                  date: 'Medium to Late +14',
                                  ploidy: 'diploid'),
                            ),

                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Array',
                                  link: ArrayScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'Array has very high winter growth and is strongly persistent.',
                                  date: 'Late +23',
                                  ploidy: 'diploid'),
                            ),
                            // Expo
                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Expo',
                                  link: ExpoScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'A densely tillered grass with low aftermath heading that offers strong year-round production & cool season growth.',
                                  date: 'Late +21',
                                  ploidy: 'diploid'),
                            ),
                            // One50
                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Three\u2076\u2070 AR1',
                                  link: Three60Screen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Very high dry matter producing cultivar with good spring quality, medium to fine tiller size. Good tolerance to crown rust.',
                                  date: 'Late +20',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'One50',
                                  link: One50Screen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'A high yielding, medium leaf sized cultivar offering good summer, autumn & winter yields.',
                                  date: 'Late +20',
                                  ploidy: 'diploid'),
                            ),
                            // One50
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Abermagic',
                                  link: AbermagicScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'A persistent UK-bred cultivar with fine leaves & good tiller density, suitable for both silage & grazing.',
                                  date: 'Late +19',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Abergreen',
                                  link: AbergreenScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A UK-bred cultivar with vigorous ground cover suitable for both grazing & silage systems.',
                                  date: 'Late +17',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Rohan',
                                  link: RohanScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A persistent spreading cultivar well suitable to sheep & beef systems with its fine leaves & dense habit.',
                                  date: 'Late +16',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Trojan',
                                  link: TrojanScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Good feed quality, good resistance to rust & plant pulling.',
                                  date: 'Medium to Late +13',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Legion',
                                  link: LegionScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred from perennial ryegrass plants that were individually screened for persistence, rust tolerance and vigour in Canterbury, Manawatu, Waikato and Northland.',
                                  date: 'Medium to Late +13',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Prospect',
                                  link: ProspectScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A dense fine leaved cultivar offering reliable all year-round production.',
                                  date: 'Medium +12',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Platform',
                                  link: PlatformScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description: 'A densely tillered grass.',
                                  date: 'Medium +12',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Maxsyn',
                                  link: MaxsynScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  //placeholder for future darts
                                  description:
                                      'Maxsyn NEA4 is a densely tillered perennial ryegrass for all farm systems with strong summer and autumn growth.',
                                  date: 'Medium +8',
                                  ploidy: 'diploid'),
                            ),
                            // Excess
                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Hustle\u2122',
                                  link: HustleScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Has broad disease tolerance, and performs well in a range of environments with exceptional cool season performance.',
                                  date: 'Medium +8',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Governor',
                                  link: GovernorScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'This fine leafed & densely tillered plant offers low aftermath heading.',
                                  date: 'Medium +8',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Excess',
                                  link: ExcessScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A medium leaved, persistent variety bred for high yields & cool season growth; suited to dairy, sheep or beef systems.',
                                  date: 'Medium +7',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Reason',
                                  link: ReasonScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Well balanced seasonal growth with excellent early spring growth.',
                                  date: 'Early +3',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Midway',
                                  link: MidwayScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Selected for low aftermath heading.',
                                  date: 'Early +3',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Samson',
                                  link: SamsonScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'An older, medium tillered semi-erect cultivar with excellent resistance to crown rust.',
                                  date: 'Early +3',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Request',
                                  link: RequestScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Produces strongly through the spring & autumn with very leafy summer grass.',
                                  date: 'Early +0',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Rely',
                                  link: RelyScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A fine leafed, densely tillered variety suited to dairy, sheep & beef systems. Can tolerate lower fertility & set stocking.',
                                  date: 'Early +0',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),

                            Container(
                              child: cultivarcard(
                                  title: 'Moxie\u2122',
                                  link: MoxieScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Susceptible to crown & stem rust leading to reduced animal palatability.',
                                  date: 'Early +0',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Nui',
                                  link: NuiScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Susceptible to crown & stem rust leading to reduced animal palatability.',
                                  date: 'Early +0',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Tyson',
                                  link: TysonScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Early heading variety with early spring growth.',
                                  date: 'Very Early -10',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 100),
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
