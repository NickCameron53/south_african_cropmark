import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../Species_Tool_List.dart';
import '../../AboutTheGuide.dart';
import '../../main.dart';
import '../../orders/orderform.dart';
import '../../WebPage.dart';
import 'fodderbeetall.dart';

class FodderBeetOption {
  final String image;
  final String heading;
  final String description;
  final Widget link;
  final bool showCultivarsButton;

  FodderBeetOption({
    required this.image,
    required this.heading,
    required this.description,
    required this.link,
    required this.showCultivarsButton,
  });
}

class fodderbeet extends StatelessWidget {
  final List<String> images = [];
  final List<String> headings = [];
  final List<String> description = [];
  final List links = [];
  final String country;
  final String region;
  final String representative;
  final String headshot;
  final String phonenum;
  final String animaltype;
  final String summerrain;
  final String totalrain;
  final String foragetype;
  final String soilacidity;

  fodderbeet({
    Key? key,
    required this.country,
    required this.region,
    required this.representative,
    required this.headshot,
    required this.phonenum,
    required this.animaltype,
    required this.summerrain,
    required this.totalrain,
    required this.foragetype,
    required this.soilacidity,
  }) : super(key: key);

  List<FodderBeetOption> _buildOptions() {
    final List<FodderBeetOption> options = [];

    // Check conditions first - use more flexible matching
    bool isSummerRainLow = summerrain.trim().startsWith("Low");
    bool isTotalRainLow = totalrain.trim().startsWith("Low");
    bool isSoilAcidic = soilacidity.trim().startsWith("Acid");
    bool isAnimalTypeHorses = animaltype == "Horses";

    // FIRST: Check if climate conditions are unsuitable

    if (isTotalRainLow && isSummerRainLow && isSoilAcidic) {
      options.add(FodderBeetOption(
        image: 'assets/oe968pic.png',
        heading: 'Fodder Beet',
        description:
        "The annual and summer rainfall and soil acidity (which should exceed pH 5.6) are too low for good Fodder Beet growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isTotalRainLow && isSummerRainLow) {
      options.add(FodderBeetOption(
        image: 'assets/oe968pic.png',
        heading: 'Fodder Beet',
        description:
        "The annual and summer rainfall is too low for good Fodder Beet growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isSummerRainLow && isSoilAcidic) {
      options.add(FodderBeetOption(
        image: 'assets/oe968pic.png',
        heading: 'Fodder Beet',
        description:
        "The summer rainfall and soil acidity (which should exceed pH 5.6) are too low for good Fodder Beet growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isTotalRainLow && isSoilAcidic) {
      options.add(FodderBeetOption(
        image: 'assets/oe968pic.png',
        heading: 'Fodder Beet',
        description:
        "The annual rainfall and soil acidity (which should exceed pH 5.6) are too low for good Fodder Beet growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isSummerRainLow) {
      options.add(FodderBeetOption(
        image: 'assets/oe968pic.png',
        heading: 'Fodder Beet',
        description:
        "The summer rainfall is too low for good Fodder Beet growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isSoilAcidic) {
      options.add(FodderBeetOption(
        image: 'assets/oe968pic.png',
        heading: 'Fodder Beet',
        description:
        "The soil acidity is too low and should exceed pH 5.6 for good Fodder Beet growth .",
        link: Container(),
        showCultivarsButton: false,
      ));
    }

    // Climate conditions are suitable - add fodder beet options
    else {
      if (isAnimalTypeHorses) {
        // Show warning message for horses
        options.add(FodderBeetOption(
          image: 'assets/oe968pic.png',
          heading: 'Fodder Beet',
          description:
          "While lower than sugar beet, fodder beet still contains sugar and is generally not recommended. Be cautious with horses prone to laminitis, insulin resistance, or PSSM",
          link: Container(),
          showCultivarsButton: false,
        ));
      } else {
        // Show fodder beet options for all other animals
        options.add(FodderBeetOption(
          image: 'assets/oe968pic.png',
          heading: 'Fodder Beet',
          description:
          'Fodder Beet (Beta vulgaris) is a cross between mangels and sugar beet, aiming to combine the ease of harvest of mangels (syn. mangold) with the high DM and high sugar levels of sugar beet.',
          link: fodderbeetall(
            country: country,
            region: region,
            animaltype: '',
          ),
          showCultivarsButton: true,
        ));
      }
    }

    return options;
  }

  @override
  Widget build(BuildContext context) {
    final options = _buildOptions();

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
                  'Fodder Beet',
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
                                  padding: EdgeInsets.fromLTRB(
                                      0.0, 30.0, 0.0, 0.0),
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
                                      backgroundColor:
                                      Colors.lightGreen,
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
