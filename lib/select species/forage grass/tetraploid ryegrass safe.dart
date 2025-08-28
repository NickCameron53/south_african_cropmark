import '../../abouttheguide.dart';
import '../../grasses/perennial%20grasses/tetraploid%20ryegrass/abergainnil.dart';
import '../../grasses/perennial%20grasses/tetraploid%20ryegrass/basear1.dart';
import '../../grasses/perennial%20grasses/tetraploid%20ryegrass/haloar1.dart';
import '../../grasses/perennial%20grasses/tetraploid%20ryegrass/viscountnil.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';


import 'cultivar_card_grasses.dart';
import 'grass_maturity_card.dart';

class tetraploidryegrasssafe extends StatefulWidget {
  tetraploidryegrasssafe({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<tetraploidryegrasssafe> createState() {
    return _tetraploidryegrasssafeState();
  }
}

class _tetraploidryegrasssafeState extends State<tetraploidryegrasssafe> {
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
                    'Tetraploid perennial ryegrass',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    'Animal safe',
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
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
                                  Text('Tetraploid perennial ryegrass',
                                      style: TextStyle(
                                          fontSize: 19,
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
                                    'Tetraploids have larger seeds than diploids and require a higher sowing rate of 25 to 35 kg/ha alone or 15 to 20 kg/ha in a mixture. They also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650 mm p.a.) to perform well.',
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
                                    title: 'Grasslands Halo',
                                    link: haloar1(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    description:
                                        'High quality summer feed offering good winter & summer growth.',
                                    date: 'Late +25',
                                    endophyte: 'AR1',
                                    ploidy: 'tetraploid'),
                              ),
                              // Array
                              SizedBox(height: 40),

                              Container(
                                child: cultivarcard(
                                    title: 'Abergain',
                                    link: abergainnil(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    description:
                                        'High quality summer feed offering good winter & summer growth.',
                                    date: 'Late +24',
                                    endophyte: 'Nil',
                                    ploidy: 'tetraploid'),
                              ),
                              // Array
                              SizedBox(height: 40),
                              Container(
                                child: cultivarcard(
                                    title: 'Base',
                                    link: basear1(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    description:
                                        'A densely tillered cultivar with strong cool season growth & late spring quality.',
                                    date: 'Late +22',
                                    endophyte: 'AR1',
                                    ploidy: 'tetraploid'),
                              ),

                              SizedBox(height: 40),
                              Container(
                                child: cultivarcard(
                                    title: 'Viscount',
                                    link: viscountnil(
                                      country: widget.country,
                                      region: widget.region,
                                    ),
                                    description:
                                        'An upright variety offering good early spring growth.',
                                    date: 'Late +19',
                                    endophyte: 'Nil',
                                    ploidy: 'tetraploid'),
                              ),
                              // One50
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
