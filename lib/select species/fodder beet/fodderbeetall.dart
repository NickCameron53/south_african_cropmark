import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../abouttheguide.dart';
import '../../fodderbeet/dynamo.dart';
import '../../fodderbeet/geronimo.dart';
import '../../fodderbeet/kokomo.dart';
import '../../main.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'cultivar_card_beet.dart';

class fodderbeetall extends StatefulWidget {
  fodderbeetall({
    Key? key,
    required this.country,
    required this.region,
    required this.animaltype,
  }) : super(key: key);
  final String country, region, animaltype;

  @override
  State<fodderbeetall> createState() {
    return _fodderbeetallState();
  }
}

class _fodderbeetallState extends State<fodderbeetall> {
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
                    'Fodder Beet',
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
                      'assets/geronimopic.png',
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
                              Text('Fodder Beet',
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
                                    "Fodder Beet (Beta vulgaris) is a cross between mangels and sugar beet, aiming to combine the ease of harvest of mangels (syn. mangold) with the high DM and high sugar levels of sugar beet."
                                    "\n\nThe basic distinction between mangels and fodder beet is one of dry matter content; in general cultivars with less than 13 percent dry matter are called mangels and those over this value fodder beet."
                                    "\n\nIt is a long growing-season crop which requires a high level of care in establishment."
                                    "\n\nCompared to brassicas, Fodder Beet is not as susceptible to clubroot and dry rot and has a lower nitrogen requirement, and once established is highly palatable to animals."
                                    "\n\nFodder Beet requires a weed free, firm fine seedbed that is well drained with no sub-soil compaction and a soil pH greater than 6.0. Sowing is best in late September to mid November (soil temp 5 degrees Celsius, after the last frosts)."
                                    "\n\nSowing rate is recommended at 80,000 plants per hectare through a precision drill to a depth of 2-3cm preferably with a 0.5m row spacing. If seed is sown using a conventional drill, then a higher seeding rate (120,000 seeds per hectare) is needed to reduce gaps within the crop."
                                    "\n\nSeed coat quality and germination percentage need to be high to obtain a good sowing result."
                                    "\n\nFodder Beet is a demanding crop but if done properly can be extremely profitable. The seed supplied may be monogerm or multigerm. Multigerm seed is several seeds produced in a cluster which is usually mechanically separated usually using a rubbing apparatus. This process may not guarantee all seeds will be singular, and rubbing can lead to slightly lower germination. Plant breeding efforts have resulted in selection for genetically produced monogerm seeds but these will be more expensive to buy."
                                    "\n\nWeed control is very important and pre-fallowing with cultivation and /or glyphosate is recommended. Post-emergent herbicides such as Pyramin (chloridazon), Nortron (ethofumesate), Betanal (phenmedipham + desmedipham), and Goltix (metamitron) are also recommended. Avoid sowing into paddocks which may have had a recent history of the following residual chemicals: Aminopyralid; Picloram; Oxyfluren; Chlorsulfuron; or Atrazine.",
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
                              Text('   Low Dry Matter cultivars:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700])),
                              Text(
                                  'Low dry matter cultivars can be fed to sheep or cattle younger than 12 months.',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardbeet(
                                    title: 'Dynamo',
                                    link: dynamo(country: widget.country, region: widget.region,),
                                    description:
                                        'Dynamo has a soft fleshed bulb sitting well above the ground making it suitable for grazing in situ with sheep, cattle or deer and especially younger stock.',
                                    drymatter: '12-15%',
                                    seed: 'monogerm',
                                    grazing: 'grazing'),
                              ),

                              SizedBox(height: 40),
                              Divider(
                                color: Colors.green,
                                thickness: 1,
                                height: 20,
                                indent: 5,
                                endIndent: 5,
                              ),
                              SizedBox(height: 30),
                              Text('Medium Dry Matter cultivars:',
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.green[700])),
                              Text(
                                  'Medium dry matter cultivars are not suitable for sheep or cattle younger than 12 months.',
                                  style: TextStyle(
                                      fontSize: 14, color: Colors.black)),
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcardbeet(
                                    title: 'Geronimo',
                                    link: geronimo(country: widget.country, region: widget.region,),
                                    description:
                                        ' A new high yielding monogerm cultivar with an orange bulb that sits approx 45% above the ground. Strong foliar growth, with improved bolting resistance, good resistance to mildew, ramularia and rhizomania.',
                                    drymatter: '15-17%',
                                    seed: 'monogerm',
                                    grazing: 'grazing, lifting'),
                              ),
                              SizedBox(height: 30),

                              Container(
                                child: cultivarcardbeet(
                                    title: 'Kokomo',
                                    link: kokomo(country: widget.country, region: widget.region,),
                                    description:
                                        'Has a large red tankard bulb cultivar that sits +/- 50% above the ground.',
                                    drymatter: '14-16%',
                                    seed: 'monogerm',
                                    grazing: 'grazing'),
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
