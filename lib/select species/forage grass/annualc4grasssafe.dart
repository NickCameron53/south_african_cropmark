import '../../abouttheguide.dart';
import '../../grasses/annual%20ryegrasses/haymaker.dart';
//import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import '../../orders/orderform.dart';


import '../../webpage.dart';
import 'cultivar_card_grasses.dart';

class annualC4grasssafe extends StatefulWidget {
  annualC4grasssafe({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<annualC4grasssafe> createState() {
    return _annualC4grasssafeState();
  }
}

class _annualC4grasssafeState extends State<annualC4grasssafe> {
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
                    'C4 Annual grass',
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
                          builder: (context) =>
                              MyHomePage(
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
                    width: MediaQuery
                        .of(context)
                        .size
                        .width, // Takes full width of the screen
                    height: 100,
                    child: Image.asset(
                      'assets/annualryegrasspic.png',
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
                              Text('C4 Annual grass',
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
                                    "Teff grass is used as a specialist silage or hay crop in regions where there is no risk of frosts."
                                        "\nNot suitable for grazing.",
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
                                  Text('   Recommended cultivar',
                                      style: TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green[700])),
                                ],
                              ),

                              SizedBox(height: 40),
                              Container(
                                child: cultivarcard(
                                    title: 'Haymaker',
                                    link: haymaker(country: widget.country, region: widget.region,),
                                    description:
                                    ' Haymaker is a warm season C4 annual grass which makes great quality hay and silage.',
                                    date: 'N/A',
                                    endophyte: 'Nil',
                                    ploidy: 'tetraploid'),
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