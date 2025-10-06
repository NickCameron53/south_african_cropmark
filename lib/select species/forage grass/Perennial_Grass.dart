import 'package:southafrica_seed_guide/select%20species/forage%20grass/meadow%20fescue.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../main.dart';
import 'cocksfoot.dart';
import 'diploid ryegrass.dart';
import 'tetraploid ryegrass.dart';
import '/../global_widgets.dart';

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

class PerennialGrass extends StatelessWidget {
  final List<GrassOption> options = [];
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

  PerennialGrass({
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

  List<GrassOption> _buildOptions() {
    final List<GrassOption> options = [];
    // Check conditions first
    bool isSummerRainLow = summerrain.trim() == "Low\n(<150mm)".trim();
    bool isTotalRainLow = totalrain.trim() == "Low\n(<500mm)".trim();
    bool isSoilAcidic = soilacidity.trim() == "Acid\n<pH5.5".trim();
    bool isAnimalTypeHorses = animaltype == "Horses";
    bool isAnimalTypeDeer = animaltype == "Deer";
    bool isAnimalTypeAlpacas = animaltype == "Alpacas";
    bool isSensitiveAnimal =
        isAnimalTypeHorses || isAnimalTypeDeer || isAnimalTypeAlpacas;
    bool isTotalRainTooLowForPerennials = isTotalRainLow;
    bool isUnsuitableForSensitiveAnimals = isSummerRainLow || isSoilAcidic;
    // display content according to the user inputs
    if (isTotalRainTooLowForPerennials) {
      options.add(GrassOption(
        image: 'assets/diploidlp.png',
        heading: 'Perennial Grasses',
        description:
            "The total annual rainfall is too low (<500mm) for reliable growth of perennial grasses including ryegrasses, cocksfoot, and tall fescue. Consider alternative forage options suitable for very dry conditions.",
        link: Container(),
        showCultivarsButton: false,
      ));
    }
    // Only proceed with adding perennial grasses if total rainfall is adequate
    else if (!isUnsuitableForSensitiveAnimals) {
      // Conditions are suitable - add appropriate ryegrass options
      if (isSensitiveAnimal) {
        // Safe versions for sensitive animals
        options.addAll([
          GrassOption(
            image: 'assets/diploidlp.png',
            heading: 'Diploid Perennial Ryegrasses',
            description:
                'Bred specifically for tougher environments diploids combine yield and robustness, meaning that even in poorer conditions, they are more likely to deliver for your stock.',
            link: DiploidRyegrassSafe(country: country, region: region),
            showCultivarsButton: true,
          ),
          GrassOption(
            image: 'assets/diploidlp.png',
            heading: 'Tetraploid perennial ryegrass',
            description:
                'Tetraploids have larger seeds than diploids and require a higher sowing rate of 25 to 35 kg/ha alone or 15 to 20 kg/ha in a mixture. They also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650mm p.a.) to perform well.',
            link: TetraploidRyegrassSafe(country: country, region: region),
            showCultivarsButton: true,
          ),
          GrassOption(
            image: 'assets/barrierpic.png',
            heading: 'Festulolium perennial grass',
            description:
            'Highly palatable to livestock and will not cause grass staggers or heat stress. Being more palatable they also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650 mm p.a.) to perform well.',
            link: meadowfescue(country: country, region: region),
            showCultivarsButton: true,
          ),
        ]);
      } else {
        // Toxic versions for non-sensitive animals
        options.addAll([
          GrassOption(
            image: 'assets/diploidlp.png',
            heading: 'Diploid perennial ryegrass',
            description:
                'Bred specifically for tougher environments diploids combine yield and robustness, meaning that even in poorer conditions, they are more likely to deliver for your stock.',
            link: DiploidRyegrassSafe(country: country, region: region),
            showCultivarsButton: true,
          ),
          GrassOption(
            image: 'assets/diploidlp.png',
            heading: 'Tetraploid perennial ryegrass',
            description:
                'Tetraploids have larger seeds than diploids and require a higher sowing rate of 25 to 35 kg/ha alone or 15 to 20 kg/ha in a mixture. They also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650mm p.a.) to perform well.',
            link: TetraploidRyegrassSafe(country: country, region: region),
            showCultivarsButton: true,
          ),
          GrassOption(
            image: 'assets/barrierpic.png',
            heading: 'Festulolium perennial grass',
            description:
            'Highly palatable to livestock and will not cause grass staggers or heat stress. Being more palatable they also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650 mm p.a.) to perform well.',
            link: meadowfescue(country: country, region: region),
            showCultivarsButton: true,
          ),
        ]);
      }
    } else {
      // Conditions are unsuitable - add informative messages (only if total rain is adequate)
      if (isSummerRainLow && isSoilAcidic) {
        options.add(GrassOption(
          image: 'assets/diploidlp.png',
          heading: 'Perennial Ryegrasses',
          description:
              "The summer rainfall and soil acidity is too low for good ryegrass growth.",
          link: Container(),
          showCultivarsButton: false,
        ));
      } else if (isSoilAcidic) {
        options.add(GrassOption(
          image: 'assets/diploidlp.png',
          heading: 'Perennial Ryegrasses',
          description: "The soil acidity is too low for good ryegrass growth.",
          link: Container(),
          showCultivarsButton: false,
        ));
      } else if (isSummerRainLow) {
        options.add(GrassOption(
          image: 'assets/diploidlp.png',
          heading: 'Perennial Ryegrasses',
          description:
              "The summer rainfall is too low for good ryegrass growth.",
          link: Container(),
          showCultivarsButton: false,
        ));
      }
    }

    // Add drought-tolerant options when conditions are challenging
    // BUT only if total annual rainfall is NOT too low
    if (!isTotalRainTooLowForPerennials && isUnsuitableForSensitiveAnimals) {
      options.addAll([
        GrassOption(
          image: 'assets/cocksfootpic.png',
          heading: 'Cocksfoot',
          description:
              'A slower establishing, productive, drought tolerant perennial grass species which grows strongly in summer. Cocksfoot is best used in drier, moderate fertility and free draining soils.',
          link: Cocksfoot(region: region, country: country),
          showCultivarsButton: true,
        ),
      ]);
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
                    'Perennial Grass',
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
