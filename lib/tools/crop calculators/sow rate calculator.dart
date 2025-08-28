import 'package:flutter/material.dart';
import '../../../main.dart';

class sowratecalculator extends StatefulWidget {
  sowratecalculator({
    Key? key,
    required this.region,
    required this.species,
    required this.sowrate,
    required this.germ,
    required this.area,
  }) : super(key: key);
  final String region;
  final String species;
  final String sowrate;
  final String germ;
  final String area;

  @override
  State<StatefulWidget> createState() {
    return _sowratecalculatorState();
  }
}

class _sowratecalculatorState extends State<sowratecalculator> {
  late var sowrate = TextEditingController(text: widget.sowrate);
  late var germ = TextEditingController(text: widget.germ);
  late var area = TextEditingController(text: widget.area);

  double seedrate = 0.0;
  double seedrequired = 0.0;

  void _calculaterate() {
    setState(() {
      seedrate = double.parse(sowrate.text) / double.parse(germ.text) * 100 ;
      seedrequired = (double.parse(area.text) * seedrate);
    });
  }

  @override
  void initState() {
    super.initState();
    _calculaterate();
  }

  get species => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
            title: Column(
              children: [
                Text( widget.species,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Sowing rate calculator",
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
      body: Center(
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Area Planted (ha):',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                            (35 - 8) / 2), // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: area,
                      onChanged: (val) {
                        setState(() {
                          area.text = val;
                          area.selection = TextSelection.fromPosition(
                            TextPosition(offset: area.text.length),
                          );
                          _calculaterate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Sow Rate (kg/ha) :',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                            (35 - 8) / 2), // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: sowrate,
                      onChanged: (val) {
                        setState(() {
                          sowrate.text = val;
                          sowrate.selection = TextSelection.fromPosition(
                            TextPosition(offset: sowrate.text.length),
                          );
                          _calculaterate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Germination (%):',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                            (35 - 8) / 2), // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: germ,
                      onChanged: (val) {
                        setState(() {
                          germ.text = val;
                          germ.selection = TextSelection.fromPosition(
                            TextPosition(offset: germ.text.length),
                          );
                          _calculaterate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),

            SizedBox(height: 40),
//=============== table output here ======================================
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade600, // Optional background color
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.green.shade800,
                    ),
                  ),
                ),
                child: Table(
                  columnWidths: {
                    0: FractionColumnWidth(0.70),
                    1: FractionColumnWidth(0.3),
                  },
                  children: [
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        border: Border(
                            bottom: BorderSide(
                              color: Colors.green.shade900,
                              width: 0.4,
                            )),
                        borderRadius: BorderRadius.only(
                          //  setting the border radius circular for the top row
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                          child: Text(
                            'Seeding Rate (kg/ha:)',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            seedrate.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.only(
                          //  setting the border radius circular for the bottom row
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                          child: Text(
                            'Total Seed Required (kgs):',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            seedrequired.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),


          ],
        ),
      ),
    );
  }
}