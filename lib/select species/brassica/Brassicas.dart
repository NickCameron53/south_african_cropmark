import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../Species_Tool_List.dart';
import '../../abouttheguide.dart';
import '../../main.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'Kale.dart';
import 'Rape.dart';
import 'Swede.dart';
import 'Turnip.dart';

class brassicas extends StatelessWidget {
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

  brassicas({
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
    if (animaltype != "Horses") {
      // add all of the fodder beet if soil acidity not low and not horses.
      images.add('assets/coleorpic.png');
      headings.add('Kale');
      description.add(
        "Also known as Chou Moellier, kales are winter active and mainly used as a winter feed yielding up to 18t DM/ha.",
      );
      links.add(kale(
        country: country,
        region: region,
      ));
      images.add('assets/rapepic.png');
      headings.add('Forage Rape');
      description.add(
        "Forage rape may be sown alone or in mixtures as a specialist summer to winter feed",
      );
      links.add(rape(
        country: country,
        region: region,
      ));
      images.add('assets/swedepic.jpg');
      headings.add('Swede');
      description.add(
        "Swedes are sown from mid November to late December, either ridged in wet cool areas, or conventionally drilled to provide specialist winter feed.",
      );
      links.add(swede(
        country: country,
        region: region,
      ));
      images.add('assets/turnippic.png');
      headings.add('Turnip');
      description.add(
        "Turnip varieties vary in yield potential, ploidy level, maturity, size of bulb, bulb keeping quality, and these factors considerably influence the choice and intended usage.",
      );
      links.add(turnip(
        country: country,
        region: region,
      ));
// else message to exclude horses and acid conditions and inform the user of such.
    } else if (animaltype == "Horses") {
      images.add('assets/rapepic.png');
      headings.add('Brassicas');
      description.add(
        "Brassicas are unsuitable for horses due to concerns with toxicity.",
      );
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
                  'Brassicas',
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
                SizedBox(height: 30),
                if (animaltype != "Horses") ...[
                  Text(
                    'Swipe across to see ${images.length} solutions which match your requirements.',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                ],
                SizedBox(height: 10),
                Container(
                  height: 500,
                  width: MediaQuery.of(context).size.width,
                  //  width: 300,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 240,
                            // this is where you can increase the height of the pic
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
                            height: 250,
                            // increase or decrease the white area
                            width: 300,
                            padding: EdgeInsets.all(10.0),
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(20.0),
                                  bottomRight: Radius.circular(20.0),
                                )),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
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

                                if (animaltype != "Horses") ...[
                                  Container(
                                    padding: EdgeInsets.fromLTRB(
                                        0.0, 10.0, 0.0, 0.0),
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
                                          borderRadius: BorderRadius.circular(
                                              20), // Rounded corners
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: images.length,
                    loop: true,
                    itemWidth: 200,
                    // Specify the width of each item
                    itemHeight: 20,
                    // Specify the height of each item
                    viewportFraction: 0.95,
                    scale: 0.7,
                    pagination: SwiperPagination(
                      builder: DotSwiperPaginationBuilder(
                        color: Colors.grey,
                        activeColor:
                            Colors.green, // Change the color of the active dot
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
