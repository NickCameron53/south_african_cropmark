import '../../tools/yield%20calculators/rootcropyieldcalculator.dart';
import '../../tools/yield%20calculators/yieldcalculator.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';

class samplemethod extends StatefulWidget {
  samplemethod({
    Key? key,
    required this.region,
    required this.species,
    //  required this.foragetype,
  }) : super(key: key);
  final String region;
  final String species;

//  final String foragetype;

  @override
  State<StatefulWidget> createState() {
    return samplemethodState();
  }
}

class samplemethodState extends State<samplemethod> {
  @override
  String sample = '';

  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Column(
            children: [
              Text(
                widget.species,
                style: TextStyle(color: Colors.white, fontSize: 18.0),
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
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.fromLTRB(10.0, 0.0, 12.0, 200.0),
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: "Choose a sampling method",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 22,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.green,
              thickness: 1,
              height: 20,
              indent: 5,
              endIndent: 5,
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 10.0),
              child: RichText(
                text: TextSpan(
                  text: "Method 1:",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 3.0, 5.0),
              child: RichText(
                text: TextSpan(
                  text:
                      "The crop was precision drilled.\n\nRow length and row width are constant.\n\nBulbs and tops are separately weighed.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 3.0),
              child: Align(
                child: ElevatedButton(
                  child: Text('Start'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => rootcropyieldcalculator(
                                region: widget.region,
                                species: widget.species,
                                samplemethod: "method 1",
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime,
                    // Set background color to lime
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0) // Set corner radius
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.green,
              thickness: 1,
              height: 20,
              indent: 5,
              endIndent: 5,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 10.0, 12.0, 0.0),
              child: RichText(
                text: TextSpan(
                  text: "Method 2:",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            if (widget.species == 'Fodder Beet') ...[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 3.0, 5.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        "Ideally the fodder beet crop should precision drilled for best results.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
            ],
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 0.0, 3.0, 5.0),
              child: RichText(
                text: TextSpan(
                  text:
                      "\nThe crop was conventionally drilled.\n\nA sample area in square metres is provided.\n\nBulbs and tops are separately weighed.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                  ),
                ),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(80.0, 30.0, 80.0, 3.0),
              child: Align(
                child: ElevatedButton(
                  child: Text('Start'),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => rootcropyieldcalculator(
                                region: widget.region,
                                species: widget.species,
                                samplemethod: "method 2",
                              )),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lime,
                    // Set background color to lime
                    shape: RoundedRectangleBorder(
                        borderRadius:
                            BorderRadius.circular(30.0) // Set corner radius
                        ),
                  ),
                ),
              ),
            ),
            SizedBox(height: 10),
            Divider(
              color: Colors.green,
              thickness: 1,
              height: 20,
              indent: 5,
              endIndent: 5,
            ),


            if (widget.species != 'Fodder Beet' ) ...[
              Container(
                padding: EdgeInsets.fromLTRB(20.0, 10.0, 12.0, 0.0),
                child: RichText(
                  text: TextSpan(
                    text: "Method 3:",
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 3.0, 5.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        "\n\nThe crop was conventionally drilled.\n\nA sample area in square metres is provided.\n\nThe whole plant is weighed.",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(80.0, 10.0, 80.0, 3.0),
                child: Align(
                  child: ElevatedButton(
                    child: Text('Start'),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => yieldcalculator(
                                  region: widget.region,
                                  species: widget.species,
                                )),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lime,
                      // Set background color to lime
                      shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(30.0) // Set corner radius
                          ),
                    ),
                  ),
                ),
              ),
            SizedBox(height: 10),
            Divider(
              color: Colors.green,
              thickness: 1,
              height: 20,
              indent: 5,
              endIndent: 5,
            ),
            ],
          ],
        ),
      ),
    );
  }
}
