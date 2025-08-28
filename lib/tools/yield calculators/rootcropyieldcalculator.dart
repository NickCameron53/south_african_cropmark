import 'package:flutter/material.dart';
import '../../../../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class rootcropyieldcalculator extends StatefulWidget {
  rootcropyieldcalculator({
    Key? key,
    required this.region,
    required this.species,
    required this.samplemethod,
  }) : super(key: key);
  final String region;
  final String species;
  final String samplemethod;

  set $rowlgth(double $rowlgth) {}

  @override
  State<StatefulWidget> createState() {
    return rootcropyieldcalculatorState();
  }
}

class rootcropyieldcalculatorState extends State<rootcropyieldcalculator> {
  final paddock = new TextEditingController()..text = '';
  final bulbdm = new TextEditingController()..text = '';
  final leafdm = new TextEditingController()..text = '12';
  final rowwth = new TextEditingController()..text = '0.5';
  final rowlgth = new TextEditingController()..text = '4.0';
  final TextEditingController emailController = new TextEditingController();

  // enter controllers for sample no. & leaffw and bulbfw data entry
  TextEditingController _leafDmController = TextEditingController()
    ..text = '12'; // leaf dm
  TextEditingController _bulbDmController = TextEditingController()
    ..text = '17'; // leaf dm
  TextEditingController _sampleArea = TextEditingController()
    ..text = '1.0'; // sample area method 2
  final List<TextEditingController> _controllers = []; // sample number leaf
  final List<double> _leaffreshWeights = [];
  final List<TextEditingController> _controllersb = []; // sample number bulb
  final List<double> _bulbfreshWeights = [];
  double totalLeafDm = 0.0;
  double totalLeafFw = 0.0;
  double totalBulbDm = 0.0;
  double totalBulbFw = 0.0;
  double totalPlantDm = 0.0;
  double areamethod1 = 0.0;

  String cultivar = '';

  int sample = 0;

  get species => null;
  final _emailFormKey = GlobalKey<FormState>();

  void addSample() {
    setState(() {
      _controllers.add(TextEditingController(text: ''));
      _leaffreshWeights.add(0.0);
      _controllersb.add(TextEditingController(text: ''));
      _bulbfreshWeights.add(0.0);
    });
    updateDataTable();
  }

  @override
  void initState() {
    super.initState();
    if (widget.species == 'Fodder Beet') {
      cultivar = 'Geronimo';
    } else if (widget.species == 'Swede') {
      cultivar = 'Saddleback';
    }

    if (cultivar == 'Geronimo') {
      bulbdm.text = '16';
    }
    if (cultivar == 'Saddleback') {
      bulbdm.text = '10';
    }
    addSample();
  }

  void updateDataTable() {
    setState(() {
      for (int i = 0; i < _controllers.length; i++) {
        _leaffreshWeights[i] = double.parse(
            _controllers[i].text == '' ? "0" : _controllers[i].text);
      }
      for (int i = 0; i < _controllersb.length; i++) {
        _bulbfreshWeights[i] = double.parse(
            _controllersb[i].text == '' ? "0" : _controllersb[i].text);
      }
    });
  }

  void removeLastSample() {
    setState(() {
      _controllers.removeLast();
      _leaffreshWeights.removeLast();
      _controllersb.removeLast();
      _bulbfreshWeights.removeLast();
    });
    updateDataTable();
  }

