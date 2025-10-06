import '../../global_widgets.dart';
import '../../select%20species/Legume/Lucerne.dart';
import '../../select%20species/Legume/Other%20legumes.dart';
import '../../select%20species/Legume/Red%20Clover.dart';
import '../../select%20species/Legume/White%20Clover.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../main.dart';
import 'Sub Clover.dart';
class LegumeOption {
  final String image;
  final String heading;
  final String description;
  final Widget link;
  final bool showCultivarsButton;

  LegumeOption({
    required this.image,
    required this.heading,
    required this.description,
    required this.link,
    required this.showCultivarsButton,
  });
}

class Legumes extends StatelessWidget {
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

  Legumes({
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

  List<LegumeOption> _buildOptions() {
    final List<LegumeOption> options = [];

    // Check conditions first - use more flexible matching
    bool isSummerRainLow = summerrain.trim().startsWith("Low");
    bool isTotalRainLow = totalrain.trim().startsWith("Low");
    bool isSoilAcidic = soilacidity.trim().startsWith("Acid");


    // FIRST: Check if total annual rainfall is too low (blocks ALL legumes)
    if (isTotalRainLow) {
      options.add(LegumeOption(
        image: 'assets/whitecloverpic.png',
        heading: 'Legumes',
        description: "The annual rainfall is too low for reliable growth of any legumes.",
        link: Container(),
        showCultivarsButton: false,
      ));
      return options; // Return early - no legumes can grow
    }

    // Check specific conditions for different legume types
    bool canGrowRedWhiteClover = !isSummerRainLow && !isSoilAcidic;
    bool canGrowLucerne = !isSoilAcidic; // Lucerne doesn't mind low summer rain
    bool canGrowSubClover = true; // Sub clover tolerates low summer rain AND acidic soil
    bool canGrowOtherLegumes = !isSoilAcidic; // Other legumes generally don't like acidic soil

    // Add appropriate legumes based on conditions
    if (canGrowRedWhiteClover) {
      options.add(LegumeOption(
        image: 'assets/whitecloverpic.png',
        heading: 'White Clover',
        description: 'A perennial legume used in pasture mixes to fix nitrogen and to provide high quality forage. Best used on moderate to highly fertile soils.',
        link: whiteclover(country: country, region: region),
        showCultivarsButton: true,
      ));

      options.add(LegumeOption(
        image: 'assets/redcloverpic.png',
        heading: 'Red Clover',
        description: 'A perennial legume used in pasture mixes to fix nitrogen and to provide high quality forage. Best used on moderate to highly fertile soils.',
        link: redclover(country: country, region: region),
        showCultivarsButton: true,
      ));
    } else {
      // Explain why red/white clover won't grow
      if (isSummerRainLow && isSoilAcidic) {
        options.add(LegumeOption(
          image: 'assets/whitecloverpic.png',
          heading: 'Red & White Clover',
          description: "Summer rainfall and soil acidity are too low for reliable growth of Red and White Clover.",
          link: Container(),
          showCultivarsButton: false,
        ));
      } else if (isSummerRainLow) {
        options.add(LegumeOption(
          image: 'assets/whitecloverpic.png',
          heading: 'Red & White Clover',
          description: "Summer rainfall is too low for reliable growth of Red and White Clover.",
          link: Container(),
          showCultivarsButton: false,
        ));
      } else if (isSoilAcidic) {
        options.add(LegumeOption(
          image: 'assets/whitecloverpic.png',
          heading: 'Red & White Clover',
          description: "Soil acidity is too low for reliable growth of Red and White Clover.",
          link: Container(),
          showCultivarsButton: false,
        ));
      }
    }

    // Add Sub Clover (tolerates low summer rain AND acidic soil)
    if (canGrowSubClover) {
      options.add(LegumeOption(
        image: 'assets/whitecloverpic.png',
        heading: 'Sub Clover',
        description: 'Sub clover is an annual clover mostly suited to acid soils for use in areas of low rainfall with dry summers.',
        link: subclover(country: country, region: region),
        showCultivarsButton: true,
      ));
    }

    // Add Lucerne (tolerates low summer rain but not acidic soil)
    if (canGrowLucerne) {
      options.add(LegumeOption(
        image: 'assets/galaxiemaxpic.png',
        heading: 'Lucerne',
        description: 'Lucerne is an erect growing, tap rooted perennial, generally grown in pure stands for sheep, cattle, horse, and deer grazing or hay production.',
        link: lucerne(country: country, region: region),
        showCultivarsButton: true,
      ));
    } else if (isSoilAcidic) {
      options.add(LegumeOption(
        image: 'assets/galaxiemaxpic.png',
        heading: 'Lucerne',
        description: "Soil acidity is too low for reliable growth of Lucerne.",
        link: Container(),
        showCultivarsButton: false,
      ));
    }

    // Add Other Legumes (don't like acidic soil)
    if (canGrowOtherLegumes) {
      options.add(LegumeOption(
        image: 'assets/whitecloverpic.png',
        heading: 'Other Legumes',
        description: 'Perennial types include Caucasian Clover, Lotus species and Strawberry Clover which may last greater than 5 years. Annual clovers are often used in place of red or white clovers due to their superior early season growth, or their ability to survive dry periods.',
        link: otherlegumes(country: country, region: region),
        showCultivarsButton: true,
      ));
    } else if (isSoilAcidic) {
      options.add(LegumeOption(
        image: 'assets/whitecloverpic.png',
        heading: 'Other Legumes',
        description: "Soil acidity is too low for reliable growth of other legumes like Caucasian Clover and Lotus species.",
        link: Container(),
        showCultivarsButton: false,
      ));
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
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),

    );
  }
}
