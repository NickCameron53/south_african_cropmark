import 'package:southafrica_seed_guide/legumes/lucerne/sw6330.dart';

import '../../global_widgets.dart';
import '../../legumes/lucerne/q31.dart';
import '../../select%20species/Legume/cultivar_card_lucerne.dart';
import 'package:flutter/material.dart';
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
                                title: 'Q31',
                                link: Q31Screen(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                    'Q31 has strong spring and summer seasonal production with excellent leaf retention and large leaf size.',
                                dormancy: '3',
                              ),
                            ),

                            SizedBox(height: 30),
                            Container(
                              child: cultivarcardlucerne(
                                title: 'SW6330',
                                link: SW6330Screen(
                                  country: widget.country,
                                  region: widget.region,
                                ),
                                description:
                                'SW6330 lucerne has strong spring to autumn dry matter production.',
                                dormancy: '6',
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
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),
    );
  }
}
