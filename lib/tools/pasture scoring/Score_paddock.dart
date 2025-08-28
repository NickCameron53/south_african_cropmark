import 'dart:async';
import '../../orders/orderform.dart';
import '../../tools/pasture%20scoring/paddock_results.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../Species_Tool_List.dart';
import '../../webpage.dart';

class scoreapaddock extends StatefulWidget {
  final String datetoday;
  final String paddock;
  final String farmname;
  final String assessor;
  final String emailController;

  const scoreapaddock(
      {Key? key,
      required this.emailController,
      required this.paddock,
      required this.farmname,
      required this.assessor,
      required this.datetoday})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _scoreapaddockState();
  }
}

class PaddockData {
  double avgScore;

  PaddockData(
    this.avgScore,
  );
}

class _scoreapaddockState extends State<scoreapaddock> {
  List<PaddockData> paddocksList = [];

  int _total = 0;
  int _count = 0;

  double avscore = 0.0;
  String season = 'Spring';

  void _increment(int value) {
    setState(() {
      _total += value;
      _count++;
      avscore = _total / _count; // added this here now
    });
  }

  // ============= timer for score image 1======================
  bool _showImage1 = false;
  bool _showText1 = true;

  void _toggleText1() {
    setState(() {
      // Set the image visibility to true
      _showImage1 = true;
      _showText1 = false;
      // Create a timer to set the image visibility to false after 5 seconds
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _showImage1 = false;
          _showText1 = true;
        });
      });
    });
  }

  // ============= timer for score image 2======================
  bool _showImage2 = false;
  bool _showText2 = true;

  void _toggleText2() {
    setState(() {
      // Set the image visibility to true
      _showImage2 = true;
      _showText2 = false;
      // Create a timer to set the image visibility to false after 5 seconds
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _showImage2 = false;
          _showText2 = true;
        });
      });
    });
  }

  // ============= timer for score image 3======================
  bool _showImage3 = false;
  bool _showText3 = true;

  void _toggleText3() {
    setState(() {
      // Set the image visibility to true
      _showImage3 = true;
      _showText3 = false;
      // Create a timer to set the image visibility to false after 5 seconds
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _showImage3 = false;
          _showText3 = true;
        });
      });
    });
  }

  // ============= timer for score image 4======================
  bool _showImage4 = false;
  bool _showText4 = true;

  void _toggleText4() {
    setState(() {
      // Set the image visibility to true
      _showImage4 = true;
      _showText4 = false;
      // Create a timer to set the image visibility to false after 5 seconds
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _showImage4 = false;
          _showText4 = true;
        });
      });
    });
  }