  Widget build(BuildContext context) {
    if (rowlgth.text.isNotEmpty && rowwth.text.isNotEmpty) {
      // only do calculation when rowlgth and rowwth are not empty
      areamethod1 = double.parse(rowlgth.text) * double.parse(rowwth.text);
    }

    if (widget.samplemethod == "method 1") {
      _sampleArea.text = areamethod1.toString();
    }

    if (_controllers.length > 0) {
      if (_sampleArea.text.isNotEmpty) {
        // only do calculation when sample area is not empty
        totalLeafFw = (_leaffreshWeights.reduce((a, b) => a + b) /
                (double.parse(_sampleArea.text) * _controllers.length)) *
            10000; // this is total leaf kg fw/ha
        if (_leafDmController.text.isNotEmpty &&
            _bulbDmController.text.isNotEmpty) {
          // only do calculation when leafdm and bulbdm are not empty
          totalLeafDm = (double.parse(_leafDmController.text) / 100) *
              totalLeafFw; // this is total leaf kg dm/ha

          totalBulbFw = (_bulbfreshWeights.reduce((a, b) => a + b) /
                  (double.parse(_sampleArea.text) * _controllersb.length)) *
              10000; // this is total bulb kg fw/ha
          totalBulbDm = (double.parse(_bulbDmController.text) / 100) *
              totalBulbFw; // this is total bulb kg dm/ha
          totalPlantDm =
              totalLeafDm + totalBulbDm; // this is total crop Kg dm/ha
        }
      }
    }

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
                "Yield Assessment",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.right,
              ),
              Text(
                "Scroll down to see all results",
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
      ),
      body: Form(
        key: _emailFormKey,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    // ===============  code for swedes =====================================

                    if (widget.species == 'Swede') ...[
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10, 0),
                        child: Text(
                          "Bulb and leaf dry matter",
                          style: TextStyle(
                            color: Colors.green.shade800,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10, 0),
                        child: Text(
                            "As a guide for swedes:"
                            "\n\nUse 11 to 12% Leaf DM in early winter and "
                            "\n 9 to 10% for bulbs if not physically measured.",
                            style: TextStyle(
                              fontSize: 13,
                            )),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 260,
                          child: Text(
                            'Cultivar being assessed',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 10, 0),
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: cultivar,
                              onChanged: (String? newValue) {
                                setState(() {
                                  cultivar = newValue ?? '';
                                });
                              },
                              items: <String>[
                                'Saddleback',

                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],

                    if (widget.species == 'Fodder Beet') ...[
                      SizedBox(height: 20),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10, 0),
                        child: Text(
                          "Bulb and leaf dry matter",
                          style: TextStyle(
                            color: Colors.green.shade800,
                            fontSize: 15,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.fromLTRB(10.0, 0.0, 10, 0),
                        child: Text(
                            "As a guide look in the fodder beet section for particular cultivar differences."
                            "\n\nUse 12% Leaf DM in early winter and "
                            "\n10% in mid autumn if not physically measured.",
                            style: TextStyle(
                              fontSize: 13,
                            )),
                      ),
                      SizedBox(height: 20),
                      Center(
                        child: Container(
                          width: 260,
                          child: Text(
                            'Cultivar being assessed',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          padding: EdgeInsets.fromLTRB(20.0, 0.0, 10, 0),
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: DropdownButtonHideUnderline(
                            child: DropdownButton<String>(
                              dropdownColor: Colors.white,
                              value: cultivar,
                              onChanged: (String? newValue) {
                                setState(() {
                                  cultivar = newValue ?? '';
                                });
                              },
                              items: <String>[
                                'Geronimo',
                                'Kokomo',
                                'Dynamo',

                              ].map<DropdownMenuItem<String>>((String value) {
                                return DropdownMenuItem<String>(
                                  value: value,
                                  child: Text(
                                    value,
                                    style: TextStyle(
                                        color: Colors.green[800],
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                );
                              }).toList(),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 30),
                    ],

                    Center(
                      child: Container(
                        width: 260,
                        child: Text(
                          'Paddock name',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
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
                    ),

                    SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 260,
                        child: Text(
                          'Bulb Dry Matter %',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                          cursorColor: Colors.teal,
                          controller: _bulbDmController,
                          onChanged: (val) {
                            setState(() {
                              _bulbDmController.text = val;
                              _bulbDmController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: _bulbDmController.text.length),
                              );
                            });
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                        ),
                      ),
                    ),

                    SizedBox(height: 30),
                    Center(
                      child: Container(
                        width: 260,
                        child: Text(
                          'Leaf Dry Matter %',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 5),
                    Center(
                      child: Container(
                        width: 260,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          color: Colors.white,
                          border: Border.all(color: Colors.black, width: 1.0),
                        ),
                        child: TextFormField(
                          decoration: InputDecoration(
                            contentPadding:
                                EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                            border: InputBorder.none,
                          ),
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.green.shade900,
                          ),
                          cursorColor: Colors.teal,
                          controller: _leafDmController,
                          onChanged: (val) {
                            setState(() {
                              _leafDmController.text = val;
                              _leafDmController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(
                                    offset: _leafDmController.text.length),
                              );
                            });
                          },
                          keyboardType: const TextInputType.numberWithOptions(
                              signed: true, decimal: true),
                        ),
                      ),
                    ),

                    //============= change here to allow method 1 sampling

                    if (widget.samplemethod == "method 1") ...[
                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 260,
                          child: Text(
                            'Enter the row spacing (metres)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ),
                            cursorColor: Colors.teal,
                            controller: rowwth,
                            onChanged: (val) {
                              setState(() {
                                rowwth.text = val;
                                rowwth.selection = TextSelection.fromPosition(
                                  TextPosition(offset: rowwth.text.length),
                                );
                              });
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                          ),
                        ),
                      ),

                      // enter row sample length

                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 260,
                          child: Text(
                            'Enter the row sample length (metres)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ),
                            cursorColor: Colors.teal,
                            controller: rowlgth,
                            onChanged: (val) {
                              setState(() {
                                rowlgth.text = val;
                                rowlgth.selection = TextSelection.fromPosition(
                                  TextPosition(offset: rowlgth.text.length),
                                );
                              });
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                          ),
                        ),
                      ),
                    ],
                    //============= change here to allow provide method 2 sampling where sample area is provided
                    //================ rather than row length and row width
                    if (widget.samplemethod == "method 2") ...[
                      SizedBox(height: 30),
                      Center(
                        child: Container(
                          width: 260,
                          child: Text(
                            'Enter the sample area (sq. metres)',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(height: 5),
                      Center(
                        child: Container(
                          width: 260,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10.0),
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1.0),
                          ),
                          child: TextFormField(
                            decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                              border: InputBorder.none,
                            ),
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ),
                            cursorColor: Colors.teal,
                            controller: _sampleArea,
                            onChanged: (val) {
                              setState(() {
                                _sampleArea.text = val;
                                _sampleArea.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(offset: _sampleArea.text.length),
                                );
                              });
                            },
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                          ),
                        ),
                      ),
                    ],

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 10.0),
                      child: Text(
                        "After you have entered the bulb DM%, Leaf DM%, row spacing and row sample length ... then lift the bulbs from the sample areas in the paddock using the entered row sample length.",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),

