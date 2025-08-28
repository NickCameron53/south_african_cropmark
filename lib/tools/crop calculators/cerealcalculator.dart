import 'package:flutter/material.dart';
import '../../../main.dart';

class cerealcalculator extends StatefulWidget {
  cerealcalculator({
    Key? key,
    required this.region,
    required this.species,
    required this.pop,
    required this.tgw,
    required this.germ,
    required this.efe,
    required this.area,
  }) : super(key: key);
  final String region;
  final String species;
  final String pop;
  final String tgw;
  final String germ;
  final String efe;
  final String area;

  @override
  State<StatefulWidget> createState() {
    return _cerealcalculatorState();
  }
}

class _cerealcalculatorState extends State<cerealcalculator> {
  late var pop = TextEditingController(text: widget.pop);
  late var tgw = TextEditingController(text: widget.tgw);
  late var germ = TextEditingController(text: widget.germ);
  late var efe = TextEditingController(text: widget.efe);
  late var area = TextEditingController(text: widget.area);

  double seedrate = 0.0;
  double seedrequired = 0.0;

  void _calculaterate() {
    setState(() {
      seedrate = double.parse(pop.text) /
          1000 *
          10000 *
          double.parse(tgw.text) /
          1000 *
          100 /
          double.parse(germ.text) *
          100 /
          double.parse(efe.text);
      seedrequired = seedrate * double.parse(area.text);
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
                Text(
                  widget.species,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Sowing rate calculator",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "Scroll down to see notes on use",
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
                    'TGW (gms/1000 seeds):',
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
                      controller: tgw,
                      onChanged: (val) {
                        setState(() {
                          tgw.text = val;
                          tgw.selection = TextSelection.fromPosition(
                            TextPosition(offset: tgw.text.length),
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
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Target Plant Population (pl/m²):',
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
                      controller: pop,
                      onChanged: (val) {
                        setState(() {
                          pop.text = val;
                          pop.selection = TextSelection.fromPosition(
                            TextPosition(offset: pop.text.length),
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
                    'Expected Field Emergence (%):',
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
                      controller: efe,
                      onChanged: (val) {
                        setState(() {
                          efe.text = val;
                          efe.selection = TextSelection.fromPosition(
                            TextPosition(offset: efe.text.length),
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

            Container(
              padding: EdgeInsets.fromLTRB(10, 0.0, 12.0, 2.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "\n\nNotes on using the calculator",
                    style: TextStyle(
                        color: Colors.green.shade800,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                      "\nThousand Grain Weight should be on the bag or on request if using certified seed."
                      "\nIf you need to calculate it yourself make sure the seed sample is representative of the whole line."
                      "\nIf you have scales that weigh to 0.1gm accuracy, count 200 seeds and multiply their weight by 5."
                      "\nIf not then count and weigh 1000 seeds.\n"
                      "\nGermination % should be on the bag label or available on request.\n",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      )),
                  Text("\n\nExamples of emergence could be : ",
                      style: TextStyle(
                        color: Colors.green.shade800,
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      )),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'April early sown',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '95%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    '(warm and moist)',
                    style: TextStyle(fontSize: 10),
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'April  late sown',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '90%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'May early sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '90%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'May late sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '85%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'June early sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '80%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'June late sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '75%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'July early sown',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '70%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Text(
                    '(assumes may be poorer quality seedbed, sown too deep, cold soil conditions)',
                    style: TextStyle(fontSize: 10),
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'July late sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '70%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'August early sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '80%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'August late sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '85%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'September early sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '90%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          'September late sown:',
                          style: TextStyle(fontSize: 14),
                        ),
                      ),
                      Text(
                        '90%',
                        style: TextStyle(fontSize: 14),
                      ),
                    ],
                  ),
                  Divider(
                    color: Colors.green,
                    thickness: 0.5,
                    height: 20,
                    indent: 5,
                    endIndent: 5,
                  ),
                ],
              ),
            ),

            // target plant populations for barley
            if (widget.species == "Barley") ...[
              Container(
                padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Target Plant Population is expressed as plants per square metre and will vary for times of sowing and seed bed preparation.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                    Text("\nAs a guide target populations could be:",
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Early to mid April:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '150 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'Mid April and May:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '175 - 200 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'June:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '200 - 225 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'July:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '225 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'August:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '225 - 250 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'September:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '250 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'October:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '250 - 300 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ],
                ),
              ),
            ],
            // target plant populations for wheat
            if (widget.species == "Wheat") ...[
              Container(
                padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 2.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                        "Target Plant Population is expressed as plants per square metre and will vary for times of sowing and seed bed preparation.",
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                        )),
                    Text("\nAs a guide target populations could be:",
                        style: TextStyle(
                          color: Colors.green.shade800,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        )),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'April:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '100 - 150 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'May:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '125 - 150 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'June:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '150 - 200 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'July:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '175 - 200 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'August:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '200 - 250 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'September:',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                        Text(
                          '250 - 300 plants/m²',
                          style: TextStyle(fontSize: 14),
                        ),
                      ],
                    ),
                    Divider(
                      color: Colors.green,
                      thickness: 0.5,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                  ],
                ),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
