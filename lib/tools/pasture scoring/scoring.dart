import 'dart:async';
import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class scoring extends StatefulWidget {
  final String datetoday;
  final String paddock;
  final String farmname;
  final String assessor;
  final String emailController;

  const scoring(
      {Key? key,
      required this.emailController,
      required this.paddock,
      required this.farmname,
      required this.assessor,
      required this.datetoday})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _scoringState();
  }
}

class PaddockData {
  String name;
  double avgScore;
  String recommendation;
  String product;

  PaddockData(this.name, this.avgScore, this.recommendation, this.product);
}

class _scoringState extends State<scoring> {
  final paddock = TextEditingController()..text = '';
  List<PaddockData> paddocksList = [];

  int _total = 0;
  int _count = 0;
  String recommendation = '';
  String product = '';
  double avscore = 0.0;
  String season = 'Spring';

  void _increment(int value) {
    setState(() {
      _total += value;
      _count++;
    });
  }

  final _emailFormKey = GlobalKey<FormState>();

  bool validateInput() {
    if (paddock.text.isEmpty) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Please enter a paddock name'),
            content: Text('The paddock name can not be empty!'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    } else if (_count == 0) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('For this new paddock:'),
            content: Text('Please enter at least one score!'),
            actions: <Widget>[
              TextButton(
                child: Text('Ok'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
      return false;
    } else {
      if (_emailFormKey.currentState!.validate()) {
        avscore = _total / _count;

// ======================== spring recommendations =================================
        if (avscore > 1.0 && avscore <= 1.999 && season == "Spring") {
          recommendation =
              "Immediate action required this spring. This paddock may have been severely pugged over winter or has major plant density or weed issues. Check soil fertility and presence of pasture pests such as porina and grass grub.\nSow into crop this spring before returning to perennial pasture (the products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall).\n";
          product =
              "Summer Crop: Chico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nPillar Rape@4-5kg/ha  Or  Winter Crop Proteor Kale @3-4kg/ha \nColeor Kale @3-4kg/ha";
        }
        if (avscore > 2.0 && avscore <= 3.0 && season == "Spring") {
          recommendation =
              "Check soil fertility and presence of pasture pests. It is likely that this pasture is limiting on farm production.\n Consider cropping this spring for a new season forage crop (depending on rank of paddock for pasture score) followed by a crop & then followed by a perennial pasture (the products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall). \n If cropping this paddock is not desired consider under-sowing this paddock early in the season with a high rate of a short-term Italian ryegrass to last for the next 12 months.\n";
          product =
              "Summer Crop: Chico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nPillar Rape @4-5kg/ha \nOr \nWinter Crop \nKea Kale @3-4kg/ha \nColeor Kale @3-4kg/ha \nItalian Ryegrass \n Vibe Italian Ryegrass	@15-20kg/ha \nAppeal Italian Ryegrass @15-20kg/ha \nFrenzy Hybrid Ryegrass @20-25/ha \nPasture spray with a 2,4D or MCPA/MCPB type product to control majority of weeds that may be present.";
        }
        if (avscore > 3.0 && avscore <= 3.5 && season == "Spring") {
          recommendation =
              "This paddock has some plant density or weed concerns or has a moderate level of pugging. If still early in the season, consider undersowing this paddock with a fast establishing Italian or hybrid ryegrass.  This paddock may also require a pasture spray to control weed pressure. If paddock is bumpy or rough, the use of a roller or harrows can be a good idea to help smooth out any pugging damage before undersowing. This paddock may be a candidate for future cropping in 1 - 3 years.\n";
          product =
              "Vibe Italian Ryegrass	@12-18kg/ha. Appeal Italian Ryegrass @12-18kg/ha.\nSplice Hybrid Ryegrass @15-20kg/ha. \nFrenzy Hybrid Ryegrass	@15-20kg/ha. Pasture spray with a 2,4D or MCPA/MCPB type product to control majority of weeds that may be present.";
        }
        if (avscore > 3.5 && avscore <= 4.5 && season == "Spring") {
          recommendation =
              "This paddock may have some pugging damage from winter and/or weed or plant density concerns. Consider an early spring weed spray targeting problematic weeds such as dock. Or a more general weed spray targeting other pasture weeds. Apply spring fertiliser along with an application of Urea/N-Protect. Paddock will be okay for coming season.\n";
          product =
              "For Dock Issues, use an Asulam type product such as Dockstar. For general weed control, a 2,4D amine or MCPA/MPCB type products work best. Consult AMS representative for specific information.    Fertiliser:  Consult AMS representative for specific information";
        }
        if (avscore > 4.5 && avscore <= 5.0 && season == "Spring") {
          recommendation =
              "Keep up the good work, this paddock has good levels of grass and clovers and minimal weed pressure. No action required. Stay on top of general fertiliser and good grazing management.\n";
          product = "";
        }
// ============================  autumn recommendations ====================================
        if (avscore > 1.0 && avscore <= 1.999 && season == "Autumn") {
          recommendation =
              "Immediate action is required. Check soil fertility and presence of pasture pests such as Argentine Stem Weevil or Black Beetle. Spray out and sow into an annual ryegrass such as Rampage, Bullet or Zoom this autumn and then a crop in spring before returning to a perennial pasture (The products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall).\n";
          product =
              "Rampage @25-30kg/ha, Zoom @25-30kg/ha. Bullet @25-30kg/ha.\n Summer Crop: Chico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nRifleman Rape @4-5kg/ha. \nPillar Rape @4-5kg/ha. Or Winter Crop: \n Kea Kale @3-4kg/ha. \nColeor Kale @3-4kg/ha.";
        }
        if (avscore > 2.0 && avscore <= 3.0 && season == "Autumn") {
          recommendation =
              "Check soil fertility and presence of pasture pests. It is likely that this pasture is limiting on farm production\n Under sow this autumn with an annual ryegrass such as Rampage for 6-8 months followed by a crop & then followed by a perennial pasture (The products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall).\n";
          product =
              "Rampage Annual Ryegrass @15-20kg/ha. Zoom Annual Ryegrass	@15-20kg/ha. Bullet Annual Ryegrass	@15-20kg/ha.\n Followed by: \nSummer Crop: Chico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nRifleman Rape @4-5kg/ha. \nPillar Rape @4-5kg/ha \nOr \nWinter Crop: \nKea Kale @3-4kg/ha. \nColeor Kale @3-4kg/ha. ";
        }
        if (avscore > 3.0 && avscore <= 3.5 && season == "Autumn") {
          recommendation =
              "This pasture has some weed or plant density concerns. Consider under-sowing these pastures with a short-term Italian (such as Vibe or Appeal) or Hybrid Ryegrass like Frenzy. This should increase the lifespan of the pasture by several years before full renovation is required. A late Autumn/Winter pasture spray may be required to control any weed issues.\n";
          product =
              "Vibe Italian Ryegrass	@12-18kg/ha. Appeal Italian Ryegrass @12-18kg/ha. Splice Hybrid Ryegrass	@15-20kg/ha. Frenzy Hybrid Ryegrass	@15-20kg/ha. Pasture spray with a 2,4D or MCPA/MCPB type product to control majority of weeds that may be present.";
        }
        if (avscore > 3.5 && avscore <= 4.5 && season == "Autumn") {
          recommendation =
              "Apply pasture spray this autumn or winter to control any weeds beginning to take hold in pasture, apply pre-winter nitrogen to boost pasture covers and encourage tillering of pastures prior to winter. Paddock is probably okay for coming season.\n";
          product =
              "Pasture spray with a 2,4D or MCPA/MCPB type product to control majority of weeds that may be present. \nGet fertiliser advice from AMS representative.";
        }
        if (avscore > 4.5 && avscore <= 5.0 && season == "Autumn") {
          recommendation =
              "Keep up the good work, this paddock has good levels of grass and clovers and minimal weed pressure. No action required. Stay on top of general fertiliser and good grazing management.\n";
          product = "";
        }

        var paddockData =
            PaddockData(paddock.text, avscore, recommendation, product);
        paddocksList.add(paddockData);
        paddock.clear();

        setState(() {
          _count = 0;
          avscore = 0.0;
          _total = 0;
        });
      }

      return true;
    }
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
              "Scroll down",
              style: TextStyle(color: Colors.white, fontSize: 12.0),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        backgroundColor:Colors.green[800],
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
        key: _emailFormKey,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0.0, 12.0, 0.0),
                    child: Text(
                        'Tap the red numbered buttons to enter your scores.\nYou can tap the show button to see a representative image for each score.'),
                  ),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Container(
                        width: 120,
                        padding: EdgeInsets.fromLTRB(0.0, 10, 0, 0),
                        child: Text(
                          'Enter Paddock Name:',
                          style: TextStyle(
                              color: Colors.green[800],
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        width: 200,
                        padding: EdgeInsets.fromLTRB(30.0, 10, 0, 0),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.symmetric(vertical: 10),
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            color: Colors.black,
                          ),
                          cursorColor: Colors.teal,
                          controller: paddock,
                          onChanged: (val) {
                            setState(() {
                              paddock.text = val;
                              paddock.selection = TextSelection.fromPosition(
                                TextPosition(offset: paddock.text.length),
                              );
                            });
                          },
                          keyboardType: TextInputType.text,
                        ),
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
                              backgroundColor:Colors.green[800],
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
                              backgroundColor:Colors.green[800],
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
                              backgroundColor:Colors.green[800],
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
                              backgroundColor:Colors.green[800],
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
                              backgroundColor:Colors.green[800],
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
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 0.0),
                    child: DataTable(
                      dataTextStyle: TextStyle(
                        fontSize: 16,
                        color: Colors.black,
                      ),
                      headingRowHeight: (8),
                      border: TableBorder(
                        horizontalInside:
                            BorderSide(color: Colors.white, width: 1),
                      ),
                      headingRowColor: WidgetStateColor.resolveWith(
                          (states) => Colors.red.shade700),
                      dataRowColor: WidgetStateColor.resolveWith(
                          (states) => Colors.lime.shade200),
                      dataRowMinHeight: 30,
                      columns: <DataColumn>[
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            '',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: <DataRow>[
                        DataRow(
                          cells: <DataCell>[
                            DataCell(
                              Text(
                                'Average Score:',
                              ),
                            ),
                            DataCell(
                              Center(
                                child: Text(
                                  _count.toString() == "0"
                                      ? "0"
                                      : (_total / _count).toStringAsFixed(2),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.fromLTRB(10, 0.0, 12.0, 0.0),
                    child: Text(
                        '\n\nTo add another paddock use the + New Paddock button, enter the new paddock name above and then enter your scores for that paddock.'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(70, 10, 100, 20),
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.add_sharp),
                        label: Text(
                          "New Paddock",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          validateInput();
                        }),
                  ),
                  Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                      child: Text(
                          'Select the season for when you intend to renovate the pasture:')),
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
                    padding: EdgeInsets.fromLTRB(10, 0.0, 12.0, 0.0),
                    child: Text(
                        '\n\nUse the email button to see the recommendations and to save the results for all of the paddocks scored.'),
                  ),
                  Container(
                    margin: EdgeInsets.fromLTRB(70, 10, 100, 20),
                    child: ElevatedButton.icon(
                        icon: Icon(Icons.email_sharp),
                        label: Text(
                          "Email",
                          style: TextStyle(
                              fontSize: 13, fontWeight: FontWeight.bold),
                        ),
                        onPressed: () {
                          if (validateInput()) {
                            sendMessage();
                          }
                        }),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }

  void sendMessage() {
    var _emailText = widget.emailController;
    var _farmname = widget.farmname;
    var _assessor = widget.assessor;
    var _date = widget.datetoday;

    var inputMessage = 'Farm:  '
        '$_farmname ,\n\n'
        'Assessor:  '
        '$_assessor ,\n\n'
        'Date:  '
        '   $_date,\n\n=================================\n\n';

    paddocksList.forEach((element) {
      inputMessage += '\nPaddock: ${element.name},\n'
          '\nAverage Score:  '
          '   ${element.avgScore.toStringAsFixed(1)}\n\n'
          '\nRecommended Action:   '
          '\n----------------------------------------\n'
          ' ${element.recommendation}\n\n'
          '\nRecommended Product:   '
          '\n-----------------------------------------\n'
          '${element.product}\n\n'
          '\n=================================\n';
    });

    String inputEmail;

    Email email;
    setState(() {
      inputEmail = _emailText;

      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          body: inputMessage,
          subject: 'Pasture Renovation Recommendation',
          recipients: [inputEmail],
          cc: [''],
        );
        send(email);
      }
    });
    debugPrint('email - >   message -> $inputMessage');
  }

  void send(Email email) async {
    paddocksList = [];
    await FlutterEmailSender.send(email);
  }
}