                    SizedBox(height: 20),
                    Container(
                      padding: EdgeInsets.fromLTRB(10.0, 0.0, 10, 0),
                      child: RichText(
                        text: TextSpan(
                          children: <TextSpan>[
                            TextSpan(
                              text: widget.species,
                              style: TextStyle(
                                color: Colors.green.shade800,
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            TextSpan(
                              text: " sample weights",
                              style: TextStyle(
                                color: Colors.green.shade800,
                                fontSize: 15,
                                fontWeight:
                                    FontWeight.bold, // Adjust weight if desired
                              ),
                            ),
                          ],
                          style: TextStyle(
                            // Apply common style here (optional)
                            fontSize: 15,
                          ),
                        ),
                      ),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 10.0, 12.0, 10.0),
                      child: Text(
                        "Separate the tops and clean the bulbs of dirt before weighing. Enter the weights in kgs below.",
                        style: TextStyle(
                          fontSize: 13,
                        ),
                      ),
                    ),

                    DataTable(
                      columns: [
                        DataColumn(
                          label: Text(
                            'Sample ',
                            style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Leaf ',
                            style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                        DataColumn(
                          label: Text(
                            'Bulb ',
                            style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 14,
                                fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                      rows: [
                        for (int i = 0; i < _controllers.length; i++)
                          DataRow(cells: [
                            DataCell(Text(
                              'Sample ${i + 1}',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                            )),
                            DataCell(TextFormField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              controller: _controllers[i],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              onChanged: (value) => updateDataTable(),
                            )),
                            DataCell(TextFormField(
                              style:
                                  TextStyle(color: Colors.black, fontSize: 14),
                              controller: _controllersb[i],
                              keyboardType:
                                  const TextInputType.numberWithOptions(
                                      signed: true, decimal: true),
                              onChanged: (value) => updateDataTable(),
                            )),
                          ]),
                      ],
                    ),

                    SizedBox(height: 16),
                    // Add some spacing between the two tables
                    Center(
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 20.0, 0, 2.0),
                              child: FloatingActionButton(
                                onPressed: addSample,
                                backgroundColor: Colors.green[800],
                                foregroundColor: Colors.white,
                                child: Text(
                                  '  Add a\nsample',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              width: 200,
                              padding: EdgeInsets.fromLTRB(30.0, 0.0, 0, 0),
                              child: Text(
                                'Add or remove samples',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                            Container(
                              padding: EdgeInsets.fromLTRB(0.0, 20.0, 20, 2.0),
                              child: FloatingActionButton(
                                onPressed: removeLastSample,
                                backgroundColor: Colors.green[800],
                                foregroundColor: Colors.white,
                                child: Text(
                                  ' Delete\nsample',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 10,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),

                    SizedBox(height: 20),

                    //============ table of outputs ====================
                    if (_controllers.isNotEmpty && _leaffreshWeights.isNotEmpty)
                      Padding(
                        padding: EdgeInsets.all(8),
                        child: Container(
                          decoration: BoxDecoration(
                            color: Colors.green.shade600,
                            // Optional background color
                            borderRadius: BorderRadius.circular(10),
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.green.shade800,
                              ),
                            ),
                          ),
                          child: Table(
                            columnWidths: {
                              0: FractionColumnWidth(0.75),
                              1: FractionColumnWidth(0.25),
                            },
                            children: [
                              // top table row
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
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minHeight: 50.0),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 0, 10),
                                      child: Text(
                                        'Number of Samples :',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 10),
                                    child: Text(
                                      '${_controllers.length}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),

                              // second row
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.green.shade900,
                                    width: 0.4,
                                  )),
                                ),
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minHeight: 50.0),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 0, 10),
                                      child: Text(
                                        'Total Samples Leaf Weight (kgs):',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 10),
                                    child: Text(
                                      '${_leaffreshWeights.reduce((a, b) => a + b).toStringAsFixed(1)}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),

                              // 3rd row
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.green.shade900,
                                    width: 0.4,
                                  )),
                                ),
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minHeight: 50.0),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 0, 10),
                                      child: Text(
                                        'Total Samples Bulb Weight (kgs):',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 10),
                                    child: Text(
                                      '${_bulbfreshWeights.reduce((a, b) => a + b).toStringAsFixed(1)}',
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),

                              // 4th row
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.green.shade900,
                                    width: 0.4,
                                  )),
                                ),
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minHeight: 50.0),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 0, 10),
                                      child: Text(
                                        'Total  Leaf Weight (kgs dm/ha):',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 10),
                                    child: Text(
                                      totalLeafDm.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),

                              // 5th row
                              TableRow(
                                decoration: BoxDecoration(
                                  color: Colors.green.shade600,
                                  border: Border(
                                      bottom: BorderSide(
                                    color: Colors.green.shade900,
                                    width: 0.4,
                                  )),
                                ),
                                children: [
                                  ConstrainedBox(
                                    constraints:
                                        BoxConstraints(minHeight: 50.0),
                                    child: Padding(
                                      padding: const EdgeInsets.fromLTRB(
                                          20.0, 10.0, 0, 10),
                                      child: Text(
                                        'Total  Bulb Weight (kgs dm/ha):',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 10),
                                    child: Text(
                                      totalBulbDm.toStringAsFixed(0),
                                      style: TextStyle(
                                          color: Colors.white, fontSize: 12),
                                    ),
                                  ),
                                ],
                              ),
                              // last table row
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
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 0, 10),
                                    child: Text(
                                      'Total Crop Yield (kg DM/ha):',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        10.0, 10.0, 0, 10),
                                    child: Text(
                                      totalPlantDm.toStringAsFixed(0),
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 12,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0.0, 12.0, 10.0),
                      child: Text(
                          '\n\nOnce all of the samples have been weighed you can send the results by email.'),
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(30.0, 40, 0, 0),
                      child: Text(
                        'Email address to send the result: ',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 15,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.fromLTRB(30, 0, 40, 15),
                      child: TextFormField(
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            enabledBorder: OutlineInputBorder(
                              borderSide:
                                  BorderSide(color: Colors.grey, width: 1.0),
                            ),
                            fillColor: Colors.white,
                            filled: true,
                            labelText: "example@example.com",
                            labelStyle: TextStyle(color: Colors.grey),
                            border: OutlineInputBorder(
                                borderSide: BorderSide(
                              color: Colors.black,
                              width: 2.0,
                            ))),
                        style: TextStyle(color: Colors.black),
                        controller: emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "please Enter your email address (required)";
                          }
                          if (!RegExp("^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                              .hasMatch(value)) {
                            return 'Please enter a valid Email';
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: 20),

                    Container(
                      height: 40,
                      margin: EdgeInsets.fromLTRB(60, 10, 60, 20),
                      child: ElevatedButton.icon(
                        icon: Icon(Icons.email_sharp, color: Colors.black),
                        // Set icon color to black
                        label: Text(
                          "Email results",
                          style: TextStyle(
                              fontSize: 13,
                              color: Colors.black), // Set text color to black
                        ),
                        onPressed: () {
                          if (_emailFormKey.currentState!.validate()) {
                            sendMessage();
                          }
                          sendMessage();
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lime,
                          // Set background color to lime
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                                30.0), // Set rounded corners
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  void sendMessage() {
    var _emailText = emailController.text;
    var _paddock = paddock.text;
    var inputMessage = 'Total Bulb Dry Weight: '
        '${totalBulbDm.toStringAsFixed(0)} kg/ha\n\n'
        'Total Leaf Dry Weight: '
        '${totalLeafDm.toStringAsFixed(0)} kg/ha\n\n'
        'Total Crop Dry Weight: '
        '${totalPlantDm.toStringAsFixed(0)} kg/ha\n\n';

    String inputEmail;

    Email email;
    setState(() {
      inputEmail = _emailText;

      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          subject: 'Yield for $cultivar in paddock: $_paddock',
          recipients: [inputEmail],
          cc: [''],
          body: inputMessage,
        );
        send(email);
      }
    });
    debugPrint('email - >   message -> $inputMessage');
  }

  void send(Email email) async {
    await FlutterEmailSender.send(email);
  }
}
