import '../../abouttheguide.dart';
import '../../orders/orderform.dart';
import '../../select%20species/Legume/Lucerne.dart';
import '../../select%20species/Legume/Other%20legumes.dart';
import '../../select%20species/Legume/Red%20Clover.dart';
import '../../select%20species/Legume/White%20Clover.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import 'package:url_launcher/url_launcher.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import 'Sub Clover.dart';

class Legumes extends StatelessWidget {
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

  _makingPhoneCall() async {
    var url = Uri.parse(phonenum);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $phonenum';
    }
  }

  Legumes({
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

    images.add('assets/whitecloverpic.png');
    headings.add('White clover');
    description.add(
        'A perennial legume used in pasture mixes to fix nitrogen and to provide high quality forage. Best used on moderate to highly fertile soils.');
    links.add(whiteclover(country: country, region: region,));
    images.add('assets/redcloverpic.png');
    headings.add('Red clover');
    description.add(
        'A perennial legume used in pasture mixes to fix nitrogen and to provide high quality forage. Best used on moderate to highly fertile soils.');
    links.add(redclover(country: country, region: region,));
    images.add('assets/whitecloverpic.png');
    headings.add('Sub clover');
    description.add(
        'Sub clover is an annual clover mostly suited to acid soils for use in areas of low rainfall with dry summers.');
    links.add(subclover(country: country, region: region,));
    images.add('assets/galaxiemaxpic.png');
    headings.add('Lucerne');
    description.add(
        'Lucerne is an erect growing, tap rooted perennial, generally grown in pure stands for sheep, cattle, horse, and deer grazing or hay production.');
    links.add(lucerne(country: country, region: region,));

    images.add('assets/whitecloverpic.png');
    headings.add('Other Legumes');
    description.add(
        'Perennial types include Caucasian Clover, Lotus species and Strawberry Clover which may last greater than 5 years. Annual clovers are often used in place of red or white clovers due to their superior early season growth, or their ability to survive dry periods.');
    links.add(otherlegumes(country: country, region: region,));

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
                    'Legumes',
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
                  Padding(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10.0, 0.0),
                    child: Text(
                      'Swipe across to see ${images.length} solutions which match your requirements.',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
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
                              height: 70, // increase pic size
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
                                height: 330,
                                // decrease white box size
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
                                            0.0, 30.0, 0.0, 18.0),
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
      ),);
  }
}
