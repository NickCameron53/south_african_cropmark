import '../../select%20species/Legume/Legumes.dart';
import '../../select%20species/fodder%20beet/Fodder_Beet.dart';
import '../../select%20species/forage%20grass/Annual_Ryegrass.dart';
import '../../select%20species/forage%20grass/Cocksfoot_grass.dart';
import '../../select%20species/forage%20grass/Hybrid_Ryegrass.dart';
import '../../select%20species/forage%20grass/Italian_Ryegrass.dart';
import '../../select%20species/forage%20grass/Perennial_Grass.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'select species/brassica/Brassicas.dart';
import 'select species/forage herbs/Herbs.dart';

class SeedType extends StatefulWidget {
  SeedType({
    Key? key,
    required this.country,
    required this.region,
    required this.representative,
    required this.headshot,
    required this.phonenum,
    required this.retailname,
  }) : super(key: key);

  final String country, region, representative, headshot, phonenum, retailname;

  @override
  State<SeedType> createState() {
    return _SeedTypeState();
  }
}

class _SeedTypeState extends State<SeedType> {
  late int selectedIndex1;
  final int defaultForageTypeIndex = 0;
  late int selectedIndex2;
  final int defaultAnimalTypeIndex = 2;
  late int selectedIndex3;
  final int defaultSummerRainIndex = 1;
  late int selectedIndex4;
  final int defaultTotalRainIndex = 1;
  late int selectedIndex5;
  final int defaultSoilAcidityIndex = 1;

  List<String> foragetype = [
    'Perennial grasses\n     5+ years',
    'Hybrid ryegrass\n   2-5 years',
    'Italian ryegrass\n   18 months',
    'Annual ryegrass\n   9 months',
    'C4 Annual grass\n  7 months',
    'Brome grasses\n   3+ years',
    'Cocksfoot\n  5+ years',
    'Tall Fescue\n   5+ years',
    'Herbs',
    'Legumes',
    'Fodder Beet',
    'Brassicas',
    'Cereals',
  ];
  List<String> animaltype = [
    'Sheep',
    'Beef',
    'Dairy',
    'Horses',
    'Goats',
    'Deer',
    'Alpacas',
  ];
  List<String> totalrain = [
    '      Low\n(<500mm)',
    '      Medium\n(500-750mm)',
    '      High\n(>750mm)',
  ];

  List<String> summerrain = [
    '      Low\n(<150mm)',
    '      Medium\n(150-300mm)',
    '      High\n(>300mm)',
  ];
  List<String> soilacidity = [
    '   Acid\n<pH5.5',
    '   Normal\npH5.5 to pH6.5',
    'Alkaline\n>pH6.5',
  ];

  bool validationBool = true;

  @override
  void initState() {
    super.initState();
    _initializeSelectedIndex1(); // Call the initialization function
    _initializeSelectedIndex2();
    _initializeSelectedIndex3();
    _initializeSelectedIndex4();
    _initializeSelectedIndex5();
  }

  void _initializeSelectedIndex1() {
    selectedIndex1 = defaultForageTypeIndex; // Set the default value
  }

  void _initializeSelectedIndex2() {
    selectedIndex2 = defaultAnimalTypeIndex; // Set the default value
  }

  void _initializeSelectedIndex3() {
    selectedIndex3 = defaultSummerRainIndex; // Set the default value
  }

  void _initializeSelectedIndex5() {
    selectedIndex4 = defaultTotalRainIndex; // Set the default value
  }

  void _initializeSelectedIndex4() {
    selectedIndex5 = defaultSoilAcidityIndex; // Set the default value
  }

  _makingPhoneCall() async {
    var url = Uri.parse(widget.phonenum);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch ';
    }
  }

  //check every requirement is selected
  bool _checkInputs() {
    List<int> inputList = [
      selectedIndex1,
      selectedIndex2,
      selectedIndex3,
      selectedIndex4,
      selectedIndex5,
    ];
    if (selectedIndex1 == foragetype.indexOf('Cereals') ||
        selectedIndex1 ==
            foragetype.indexOf('Perennial grasses\n     5+ years')) {
      inputList.add(selectedIndex5);
    }

    for (int input in inputList) {
      if (input == -1) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              content:
              Text('Please make sure you have selected every requirement'),
              actions: <Widget>[
                TextButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text(
                    'OK',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
              ],
              backgroundColor: Colors.white,
              // Set background color to green
              contentTextStyle:
              TextStyle(color: Colors.black), // Set text color to white
            );
          },
        );
        return false;
      }
    }
    return true;
  }

