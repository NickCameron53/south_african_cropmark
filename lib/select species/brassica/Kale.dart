import 'package:flutter/material.dart';
import 'package:southafrica_seed_guide/brassicas/kale/kea.dart';
import '../../Species_Tool_List.dart';
import '../../AboutTheGuide.dart';
import '../../brassicas/kale/coleor.dart';
import '../../main.dart';
import '../../orders/orderform.dart';
import '../../WebPage.dart';
import 'cultivar_card_kale.dart';
import '../../global_widgets.dart';

class kale extends StatefulWidget {
  kale({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<kale> createState() {
    return _kaleState();
  }
}

class _kaleState extends State<kale> {
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
                  'Kale (Chou Moellier)',
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
                    'assets/kalepic.png',
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
                            Text('Kale (Chou Moellier)',
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
                                  "Also known as Chou Moellier, kales are winter active and mainly used as a winter feed yielding up to 18t DM/ha."
                                  "\n\nStem types are classed as short, short to medium, medium, intermediate and giant with giant types the tallest."
                                  "\n\nThey are generally resistant to aphid, club root and dry rot. "
                                  "\n\nKales require high soil fertility and good soil moisture for high yield although they can withstand moisture stress if sown early. Sow in spring for feeding over winter. Kales can be mixed with swedes in which case the sowing rate should be reduced to 2 kg/ha. Higher sowing rates lead to thinner and more palatable stems."
                                  "\n\nKales should be strip fed to reduce wastage, taking 150 to 220 days to reach maturity.  "
                                  "\n\nSuitable for cattle, sheep, deer, but the giant cultivars are best used only for cattle. "
                                  "\n\nGrazing must be light in late summer if re-growth is required. Hay or pasture run-off will improve the nutritional balance of stock grazing kale. "
                                  "\n\nTo reduce risk of SMCO toxicity avoid the use of sulphate fertiliser, particularly where soil sulphate levels are high.",
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
                              child: cultivarcardkale(
                                  title: 'Kea',
                                  link: KeaScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Kea is an intermediate kale selected for its high dry matter yield and leaf percentage.',
                                  daystomaturity: '50 - 220',
                                  stemtype: 'Intermediate to Giant'),
                            ),
                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardkale(
                                  title: 'Coleor',
                                  link: ColeorScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Coleor is a hybrid, short to medium stem, leafy purple coloured cultivar producing very large leaves and a very high leaf to stem yield ratio of around 60% leaf.',
                                  daystomaturity: '150 - 220',
                                  stemtype: 'Short to Medium'),
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
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),
    );
  }
}
