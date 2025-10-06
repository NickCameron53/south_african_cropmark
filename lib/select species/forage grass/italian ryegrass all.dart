import '../../global_widgets.dart';
import '../../grasses/italian%20ryegrasses/appeal.dart';
import '../../grasses/italian%20ryegrasses/feast2.dart';
import '../../grasses/italian%20ryegrasses/lushar37.dart';
import '../../grasses/italian%20ryegrasses/manta.dart';
import '../../grasses/italian%20ryegrasses/moata.dart';
import '../../grasses/italian%20ryegrasses/perun.dart';
import '../../grasses/italian%20ryegrasses/indulgence.dart';
import '../../grasses/italian%20ryegrasses/supercruise.dart';
import '../../grasses/italian%20ryegrasses/tabu.dart';
import '../../grasses/italian%20ryegrasses/vibe.dart';
import 'package:flutter/material.dart';
import '../../grasses/italian ryegrasses/asset.dart';
import '../../main.dart';

import 'cultivar_card_grasses.dart';
import 'grass_maturity_card.dart';

class ItalianRyegrassAll extends StatefulWidget {
  ItalianRyegrassAll({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<ItalianRyegrassAll> createState() {
    return _ItalianRyegrassAllState();
  }
}

class _ItalianRyegrassAllState extends State<ItalianRyegrassAll> {
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
                  'Italian ryegrass',
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
                                Text('Italian ryegrass',
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
                                  "Italian ryegrasses are usually erect shorter term grasses producing very high winter and early spring yield of high quality."
                                  "\n\nItalian ryegrasses require a winter period to form seed heads.",
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
                                  title: 'Vibe',
                                  link: VibeScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A very persistent and very high yielding diploid Italian ryegrass, which bounces back from hard grazings well.',
                                  date: 'Late to V. Late +26',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Appeal',
                                  link: AppealScreen(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Strong disease resistance including rust, resulting in improved animal acceptance high quality forage',
                                  date: 'Late +22',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Supercruise',
                                  link: supercruise(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A reliable option for undersowing into worn out pastures.',
                                  date: 'Late +20',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Feast II',
                                  link: feast2(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A tetraploid Italian ryegrass selection from Concord with a similar heading date.',
                                  date: 'Medium to Late +17',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Lush',
                                  link: lushar37(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A more persistent tetraploid cultivar with relatively low aftermath heading. It can cause ryegrass staggers and should only be used as an under sowing option. Good rust tolerance.',
                                  date: 'Medium to Late +17',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Moata',
                                  link: moata(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Good winter activity, with limited persistence and will not tolerate drier summer conditions',
                                  date: 'Medium to Late +16',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Manta',
                                  link: manta(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Manta has an upright habit, medium tiller size, and broad leaves.',
                                  date: 'Late +15',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Grasslands Asset',
                                  link: asset(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Higher tiller density and relatively low aftermath heading.',
                                  date: 'Medium to Late +14',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Perun',
                                  link: perun(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'An inter-species cross between Italian ryegrass and meadow fescue bred in Europe under conservation management systems.',
                                  date: 'Medium +12',
                                  ploidy: 'tetraploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Tabu +',
                                  link: tabu(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'large upright strong tillers and very leafy, with good yields in autumn- mid summer over many regions.',
                                  date: 'Medium +11',
                                  ploidy: 'diploid'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcard(
                                  title: 'Indulgence\u2122',
                                  link: indulgence(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A European bred, densely tillered, fine leafed and palatable diploid cultivar.',
                                  date: 'Medium +8',
                                  ploidy: 'diploid'),
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
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),

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
