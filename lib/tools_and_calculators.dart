import '../../tools/crop%20calculators/cerealcalculator.dart';
import '../../tools/crop%20calculators/chicoryareacalculator.dart';
import '../../tools/crop%20calculators/sow rate calculator.dart';
import '../../tools/crop%20calculators/crop planning calculator.dart';
import '../../tools/crop%20calculators/grazing allocation calculator.dart';
import '../../tools/pasture%20scoring/farmdetail.dart';
import '../../tools/price%20benefit%20calculators/pricebenefitannuals.dart';
import '../../tools/price%20benefit%20calculators/pricebenefititalians.dart';
import '../../tools/price%20benefit%20calculators/pricebenefitperennials.dart';
import '../../tools/yield%20calculators/samplemethod.dart';
import '../../tools/yield%20calculators/yieldcalculator.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_swiper_view/flutter_swiper_view.dart';
import '../../main.dart';
import 'Species_Tool_List.dart';
import 'orders/orderform.dart';

class toolsandcalculators extends StatelessWidget {
  final String planttype;


  toolsandcalculators({
    Key? key,
    required this.planttype,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    final List<String> images = [];
    final List<String> headings = [];
    final List<String> description = [];
    final List links = [];
    // display content according to the user inputs
    {
      if (planttype == "Pasture") {


        images.add('assets/diploidlp.png');
        headings.add('Diploid ryegrass\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Diploid ryegrass',
            sowrate: '20',
            germ: '95',
            area: '10',
          )),
        );

        images.add('assets/diploidlp.png');
        headings.add('Tetraploid ryegrass\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Tetraploid ryegrass',
            sowrate: '30',
            germ: '95',
            area: '10',
          )),
        );