//some state variable should be here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 70,
          title: Column(
            children: [
              Text(
                widget.region,
                style: TextStyle(color: Colors.white, fontSize: 20.0),
                textAlign: TextAlign.center,
              ),
              Text(
                'Call the regional representative ',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.right,
              ),
              Text(
                'for any assistance in using this App.',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              onPressed: (_makingPhoneCall),
            ),
          ]),
      body: Container(
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
        child: Center(
          child: ListView(
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 20.0),
            children: <Widget>[
              // select forage type

              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 0.0, 10.0),
                child: RichText(
                  text: TextSpan(
                    text: "Select your requirements",
                    style: TextStyle(
                        color: Colors.lime,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                alignment: Alignment.bottomLeft,
                padding: EdgeInsets.fromLTRB(0.0, 20.0, 80.0, 10.0),
                child: RichText(
                  text: TextSpan(
                    text: "Forage Type:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                height: 50,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: foragetype.map((forage) {
                      return _forageButton(
                          forage, selectedIndex1 == foragetype.indexOf(forage));
                    }).toList()),
              ),

              // select animal type
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Animal Grazing Type:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: animaltype.map((animal) {
                      return _animaltypeButton(
                          animal, selectedIndex2 == animaltype.indexOf(animal));
                    }).toList()),
              ),

              // summer rainfall
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Summer Rainfall:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: summerrain.map((summerrain) {
                      return _summerrainButton(summerrain,
                          selectedIndex3 == summerrain.indexOf(summerrain));
                    }).toList()),
              ),

              // total annual rainfall
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Annual Rainfall:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),

              Container(
                height: 50,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: totalrain.map((totalrain) {
                      return _totalrainButton(totalrain,
                          selectedIndex4 == totalrain.indexOf(totalrain));
                    }).toList()),
              ),

              // soil acidity
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: "Soil Acidity:",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),

              Container(
                height: 50,
                child: ListView(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    children: soilacidity.map((soilacidity) {
                      return _soilacidityButton(soilacidity,
                          selectedIndex5 == soilacidity.indexOf(soilacidity));
                    }).toList()),
              ),

              // at this stage start pushing based on values committed above:


              Visibility(
                visible: selectedIndex1 ==
                    foragetype.indexOf('Annual ryegrass\n   9 months'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Annual ryegrass'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => annualryegrass(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),


              Visibility(
                visible: selectedIndex1 ==
                    foragetype.indexOf('Italian ryegrass\n   18 months'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Italian ryegrass'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ItalianRyegrass(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),
              Visibility(
                visible: selectedIndex1 ==
                    foragetype.indexOf('Hybrid ryegrass\n   2-5 years'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Hybrid ryegrass'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HybridRyegrass(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),



              Visibility(
                visible: selectedIndex1 ==
                    foragetype.indexOf('Cocksfoot\n  5+ years'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Cocksfoot'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Cocksfoots(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),


              Visibility(
                visible: selectedIndex1 == foragetype.indexOf('Herbs'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Herbs'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => herbs(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: selectedIndex1 == foragetype.indexOf('Legumes'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Legumes'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Legumes(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: selectedIndex1 == foragetype.indexOf('Fodder Beet'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Fodder Beet'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => fodderbeet(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: selectedIndex1 == foragetype.indexOf('Brassicas'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(10.0, 60.0, 10.0, 10.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Brassicas'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => brassicas(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                foragetype:
                                foragetype[selectedIndex1],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),

              Visibility(
                visible: selectedIndex1 ==
                    foragetype.indexOf('Perennial grasses\n     5+ years'),
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 60.0, 20.0, 0.0),
                  child: Align(
                    child: ElevatedButton(
                      child: Text('Proceed to Perennial grasses'),
                      onPressed: () {
                        validationBool = _checkInputs();
                        validationBool
                            ? Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => PerennialGrass(
                                country: widget.country,
                                region: widget.region,
                                representative: widget.representative,
                                headshot: widget.headshot,
                                phonenum: widget.phonenum,
                                foragetype:
                                foragetype[selectedIndex1],
                                animaltype:
                                animaltype[selectedIndex2],
                                summerrain:
                                summerrain[selectedIndex3],
                                totalrain: totalrain[selectedIndex4],
                                soilacidity:
                                soilacidity[selectedIndex5],
                              )),
                        )
                            : null;
                      },
                      style: ElevatedButton.styleFrom(
                        foregroundColor: Colors.black,
                        backgroundColor: Colors.lime,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(40.0),
                        ),
                        minimumSize: Size(30, 50),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _forageButton(String title, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex1 = foragetype.indexOf(title);
          });
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: selectedIndex1 == foragetype.indexOf(title)
              ? Colors.white
              : Colors.white, // Maintain consistent text color
          backgroundColor: selectedIndex1 == foragetype.indexOf(title)
              ? Colors.lime
              : Colors.green[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: Size(60, 60),
        ),
      ),
    );
  }

  Widget _animaltypeButton(String title, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex2 = animaltype.indexOf(title);
          });
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: selectedIndex2 == animaltype.indexOf(title)
              ? Colors.white
              : Colors.white, // Maintain consistent text color
          backgroundColor: selectedIndex2 == animaltype.indexOf(title)
              ? Colors.lime
              : Colors.green[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: Size(60, 60),
        ),
      ),
    );
  }

  Widget _summerrainButton(String title, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex3 = summerrain.indexOf(title);
          });
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: selectedIndex3 == summerrain.indexOf(title)
              ? Colors.white
              : Colors.white, // Maintain consistent text color
          backgroundColor: selectedIndex3 == summerrain.indexOf(title)
              ? Colors.lime
              : Colors.green[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: Size(60, 60),
        ),
      ),
    );
  }

  Widget _totalrainButton(String title, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex4 = totalrain.indexOf(title);
          });
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.black : Colors.white,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: selectedIndex4 == totalrain.indexOf(title)
              ? Colors.white
              : Colors.white, // Maintain consistent text color
          backgroundColor: selectedIndex4 == totalrain.indexOf(title)
              ? Colors.lime
              : Colors.green[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: Size(60, 60),
        ),
      ),
    );
  }

  Widget _soilacidityButton(String title, bool isSelected) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
      curve: Curves.easeIn,
      child: ElevatedButton(
        onPressed: () {
          setState(() {
            selectedIndex5 = soilacidity.indexOf(title);
          });
        },
        child: Text(
          title,
          style: TextStyle(
            color: isSelected ? Colors.white : Colors.white,
            fontSize: 13,
          ),
        ),
        style: ElevatedButton.styleFrom(
          foregroundColor: selectedIndex5 == soilacidity.indexOf(title)
              ? Colors.white
              : Colors.white, // Maintain consistent text color
          backgroundColor: selectedIndex5 == soilacidity.indexOf(title)
              ? Colors.lime
              : Colors.green[900],
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40.0),
          ),
          minimumSize: Size(60, 60),
        ),
      ),
    );
  }
}
