import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../main.dart';
import 'Kale.dart';
import 'Rape.dart';
import 'Swede.dart';
import 'Turnip.dart';
import '../../global_widgets.dart';

class BrassicaOption {
  final String image;
  final String heading;
  final String description;
  final Widget link;
  final bool showCultivarsButton;

  BrassicaOption({
    required this.image,
    required this.heading,
    required this.description,
    required this.link,
    required this.showCultivarsButton,
  });
}

class brassicas extends StatelessWidget {
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

  brassicas({
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

  List<BrassicaOption> _buildOptions() {
    final List<BrassicaOption> options = [];

    // Check conditions first - use more flexible matching
    bool isSummerRainLow = summerrain.trim().startsWith("Low");
    totalrain.trim().startsWith("Low");
    soilacidity.trim().startsWith("Acid");
    bool isAnimalTypeHorses = animaltype == "Horses";

    // FIRST: Check if climate conditions are unsuitable

    if (isSummerRainLow ) {
      options.add(BrassicaOption(
        image: 'assets/coleorpic.png',
        heading: 'Brassicas',
        description: "Summer rainfall is too low for good Brassica growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    }
    else if (isSummerRainLow) {
      options.add(BrassicaOption(
        image: 'assets/coleorpic.png',
        heading: 'Brassicas',
        description: "The summer rainfall is too low for good Brassica growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    }


    // Climate conditions are suitable - add brassica options
    else {
      if (isAnimalTypeHorses) {
        // Show warning message for horses
        options.add(BrassicaOption(
          image: 'assets/coleorpic.png',
          heading: 'Brassicas',
          description: "Brassicas are unsuitable for horses due to concerns with toxicity.",
          link: Container(),
          showCultivarsButton: false,
        ));
      } else {
        // Show brassica options for all other animals
        options.add(BrassicaOption(
          image: 'assets/coleorpic.png',
          heading: 'Kale',
          description: 'Also known as Chou Moellier, kales are winter active and mainly used as a winter feed yielding up to 18t DM/ha.',
          link: kale(country: country, region: region),
          showCultivarsButton: true,
        ));

        options.add(BrassicaOption(
          image: 'assets/rapepic.png',
          heading: 'Forage Rape',
          description: 'Forage rape may be sown alone or in mixtures as a specialist summer to winter feed.',
          link: rape(country: country, region: region),
          showCultivarsButton: true,
        ));

        options.add(BrassicaOption(
          image: 'assets/swedepic.jpg',
          heading: 'Swede',
          description: 'Swedes are sown from mid November to late December, either ridged in wet cool areas, or conventionally drilled to provide specialist winter feed.',
          link: swede(country: country, region: region),
          showCultivarsButton: true,
        ));

        options.add(BrassicaOption(
          image: 'assets/turnippic.png',
          heading: 'Turnip',
          description: 'Turnip varieties vary in yield potential, ploidy level, maturity, size of bulb, bulb keeping quality, and these factors considerably influence the choice and intended usage.',
          link: turnip(country: country, region: region),
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
