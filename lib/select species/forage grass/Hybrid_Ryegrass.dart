import '../../orders/orderform.dart';
import '../../select%20species/forage%20grass/hybrid%20ryegrass%20safe.dart';
import '../../select%20species/forage%20grass/hybrid%20ryegrass%20toxic.dart';
import 'package:flutter/material.dart';
import '../../abouttheguide.dart';
import '../../webpage.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';

class hybridryegrass extends StatelessWidget {
  final List<String> images = [];
  final List<String> headings = [];
  final List<String> description = [];
  final List links = [];

  final String country,
      region,
      representative,
      headshot,
      phonenum,
      animaltype,
      summerrain,
      foragetype,
      soilacidity;

  hybridryegrass({
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
    if (summerrain != "      Low\n(<150mm)" &&
        soilacidity != "   Acid\n<pH5.5") {
      if (animaltype != "Horses" &&
          animaltype != "Deer" &&
          animaltype != "Alpacas") {
        // add all of the hybrid ryegrasses if summer rain and soil acidity not low and NOT in South Island
        images.add('assets/italianryegrasspic.png');
        headings.add('Hybrid ryegrass');
        description.add(
          "A cross between Perennial ryegrass and Italian or Annual ryegrass. Hybrids generally have high annual yields and will persist for 2-3+ years depending on their percentage of perennial ryegrass parentage, climatic conditions, insect pressure and paddock management.",
        );
        links.add(hybridryegrasstoxic(country: country, region: region,));
      } else if (animaltype == "Horses" ||
          animaltype == "Alpacas" ||
          animaltype == "Deer") {
        // remove the AR37 cultivars ...
        images.add('assets/italianryegrasspic.png');
        headings.add('Hybrid ryegrass (Safe)');
        description.add(
          "A cross between Perennial ryegrass and Italian or Annual ryegrass. Hybrids generally have high annual yields and will persist for 2-3+ years depending on their percentage of perennial ryegrass parentage, climatic conditions, insect pressure and paddock management.",
        );
        links.add(hybridryegrasssafe(country: country, region: region,));
      }
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
                    'Hybrid Ryegrass',
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
                  SizedBox(height: 60),
                  Text(
                    'We have found ${images.length} solution which matches your requirements.',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 10),
                  Container(
                    height: 550,
                    width: MediaQuery.of(context).size.width,
                    //  width: 300,
                    child: Swiper(
                      itemBuilder: (BuildContext context, int index) {
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              height: 80,
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
                                height: 340,
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
                                          child: Text(description[index],
                                              style: TextStyle(fontSize: 14)),
                                        ),
                                      ),

                                      //    SizedBox(height: 10),
                                      Container(
                                        padding: EdgeInsets.fromLTRB(
                                            0.0, 30.0, 0.0, 0.0),
                                        child: ElevatedButton(
                                          onPressed: () {
                                            // Add your button onPressed logic here
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      links[index]),
                                            );
                                          },
                                          child: Text('View cultivars'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightGreen,
                                            minimumSize: Size(100, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Rounded corners
                                            ),
                                          ),
                                        ),
                                      ),
                                    ]))
                          ],
                        );
                      },
                      itemCount: images.length,
                      loop: true,
                      itemWidth: 200,
                      // Specify the width of each item
                      itemHeight: 60,
                      // Specify the height of each item
                      viewportFraction: 0.9,
                      scale: 0.5,
                      pagination: SwiperPagination(
                        builder: DotSwiperPaginationBuilder(
                          color: Colors.grey,
                          activeColor: Colors
                              .green, // Change the color of the active dot
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
      ),
    );
  }
}
