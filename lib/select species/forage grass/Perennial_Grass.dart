import '../../abouttheguide.dart';
import '../../orders/orderform.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../Species_Tool_List.dart';
import '../../main.dart';
import 'cocksfoot.dart';
import 'diploid ryegrass.dart';
import 'meadow fescue.dart';
import 'tetraploid ryegrass.dart';

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

class perennialgrass extends StatelessWidget {
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

  perennialgrass({
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
    if (!isSummerRainLow && !isSoilAcidic) {
      options.addAll([
        GrassOption(
          // Normal case - neither condition is problematic
          image: 'assets/diploidlp.png',
          heading: 'Diploid perennial ryegrass',
          description:
              'Bred specifically for tougher environments diploids combine yield and robustness, meaning that even in poorer conditions, they are more likely to deliver for your stock.',
          link: diploidryegrasssafe(country: country, region: region),
          showCultivarsButton: true,
        ),
        GrassOption(
          image: 'assets/diploidlp.png',
          heading: 'Tetraploid perennial ryegrass',
          description:
              'Tetraploids have larger seeds than diploids and require a higher sowing rate of 25 to 35 kg/ha alone or 15 to 20 kg/ha in a mixture. They also require more careful grazing management to prevent overgrazing, and may also require higher fertility and adequate moisture (minimum 650mm p.a.) to perform well.',
          link: tetraploidryegrasssafe(country: country, region: region),
          showCultivarsButton: true,
        ),
        GrassOption(
            image: 'assets/barrierpic.png',
            heading: 'Festulolium grass',
            description:
                'Festuloliums are crosses between Lolium and Festuca species incorporating the useful endophytes and root systems of Fescues with the winter activity and higher yields of the Lolium species. Sow at 25 to 28kg/hectare along  with 3 to 4kgs of clover, plus 2 to 4kgs of herbs (chicory and/or plantain) if desired.',
            link: meadowfescue(country: country, region: region),
            showCultivarsButton: true),
        GrassOption(
            image: 'assets/cocksfootpic.png',
            heading: 'Cocksfoot',
            description:
                'A slower establishing, productive, drought tolerant perennial grass species which grows strongly in summer. Cocksfoot is best used in drier, moderate fertility and free draining soils.',
            link: cocksfoot(region: region, country: country),
            showCultivarsButton: true),
      ]);
    } else if (isSummerRainLow && isSoilAcidic) {
      // Both conditions are problematic
      options.add(GrassOption(
        image: 'assets/diploidlp.png',
        heading: 'Perennial Ryegrasses',
        description:
            "The soil acidity and summer moisture levels are too low for good ryegrass growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isSoilAcidic) {
      // Only soil acidity is problematic
      options.add(GrassOption(
        image: 'assets/diploidlp.png',
        heading: 'Perennial Ryegrasses',
        description: "The soil acidity is too low for good ryegrass growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    } else if (isSummerRainLow) {
      // Only summer rain is problematic
      options.add(GrassOption(
        image: 'assets/diploidlp.png',
        heading: 'Perennial Ryegrasses',
        description: "The summer moisture is too low for good ryegrass growth.",
        link: Container(),
        showCultivarsButton: false,
      ));
    }

    // Add cocksfoot if either condition is problematic
    if (isSummerRainLow || isSoilAcidic) {
      options.add(GrassOption(
        image: 'assets/cocksfootpic.png',
        heading: 'Cocksfoot',
        description:
            'A slower establishing, productive, drought tolerant perennial grass species which grows strongly in summer. Cocksfoot is best used in drier, moderate fertility and free draining soils.',
        link: cocksfoot(region: region, country: country),
        showCultivarsButton: true,
      ));
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