// ============= timer for score image 5======================
  bool _showImage5 = false;
  bool _showText5 = true;

  void _toggleText5() {
    setState(() {
      // Set the image visibility to true
      _showImage5 = true;
      _showText5 = false;
      // Create a timer to set the image visibility to false after 5 seconds
      Timer(const Duration(seconds: 3), () {
        setState(() {
          _showImage5 = false;
          _showText5 = true;
        });
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Record Pasture Scores",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.right,
            ),
            Text(
              "Scroll down to select season and save.",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
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
      body: Form(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[


                  Row(
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20.0, 12.0, 0.0),
                        child: Text('Paddock name:'),
                      ),
                      Container(
                        padding: EdgeInsets.fromLTRB(20, 20.0, 12.0, 0.0),
                        child: Text(
                          widget.paddock,
                          style: TextStyle(
                            color: Colors.green.shade900,
                            fontSize: 16.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 1,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0.0, 20.0, 0.0),
                    child: Text(
                      'Select the score that represents the paddocks pasture quality.',
                      style: TextStyle(
                        color: Colors.green.shade900,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 20, 2.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.green[900],
                          foregroundColor: Colors.white,
                          child: Image.asset(
                            'assets/showicon.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          shape: CircleBorder(),
                          onPressed: _toggleText5,
                        ),
                      ),

                      // Create a conditional widget to show or hide the image

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _showImage5
                            ? Image.asset('assets/score5.png')
                            : const SizedBox.shrink(),
                      ),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 2.0),
                            child: FloatingActionButton(
                              child: Text(
                                '5',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor: Colors.green[800],
                              foregroundColor: Colors.white,
                              hoverColor: Colors.blue,
                              onPressed: () {
                                _increment(5);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _showText5,
                            child: Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10, 20.0, 95.0, 2.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Whole paddock has dense sward of desired grasses and clovers.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 20, 2.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.green[900],
                          foregroundColor: Colors.white,
                          child: Image.asset(
                            'assets/showicon.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          shape: CircleBorder(),
                          onPressed: _toggleText4,
                        ),
                      ),
                      // Create a conditional widget to show or hide the image

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _showImage4
                            ? Image.asset('assets/score4.png')
                            : const SizedBox.shrink(),
                      ),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 2.0),
                            child: FloatingActionButton(
                              child: Text(
                                '4',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor: Colors.green[800],
                              foregroundColor: Colors.white,
                              hoverColor: Colors.blue,
                              onPressed: () {
                                _increment(4);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _showText4,
                            child: Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10, 20.0, 95.0, 2.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Parts of the paddock show signs of low level damage, less vigorous grasses and some weeds.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 20, 2.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.green[900],
                          foregroundColor: Colors.white,
                          child: Image.asset(
                            'assets/showicon.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          shape: CircleBorder(),
                          onPressed: _toggleText3,
                        ),
                      ),
                      // Create a conditional widget to show or hide the image

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _showImage3
                            ? Image.asset('assets/score3.png')
                            : const SizedBox.shrink(),
                      ),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 2.0),
                            child: FloatingActionButton(
                              child: Text(
                                '3',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor: Colors.green[800],
                              foregroundColor: Colors.white,
                              hoverColor: Colors.blue,
                              onPressed: () {
                                _increment(3);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _showText3,
                            child: Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10, 20.0, 95.0, 2.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Majority of paddock has low level damage, weeds, and less vigorous grasses.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 20, 2.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.green[900],
                          foregroundColor: Colors.white,
                          child: Image.asset(
                            'assets/showicon.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          shape: CircleBorder(),
                          onPressed: _toggleText2,
                        ),
                      ),
                      // Create a conditional widget to show or hide the image

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _showImage2
                            ? Image.asset('assets/score2.png')
                            : const SizedBox.shrink(),
                      ),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 2.0),
                            child: FloatingActionButton(
                              child: Text(
                                '2',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor: Colors.green[800],
                              foregroundColor: Colors.white,
                              hoverColor: Colors.blue,
                              onPressed: () {
                                _increment(2);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _showText2,
                            child: Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10, 20.0, 95.0, 2.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Parts of the paddock have severe damage, a lot of weeds and bare ground.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Stack(
                    alignment: Alignment.centerRight,
                    children: [
                      Container(
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 20, 2.0),
                        child: FloatingActionButton(
                          backgroundColor: Colors.green[900],
                          foregroundColor: Colors.white,
                          child: Image.asset(
                            'assets/showicon.png',
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                          ),
                          shape: CircleBorder(),
                          onPressed: _toggleText1,
                        ),
                      ),
                      // Create a conditional widget to show or hide the image

                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: _showImage1
                            ? Image.asset('assets/score1.png')
                            : const SizedBox.shrink(),
                      ),

                      Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(10.0, 20.0, 0, 2.0),
                            child: FloatingActionButton(
                              child: Text(
                                '1',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                ),
                              ),
                              backgroundColor: Colors.green[800],
                              foregroundColor: Colors.white,
                              hoverColor: Colors.blue,
                              onPressed: () {
                                _increment(1);
                              },
                            ),
                          ),
                          Visibility(
                            visible: _showText1,
                            child: Expanded(
                              child: Container(
                                padding:
                                    EdgeInsets.fromLTRB(10, 20.0, 95.0, 2.0),
                                child: RichText(
                                  text: TextSpan(
                                    text:
                                        "Entire paddock severely damaged from pugging and loss of plants, weeds present throughout paddock.",
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 12,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: EdgeInsets.fromLTRB(40, 0.0, 12.0, 10.0),
                    child: Container(
                      width: 260,
                      decoration: BoxDecoration(
                        color: Colors.green.shade700,
                        // Set background color to green
                        border: Border.all(
                            color: Colors.green.shade700, width: 1.0),
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      padding: EdgeInsets.fromLTRB(20.0, 0.0, 30.0, 10.0),
                      child: Row(
                        children: [
                          Container(
                            padding: EdgeInsets.fromLTRB(20, 20.0, 12.0, 0.0),
                            child: Text(
                              'Average Score',
                              style: TextStyle(
                                  color:
                                      Colors.white), // Set text color to white
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 0.0),
                            child: Text(
                              avscore.toStringAsFixed(1),
                              style: TextStyle(
                                  color:
                                      Colors.white), // Set text color to white
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 1,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Text(
                          'Select the season when you intend to renovate the pasture:')),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RadioListTile(
                      title: Text(
                        'Spring',
                        style: TextStyle(fontSize: 15),
                      ),
                      value: 'Spring',
                      groupValue: season,
                      activeColor: Colors.green[800],
                      onChanged: (value) {
                        setState(() {
                          season = value.toString();
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                    child: RadioListTile(
                      title: Text(
                        'Autumn',
                        style: TextStyle(fontSize: 15),
                      ),
                      value: 'Autumn',
                      activeColor: Colors.green[800],
                      groupValue: season,
                      onChanged: (value) {
                        setState(() {
                          season = value.toString();
                        });
                      },
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(60.0, 50.0, 60.0, 50.0),
                    child: ElevatedButton(
                      child: Text('Save',
                          style: TextStyle(
                            color: Colors.black,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            //                 builder: (context) => scoring(
                            builder: (context) => paddockresults(
                              datetoday: widget.datetoday,
                              paddock: widget.paddock,
                              farmname: widget.farmname,
                              assessor: widget.assessor,
                              emailController: widget.emailController,
                              season: season,
                              avscore: avscore.toString(),
                              // need to add season and average score here as a pass through
                            ),
                          ),
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
                ],
              ),
            );
          },
        ),
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
