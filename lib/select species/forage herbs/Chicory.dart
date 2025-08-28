import '../../abouttheguide.dart';
import '../../herbs/chicory/five01.dart';
import '../../herbs/chicory/puna2.dart';
import '../../herbs/chicory/punter.dart';
import '../../herbs/chicory/sika.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../herbs/chicory/chico.dart';
import '../../herbs/chicory/choice.dart';
import '../../main.dart';


import 'cultivar_card_herbs.dart';

class chicory extends StatefulWidget {
  chicory({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<chicory> createState() {
    return _chicoryState();
  }
}

class _chicoryState extends State<chicory> {
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
                    'Chicory',
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
                      'assets/chicorypic.png',
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
                              Text('Chicory',
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
                              Text(
                                  "Chicory is a summer active, highly palatable perennial herb which is regarded as a valuable addition to most pasture seed mixes."
                                  "\n\nChicory has broad leaves and a long thick tap-root with an exposed crown. The crown regenerates shoots which in turn develop their own roots.  This crown can be damaged by heavy winter treading and over-grazing."
                                  "\n\nChicory will tolerate a wide soil pH range but grows best in a range of pH 5.5- 6.0."
                                  "\n\nChicory is best shallow sown and when soil conditions are warm. When used in finishing mixtures chicory should always be sown with a suitable legume such as red and white clovers.",
                                  style: TextStyle(fontSize: 15)),
                              SizedBox(height: 20),
                              Text(
                                'Recent Information shows Chicory reduces Nitrogen leaching:',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700]),
                              ),
                              Text(
                                  "Lincoln University research has recently found that cows fed Chicory had reduced urinary N load and produced more milk solids than cows fed plantain."
                                  "\n\nFeeding Chicory increases water, sodium and potassium intakes, which dilutes urine. Chicory is the next forage that will be added to the OverseerFM N-budgeting model to give credit for reduced N-losses from Chicory pastures.",
                                  style: TextStyle(fontSize: 15)),
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
                                child: cultivarcardherbs(
                                    title: 'Chico',
                                    link: chico(country: widget.country, region: widget.region,),
                                    description:
                                        'Chico is a more cool season active chicory with very high summer yield potential. Chico has an upright growth habit and wide leaves.',
                                    persistence: '2 to 3 years'),
                              ),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardherbs(
                                    title: 'Grasslands Choice',
                                    link: choice(country: widget.country, region: widget.region,),
                                    description:
                                        'An erect winter active cultivar bred for improved cool season growth, disease tolerance and recovery after grazing.',
                                    persistence: '2 to 3 years'),
                              ),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardherbs(
                                    title: 'Grasslands Puna II',
                                    link: puna2(country: widget.country, region: widget.region,),
                                    description:
                                        'A New Zealand bred, broad leafed, winter dormant but summer active cultivar bred for improved perenniality.',
                                    persistence: '2 to 3 years'),
                              ),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardherbs(
                                    title: 'Punter\u2122',
                                    link: punter(country: widget.country, region: widget.region,),
                                    description:
                                        'Perennial forage chicory selection with improved establishment vigour.',
                                    persistence: '2 to 3 years'),
                              ),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardherbs(
                                    title: 'Sika',
                                    link: sika(country: widget.country, region: widget.region,),
                                    description:
                                        'A New Zealand bred cultivar with strong disease tolerance and strong cool season activity.',
                                    persistence: '2 to 3 years'),
                              ),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardherbs(
                                    title: '501',
                                    link: five01(country: widget.country, region: widget.region,),
                                    description:
                                        'Best suited to a 6-8 month summer crop, has an erect growth habit providing high utilisation, and low crown to reduce susceptibility to treading damage and Sclerotinia.',
                                    persistence: '1 year'),
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
        color: Colors.green.shade800, // Add the background color here
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
          child: Container( // This container is now just for the border
            decoration: BoxDecoration(
              border: Border(
                top: BorderSide(width: 6.0, color: Colors.green.shade700),
              ),
            ),
            child: BottomNavigationBar(
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
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => webpage()),
                    );
                    break;
                  case 2:
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
      ),);
  }
}