        images.add('assets/cocksfootpic.png');
        headings.add('Cocksfoot\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Cocksfoot',
            sowrate: '7',
            germ: '95',
            area: '10',
          )),
        );

        images.add('assets/cocksfootpic.png');
        headings.add('Tall Fescue\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Tall Fescue',
            sowrate: '25',
            germ: '95',
            area: '10',
          )),
        );

        images.add('assets/barrierpic.png');
        headings.add('Pasture Score Tool');
        description.add(
            'Identify under-performing paddocks with suggestions for improvement.');
        links.add(farmdetail());

        images.add('assets/cocksfootpic.png');
        headings.add('Price Benefit Tool\nPerennial ryegrass');
        description.add(
            'Evaluate the financial benefit\n of using an improved cultivar.');
        links.add(pricebenefitperennials());

        images.add('assets/cocksfootpic.png');
        headings.add('Price Benefit Tool\nItalian ryegrass');
        description.add(
            'Evaluate the financial benefit\n of using an improved cultivar.');
        links.add((pricebenefititalians()));

        images.add('assets/cocksfootpic.png');
        headings.add('Price Benefit Tool\nAnnual ryegrass');
        description.add(
            'Evaluate the financial benefit\n of using an improved cultivar.');
        links.add((pricebenefitannuals()));
      }

      if (planttype == "Herbs") {
        images.add('assets/chicorypic.png');
        headings.add('Chicory\nArea calculator');
        description.add('Calculate the area required to feed a dairy cow as 20 to 30% of its diet.');
        links.add(
          (chicoryareacalculator(
            region: '',
            species: 'Chicory', sownum: '10.0', expyld: '9000', dailyallocation: '3',

          )),
        );


      }

      if (planttype == "Fodder Beet") {

        images.add('assets/geronimopic.png');
        headings.add('Fodder Beet crop\nplanning calculator');
        description
            .add('Calculate the area to sow to meet your feed requirements.');
        links.add((cropareacalculator(
          region: '',
          species: 'Fodder Beet',
          sownum: '100000',
          expyld: '20000',
          dailyallocation: '8',
        )));

        images.add('assets/geronimopic.png');
        headings.add('Fodder Beet paddock\nyield calculator');
        description
            .add('Calculate the DM Yield to assist in grazing allocation.');
        links.add((samplemethod(
          region: '',
          species: 'Fodder Beet',
        )));

        images.add('assets/geronimopic.png');
        headings.add('Fodder Beet grazing\nallocation calculator');
        description.add(
            'A feed budget providing daily break fencing area based on your inputs.');
        links.add(
          (cropcalculator(
            region: '',
            species: 'Fodder Beet',
            sownum: '100000',
            expyld: '20000',
            exputil: '90',
          )),
        );
      }

      if (planttype == "Kale") {
        images.add('assets/kalepic.png');
        headings.add('Kale\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Kale',
            sowrate: '5',
            germ: '95',
            area: '10',
          )),
        );


        images.add('assets/coleorpic.png');
        headings.add('Kale crop\nplanning calculator');
        description
            .add('Calculate the area to sow to meet your feed requirements.');
        links.add(
          (cropareacalculator(
            region: '',
            species: 'Kale',
            sownum: '5',
            expyld: '15000',
            dailyallocation: '8',
          )),
        );

        images.add('assets/coleorpic.png');
        headings.add('Kale paddock\nyield calculator');
        description
            .add('Calculate the DM Yield to assist in grazing allocation.');
        links.add(
          (yieldcalculator(
            region: '',
            species: 'Kale',
          )),
        );

        images.add('assets/coleorpic.png');
        headings.add('Kale grazing\nallocation calculator');
        description.add(
            'A feed budget providing daily break fencing area based on your inputs.');
        links.add(
          (cropcalculator(
            region: '',
            species: 'Kale',
            sownum: '5.0',
            expyld: '15000',
            exputil: '80',
          )),
        );
      }

      if (planttype == "Forage Rape") {

        images.add('assets/rapepic.png');
        headings.add('Forage Rape\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Forage Rape',
            sowrate: '4',
            germ: '95',
            area: '10',
          )),
        );


        images.add('assets/pillarpic.png');
        headings.add('Forage Rape crop\nplanning calculator');
        description
            .add('Calculate the area to sow to meet your feed requirements.');
        links.add(
          (cropareacalculator(
            region: '',
            species: 'Forage Rape',
            sownum: '4.0',
            expyld: '8000',
            dailyallocation: '4',
          )),
        );

        images.add('assets/pillarpic.png');
        headings.add('Forage Rape paddock\nyield calculator');
        description
            .add('Calculate the DM Yield to assist in grazing allocation.');
        links.add(
          (yieldcalculator(
            region: '',
            species: 'Forage Rape',
          )),
        );

        images.add('assets/pillarpic.png');
        headings.add('Forage Rape grazing\nallocation calculator');
        description.add(
            'A feed budget providing daily break fencing area based on your inputs.');
        links.add(
          (cropcalculator(
            region: '',
            species: 'Forage Rape',
            sownum: '4.0',
            expyld: '8000',
            exputil: '80',
          )),
        );
      }

      if (planttype == "Turnip") {
        images.add('assets/turnippic.png');
        headings.add('Turnip\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (sowratecalculator(
            region: '',
            species: 'Turnip',
            sowrate: '3',
            germ: '95',
            area: '10',
          )),
        );


        images.add('assets/turnippic.png');
        headings.add('Turnip crop\nplanning calculator');
        description
            .add('Calculate the area to sow to meet your feed requirements.');
        links.add(
          (cropareacalculator(
            region: '',
            species: 'Turnip',
            sownum: '3.0',
            expyld: '10000',
            dailyallocation: '4',
          )),
        );

        images.add('assets/turnippic.png');
        headings.add('Turnip paddock\nyield calculator');
        description
            .add('Calculate the DM Yield to assist in grazing allocation.');
        links.add(
          (yieldcalculator(
            region: '',
            species: 'Turnip',
          )),
        );

        images.add('assets/turnippic.png');
        headings.add('Turnip grazing\nallocation calculator');
        description.add(
            'A feed budget providing daily break fencing area based on your inputs.');
        links.add(
          (cropcalculator(
            region: '',
            species: 'Turnip',
            sownum: '3.0',
            expyld: '10000',
            exputil: '80',
          )),
        );
      }
      if (planttype == "Swede") {

        images.add('assets/saddlebackpic.png');
        headings.add('Swede crop\nplanning calculator');
        description
            .add('Calculate the area to sow to meet your feed requirements.');
        links.add((cropareacalculator(
          region: '',
          species: 'Swede',
          sownum: '5',
          expyld: '15000',
          dailyallocation: '8',
        )));

        images.add('assets/saddlebackpic.png');
        headings.add('Swede paddock\nyield calculator');
        description
            .add('Calculate the DM Yield to assist in grazing allocation.');
        links.add((samplemethod(
          region: '',
          species: 'Swede',
        )));

        images.add('assets/saddlebackpic.png');
        headings.add('Swede grazing\nallocation calculator');
        description.add(
            'A feed budget providing daily break fencing area based on your inputs.');
        links.add(
          (cropcalculator(
            region: '',
            species: 'Swede',
            sownum: '5',
            expyld: '15000',
            exputil: '90',
          )),
        );
      }



      if (planttype == "Cereals") {
        images.add('assets/dolomitepic.png');
        headings.add('Barley\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (cerealcalculator(
            region: '',
            species: 'Barley',
            pop: '250',
            tgw: '50',
            germ: '99',
            efe: '90',
            area: '20',
          )),
        );

        images.add('assets/dolomitepic.png');
        headings.add('Wheat\nSowing Rate calculator');
        description.add('Calculate the amount and rate of seed required.');
        links.add(
          (cerealcalculator(
            region: '',
            species: 'Wheat',
            pop: '200',
            tgw: '50',
            germ: '95',
            efe: '90',
            area: '20',
          )),
        );
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
                    'Tools & Calculators',
                    style: TextStyle(color: Colors.white, fontSize: 20.0),
                    textAlign: TextAlign.center,
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
                      'Swipe across to see the tools available.',
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
                                          child: Text('Start'),
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
                  String homePageTitle = 'Home'; // Or derive title dynamically
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MyHomePage(title: homePageTitle),
                    ),
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
                label: 'Home',
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
