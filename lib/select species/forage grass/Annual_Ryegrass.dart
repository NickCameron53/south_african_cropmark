import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../Species_Tool_List.dart';
import '../../abouttheguide.dart';
import '../../main.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'annualryegrasssafe.dart';

class annualryegrass extends StatelessWidget {
  final List<String> images = [];
  final List<String> headings = [];
  final List<String> description = [];
  final List links = [];
  final List<bool> showCultivarsButton = [];

  final String country,
      region,
      representative,
      headshot,
      phonenum,
      animaltype,
      summerrain,
      foragetype,
      soilacidity;

  annualryegrass({
    Key? key,
    required this.country,
    required this.region,
    required this.representative,
    required this.headshot,
    required this.phonenum,
    required this.animaltype,
    required this.summerrain,
    required this.foragetype,
    required this.soilacidity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // display content according to the user inputs
    if (soilacidity != "   Acid\n<pH5.5") {
      // add all of the annual ryegrasses if soil acidity not low.
      images.add('assets/annualryegrasspic.png');
      headings.add('Annual ryegrass');
      description.add(
        "Annual (Westerwolds) ryegrasses are used as a temporary cool season feed between crops and will produce seed from a spring sowing. Sown in late summer or autumn, it persists for only 6-8 months, producing high volumes of quality feed.",
      );
      links.add(annualryegrasssafe(country: country, region: region,)); showCultivarsButton.add(true);
    }
    if (soilacidity == "   Acid\n<pH5.5" ) {
      images.add('assets/annualryegrasspic.png');
      headings.add('Annual Ryegrass');
      description.add(
        "The soil acidity is too low for good ryegrass growth.",
      );
      links.add(Container()); // Add empty container as placeholder
      showCultivarsButton.add(false);
    }

    return Scaffold(
        extendBody: true,
        backgroundColor: Colors.white,
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: AppBar(
              title: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Annual Ryegrass',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    region,
                    style: TextStyle(color: Colors.white, fontSize: 16.0),
                    textAlign: TextAlign.right,
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
          shrinkWrap: true,
          children: <Widget>[
            Container(
              height: 900,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [
                    Colors.black,
                    Colors.green,
                    Colors.black,
                  ],
                ),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    'We have found ${images.length} solution which matches your requirements.',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 460,
                    width: MediaQuery.of(context).size.width,
                    //  width: 300,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 100, // change picture height here
                              width: 300,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                              )),
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20.0),
                                  topRight: Radius.circular(20.0),
                                ),
                                child: Image.asset(
                                  images[index],
                                  fit: BoxFit
                                      .cover, // Use BoxFit.cover to cover the entire area
                                ),
                              ),
                            ),
                            Container(
                                height: 320,
                                // decrease white box height
                                width: 300,
                                padding: EdgeInsets.all(10.0),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(20.0),
                                      bottomRight: Radius.circular(20.0),
                                    )),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: <Widget>[
                                      //   SizedBox(height: 10),
                                      Text(headings[index],
                                          style: TextStyle(
                                              fontSize: 20,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.green[700])),
                                      //     SizedBox(height: 10),
                                      Divider(
                                        color: Colors.green,
                                        thickness: 1,
                                        height: 20,
                                        indent: 20,
                                        endIndent: 20,
                                      ),

                                      //   SizedBox(height: 10),
                                      SingleChildScrollView(
                                        child: Container(
                                          child: Text(
                                            description[index],
                                            style: TextStyle(fontSize: 14),
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                                        // Conditionally show the button based on our flag
                                        child: showCultivarsButton[index]
                                            ? ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) => links[index],
                                              ),
                                            );
                                          },
                                          child: Text('View cultivars'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightGreen,
                                            minimumSize: Size(100, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius: BorderRadius.circular(20),
                                            ),
                                          ),
                                        )
                                            : SizedBox.shrink(), // Hide button if not needed
                                      ),
                                    ],
                                ),
                            ),
                          ],
                        );
                      },
                      itemCount: images.length,
                      loop: true,
                      itemWidth: 200,
                      itemHeight: 60,
                      viewportFraction: 0.9,
                      scale: 0.5,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors.green,
                        ),
                      ),
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
                    MaterialPageRoute(builder: (context) => abouttheguide()),
                  );
                  break;
                case 1:
                // Navigate to Webpage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => webpage()),
                  );
                  break;
                case 2:
                // Navigate to Toolkit page
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
    );
  }
}
