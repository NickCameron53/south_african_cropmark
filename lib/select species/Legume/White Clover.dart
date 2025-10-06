import '../../global_widgets.dart';
import '../../legumes/white%20clover/aberdance.dart';
import '../../legumes/white%20clover/aberlasting.dart';
import '../../legumes/white%20clover/abernormous.dart';
import '../../legumes/white%20clover/apex.dart';
import '../../legumes/white%20clover/brace.dart';
import '../../legumes/white%20clover/demand.dart';
import '../../legumes/white%20clover/huia.dart';
import '../../legumes/white%20clover/kotuku.dart';
import '../../legumes/white%20clover/legacy.dart';
import '../../legumes/white%20clover/mainstay.dart';
import '../../legumes/white%20clover/mantra.dart';
import '../../legumes/white%20clover/nomad.dart';
import '../../legumes/white%20clover/quartz.dart';
import '../../legumes/white%20clover/quest.dart';
import '../../legumes/white%20clover/ruru.dart';
import '../../legumes/white%20clover/tribute.dart';
import '../../select%20species/Legume/cultivar_card_clover.dart';
import 'package:flutter/material.dart';
import '../../legumes/white clover/attribute.dart';
import '../../legumes/white clover/emblem.dart';
import '../../legumes/white clover/hilltop.dart';
import '../../main.dart';

class whiteclover extends StatefulWidget {
  whiteclover({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<whiteclover> createState() {
    return _whitecloverState();
  }
}

class _whitecloverState extends State<whiteclover> {
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
                  'White Clover',
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
                            Text('White Clover',
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
                                  "A perennial legume used in pasture mixes to fix nitrogen and to provide high quality forage. Best used on moderate to highly fertile soils. Spreads predominantly by stolons and by producing roots at the stolon nodes to form new plants. Regeneration by seed under lax grazing also occurs. Lax infrequent grazing is recommended for the large leaved types and close frequent grazing for the small leaved types. White clover is susceptible to shading during development so do not let newly sown pastures become too rank. If clover root weevil is a problem, consider using higher sowing rates and additionally add chicory and red clover to the mix. Consider also mixing large leaved with medium leaved cultivars to the mix, or medium and small leaved cultivars where this management is required.",
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
                                  title: 'Mantra',
                                  link: mantra(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Mantra is a new mid flowering white clover with strong winter, early spring growth with good tolerance to sclerotinia.',
                                  leafsize: 'Large',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Demand',
                                  link: demand(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Demand was bred for improved persistence. It has superior spring to summer yield compared to Huia and long more densely branched stolons.',
                                  leafsize: 'Medium',
                                  persistence: '3 to 5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Kotuku',
                                  link: kotuku(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Has superior summer growth and has good persistence, and suits both dairying and sheep/beef finishing systems.',
                                  leafsize: 'Large',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Legacy',
                                  link: legacy(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Selected for performance in modern grazing systems.',
                                  leafsize: 'Large',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Brace',
                                  link: brace(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Well suited to dairy and beef farming systems & silage production.',
                                  leafsize: 'Large',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Mainstay',
                                  link: mainstay(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Well suited to dairy and beef farming systems & silage production.',
                                  leafsize: 'Large',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Abernormous',
                                  link: abernormous(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred for stress tolerance, grazing tolerance, pest and disease resistance.',
                                  leafsize: 'Large',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Quest',
                                  link: quest(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Good frost tolerance and winter growth.\n Some tolerance to clover root weevil.',
                                  leafsize: 'Medium to Large',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Attribute',
                                  link: attribute(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Suited for most grazing systems.',
                                  leafsize: 'Medium to Large',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Tribute',
                                  link: tribute(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Tolerant to clover root weevil attack.',
                                  leafsize: 'Medium to Large',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Ruru',
                                  link: ruru(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Ruru has more aggressive growth and higher year-round yield than Weka, particularly in summer.',
                                  leafsize: 'Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Quartz',
                                  link: quartz(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A persistent white clover that has broad adaptability across environments and farm systems.',
                                  leafsize: 'Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Huia',
                                  link: huia(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Huia was first produced in 1957. Now superseded by Demand and Prestige.',
                                  leafsize: 'Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Aberdance',
                                  link: aberdance(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Winter hardy so performs well under cooler moist conditions.',
                                  leafsize: 'Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Apex',
                                  link: apex(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred for improved stolon growing points and greater persistence under drier conditions. Good tolerance to clover root weevil.',
                                  leafsize: 'Small to Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Emblem',
                                  link: emblem(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred to cope with more challenging environments from variable soil fertility to variable moisture availability.',
                                  leafsize: 'Small to Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Nomad',
                                  link: nomad(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred for increased stolon recovery after dry summers.',
                                  leafsize: 'Small to Medium',
                                  persistence: '5+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'Grasslands Hilltop',
                                  link: hilltop(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Bred to cope with more challenging environments from variable soil fertility to variable moisture availability.',
                                  leafsize: 'Small to Medium',
                                  persistence: '3+ years'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardclover(
                                  title: 'DoubleRoot',
                                  link: aberlasting(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A hybrid cross of Caucasian clover and small leaved white clover, providing farmers with the benefits of both.',
                                  leafsize: 'Small',
                                  persistence: '5+ years'),
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
