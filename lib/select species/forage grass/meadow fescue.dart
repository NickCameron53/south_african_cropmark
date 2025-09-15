import '../../AboutTheGuide.dart';
import '../../grasses/perennial%20grasses/meadow%20fescue/barrieru2.dart';
import '../../orders/orderform.dart';
import '../../WebPage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import 'cultivar_card_grasses.dart';

class meadowfescue extends StatefulWidget {
  meadowfescue({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<meadowfescue> createState() {
    return _meadowfescueState();
  }
}

class _meadowfescueState extends State<meadowfescue> {
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
                  'Festulolium',
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
                    'assets/barrierpic.png',
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
                            Text('Festulolium',
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
                                  'Highly palatable to livestock and will not cause grass staggers or heat stress. Being more palatable they also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650 mm p.a.) to perform well.',
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
                                  title: 'Barrier',
                                  link: barrieru2(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A persistent perennial inter-species cross with broad insect resistance above and below ground. ',
                                  date: 'Medium +10',
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
