import '../../orders/orderform.dart';
import '../../select%20species/forage%20grass/hybrid%20ryegrass%20safe.dart';
import 'package:flutter/material.dart';
import '../../abouttheguide.dart';
import '../../webpage.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';

class GrassOption {
  final String image;
  final String heading;
  final String description;
  final Widget link;
  final bool showCultivarsButton;

  GrassOption({
    required this.image,
    required this.heading,
    required this.description,
    required this.link,
    required this.showCultivarsButton,
  });
}

class hybridryegrass extends StatelessWidget {
  final List<GrassOption> options = [];

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
    options.clear();
    // Check conditions first
    bool isSummerRainLow = summerrain == "      Low\n(<150mm)";
    bool isSoilAcidic = soilacidity == "   Acid\n<pH5.5";

    // display content according to the user inputs
    if (isSummerRainLow && isSoilAcidic) {
      options.addAll([
        GrassOption(
          // Check for both conditions first
          image: 'assets/italianryegrasspic.png',
          heading: 'Hybrid Ryegrass',
          description:
              "The summer rainfall and soil acidity levels are too low for good ryegrass growth.",
          link: Container(),
          // Add empty container as placeholder
          showCultivarsButton: false,
        ),
      ]); // Hide button for this item
    } else if (isSummerRainLow) {
      options.add(
        GrassOption(
          image: 'assets/italianryegrasspic.png',
          heading: 'Hybrid Ryegrass',
          description:
              "The summer moisture is too low for good ryegrass growth.",
          link: Container(),
          showCultivarsButton: false,
        ),
      ); // Hide button for this item
    } else if (isSoilAcidic) {
      options.add(
        GrassOption(
          image: 'assets/italianryegrasspic.png',
          heading: 'Hybrid Ryegrass',
          description: "The soil acidity is too low for good ryegrass growth.",
          link: Container(),
          showCultivarsButton: false,
        ),
      ); // Hide button for this item
    } else {
      // add all of the hybrid ryegrasses if summer rain and soil acidity not low
      options.add(
        GrassOption(
          image: 'assets/italianryegrasspic.png',
          heading: 'Hybrid Ryegrass',
          description:
              "A cross between Perennial ryegrass and Italian or Annual ryegrass. Hybrids generally have high annual yields and will persist for 2-3+ years depending on their percentage of perennial ryegrass parentage, climatic conditions, insect pressure and paddock management.",
          link: hybridryegrasssafe(country: country, region: region),
          showCultivarsButton: true,
        ),
      ); // Show button for this item
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
                    ),
                  ),
                );
              },
            ),
          ],
        ),
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
                    'Swipe across to see ${options.length} solutions which match your requirements.',
                    style: TextStyle(color: Colors.white, fontSize: 15.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(height: 10),
                Container(
                  height: 460,
                  width: MediaQuery.of(context).size.width,
                  child: Swiper(
                    itemBuilder: (BuildContext context, int index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            height: 70,
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
                                options[index].image,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          Container(
                            height: 380,
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
                                Text(options[index].heading,
                                    style: TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green[700])),
                                Divider(
                                  color: Colors.green,
                                  thickness: 1,
                                  height: 20,
                                  indent: 20,
                                  endIndent: 20,
                                ),
                                SingleChildScrollView(
                                  child: Container(
                                    child: Text(
                                      options[index].description,
                                      style: TextStyle(fontSize: 14),
                                    ),
                                  ),
                                ),
                                Container(
                                  padding:
                                      EdgeInsets.fromLTRB(0.0, 30.0, 0.0, 0.0),
                                  child: options[index].showCultivarsButton
                                      ? ElevatedButton(
                                          onPressed: () {
                                            Navigator.push(
                                              context,
                                              MaterialPageRoute(
                                                builder: (context) =>
                                                    options[index].link,
                                              ),
                                            );
                                          },
                                          child: Text('View cultivars'),
                                          style: ElevatedButton.styleFrom(
                                            backgroundColor: Colors.lightGreen,
                                            minimumSize: Size(100, 50),
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                        )
                                      : SizedBox.shrink(),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                    itemCount: options.length,
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
