import '../../global_widgets.dart';
import '../../grasses/perennial%20grasses/cocksfoot/aurus.dart';
import '../../grasses/perennial%20grasses/cocksfoot/greenly2.dart';
import '../../grasses/perennial%20grasses/cocksfoot/kainui.dart';
import '../../grasses/perennial%20grasses/cocksfoot/redefine.dart';
import '../../grasses/perennial%20grasses/cocksfoot/safin.dart';
import '../../grasses/perennial%20grasses/cocksfoot/savvy.dart';
import '../../grasses/perennial%20grasses/cocksfoot/vision.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

import 'cultivar_card_cocksfoot.dart';

class Cocksfoot extends StatefulWidget {
  Cocksfoot({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<Cocksfoot> createState() {
    return _CocksfootState();
  }
}

class _CocksfootState extends State<Cocksfoot> {
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
                  'Cocksfoot',
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
                    'assets/cocksfootpic.png',
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
                            Text('Cocksfoot',
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
                                  'A slower establishing, productive, drought tolerant perennial grass species which grows strongly in summer.'
                                  '\nCocksfoot is best used in drier, moderate fertility and free draining soils.'
                                  '\nCocksfoot once established resists pasture pest attack.'
                                  '\nIts forage quality is not as good as perennial ryegrass and the species requires grazing to prevent excessive seed head development during spring.'
                                  '\nBest sown when soil temperatures are warm. Upright forms of Cocksfoot may be mixed with perennial ryegrass and phalaris.'
                                  '\nLower seeding rates of the prostrate forms should be considered if used in mixes.'
                                  '\nContinental types are highly summer active, growing mainly in spring, summer and autumn and persist well in well-drained soils.'
                                  '\nOceanic types are also summer active but are more suited to cooler higher rainfall climates.'
                                  '\nMediterranean types are summer dormant with a high level of drought tolerance and are more suited to drier climates. ',
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
                              child: cultivarcardcocksfoot(
                                  title: 'Kainui',
                                  link: KainuiScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Kainui has high tiller density, and soft ryegrass-like leaves, with very good disease resistance.',
                                  date: 'Late +22',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardcocksfoot(
                                  title: 'Vision',
                                  link: VisionScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Vision has a finer stem and leaf form than some cocksfoots but is not excessively dense, allowing good compatability with other grasses and clovers.',
                                  date: 'Medium +10',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardcocksfoot(
                                  title: 'Redefine',
                                  link: RedefineScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Redefine is a less aggressive type with good compatibility with perennial ryegrass.',
                                  date: 'Medium to Late',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardcocksfoot(
                                  title: 'Aurus',
                                  link: AurusScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'An upright winter-active and later heading cocksfoot with good winter growth and strong disease resistance.',
                                  date: 'Medium to Late',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardcocksfoot(
                                  title: 'Greenly II',
                                  link: Greenly2Screen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred in south west France. A finer leaved type with a more upright growth habit.',
                                  date: 'Late',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardcocksfoot(
                                  title: 'Grasslands Savvy',
                                  link: SavvyScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'An upright winter-active and later heading cocksfoot with good winter growth and strong disease resistance.',
                                  date: 'Medium',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardcocksfoot(
                                  title: 'Safin',
                                  link: SafinScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A very fine leaved cultivar with high leaf/stem ratio in summer.',
                                  date: 'Early to Medium.',
                                  type: 'Continental'),
                            ),
                            SizedBox(height: 10),
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
