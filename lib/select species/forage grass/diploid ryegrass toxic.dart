import '../../abouttheguide.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/maxsynnea4.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/midwayar37.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/stampedecm142.dart';
import '../../grasses/perennial%20grasses/diploid%20ryegrass/sequelstandard.dart';
import '../../orders/orderform.dart';
import '../../select%20species/forage%20grass/grass_maturity_card.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import '../../grasses/perennial grasses/diploid ryegrass/arraynea2.dart';
import 'cultivar_card_grasses.dart';

class diploidryegrasstoxic extends StatefulWidget {
  diploidryegrasstoxic({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<diploidryegrasstoxic> createState() {
    return _diploidryegrasstoxicState();
  }
}

class _diploidryegrasstoxicState extends State<diploidryegrasstoxic> {
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
                                    title: 'Stampede',
                                    link: stampedecm142(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    //placeholder for future darts
                                    description:
                                        'Attractive dark green cultivar which produces strongly year round particularly through the spring & autumn.',
                                    date: 'Medium +11',
                                    endophyte: 'CM142',
                                    ploidy: 'diploid'),
                              ),
                              // Sequel Enhanced
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcard(
                                    title: 'Sequel',
                                    link: sequelstandard(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    //placeholder for future darts
                                    description:
                                        'Late perennial ryegrass with robust disease resistance.',
                                    date: 'Late +20',
                                    endophyte: 'Standard',
                                    ploidy: 'diploid'),
                              ),

                              // Matrix
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcard(
                                    title: 'Array',
                                    link: arraynea2(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    //placeholder for future darts
                                    description:
                                        'Array has very high winter growth and is strongly persistent.',
                                    date: 'Late +23',
                                    endophyte: 'NEA2',
                                    ploidy: 'diploid'),
                              ),
                              // Expo
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcard(
                                    title: 'Maxsyn',
                                    link: maxsynnea4(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    //placeholder for future darts
                                    description:
                                        'Maxsyn NEA4 is a densely tillered perennial ryegrass for all farm systems with strong summer and autumn growth.',
                                    date: 'Medium +8',
                                    endophyte: 'NEA4',
                                    ploidy: 'diploid'),
                              ),
                              // Excess
                              SizedBox(height: 40),

                              Container(
                                child: cultivarcard(
                                    title: 'Midway',
                                    link: midwayar37(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    description:
                                    'Selected for low aftermath heading.',
                                    date: 'Early +3',
                                    endophyte: 'AR37',
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
