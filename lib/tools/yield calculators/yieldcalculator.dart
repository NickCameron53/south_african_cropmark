import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class yieldcalculator extends StatefulWidget {
  yieldcalculator({
    Key? key,
    required this.region,
    required this.species,
  }) : super(key: key);
  final String region;
  final String species;

  @override
  State<StatefulWidget> createState() {
    return _yieldcalculatorState();
  }
}

class _yieldcalculatorState extends State<yieldcalculator> {
  final paddock = new TextEditingController()..text = '';
  final TextEditingController emailController = new TextEditingController();
  TextEditingController _plantDmController = TextEditingController()
    ..text = '14';
  TextEditingController _sampleAreaController = TextEditingController()
    ..text = '1.0';
  final List<TextEditingController> _controllers = [];
  final List<double> _freshWeights = [];
  String cultivar = '';
  double totalPlantDm = 0.0;
  double totalPlantFw = 0.0;

  void updateDataTable() {
    setState(() {
      for (int i = 0; i < _controllers.length; i++) {
        _freshWeights[i] = double.parse(
            _controllers[i].text == '' ? "0" : _controllers[i].text);
      }
    });
  }

  void addSample() {
    setState(() {
      _controllers.add(TextEditingController(text: ''));
      _freshWeights.add(0.0);
    });
    updateDataTable();
  }

  void removeLastSample() {
    setState(() {
      _controllers.removeLast();
      _freshWeights.removeLast();
    });
    updateDataTable();
  }

  final _emailFormKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    if (widget.species == 'Kale') {
      cultivar = 'Kea';
      _plantDmController.text = '14'; // Default for Kale
    } else if (widget.species == 'Turnip') {
      cultivar = 'Marco';
      _plantDmController.text = '14'; // Default for Turnip
    } else if (widget.species == 'Forage Rape') {
      cultivar = 'Rifleman';
      _plantDmController.text = '14'; // Default for Forage Rape
    } else if (widget.species == 'Fodder Beet') {
      cultivar = 'Geronimo';
      _plantDmController.text = '14'; // Default for Fodder Beet
    } else if (widget.species == 'Swede') {
      cultivar = 'Saddleback';
      _plantDmController.text = '10'; // Set to 10% for Swede
    }
    addSample();
  }

  Widget build(BuildContext context) {
    if (_controllers.length > 0) {
      if (_plantDmController.text.isNotEmpty &&
          _sampleAreaController.text.isNotEmpty) {
        // only do calculation if plantdm and samplearea are not empty
        totalPlantDm = (double.parse(_plantDmController.text) / 100) *
            (_freshWeights.reduce((a, b) => a + b) /
                (double.parse(_sampleAreaController.text) *
                    _controllers.length)) *
            10000;
        totalPlantFw = (_freshWeights.reduce((a, b) => a + b) /
                (double.parse(_sampleAreaController.text) *
                    _controllers.length)) *
            10000;
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
                "Paddock Yield Calculator",
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
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 40),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 10, 40),
                    child: Text(
                        "\nCut and weigh the forage using a quadrat square to mark out the selected sample area.",
                        style: TextStyle(
                          fontSize: 13,
                        )),
                  ),

                  if (widget.species == 'Forage Rape') ...[
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
                              'Rifleman',
                              'Pillar',

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
                  if (widget.species == 'Swede') ...[
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
                  if (widget.species == 'Turnip') ...[
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
                              'Marco',

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
                  if (widget.species == 'Kale') ...[
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
                              'Kea',
                              'Coleor',

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

//===================  end of cultivar selection =============================================

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
                        'Plant Dry Matter %',
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
                        controller: _plantDmController,
                        onChanged: (val) {
                          setState(() {
                            _plantDmController.text = val;
                            _plantDmController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: _plantDmController.text.length),
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
                        'Enter Sample area (m²)',
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
                        controller: _sampleAreaController,
                        onChanged: (val) {
                          setState(() {
                            _sampleAreaController.text = val;
                            _sampleAreaController.selection =
                                TextSelection.fromPosition(
                              TextPosition(
                                  offset: _sampleAreaController.text.length),
                            );
                          });
                        },
                        keyboardType: const TextInputType.numberWithOptions(
                            signed: true, decimal: true),
                      ),
                    ),
                  ),

                  Container(
                    padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 10.0),
                    child: Text(
                      "After you have entered the plant DM%, and sample area then enter the weights in kgs below.",
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
                          'Fresh Weight (kgs)',
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
                            style: TextStyle(color: Colors.black, fontSize: 14),
                          )),
                          DataCell(TextFormField(
                            style: TextStyle(color: Colors.black, fontSize: 14),
                            controller: _controllers[i],
                            keyboardType: const TextInputType.numberWithOptions(
                                signed: true, decimal: true),
                            onChanged: (value) => updateDataTable(),
                          )),
                        ]),
                    ],
                  ),

                  SizedBox(height: 16),
                  // Add some spacing between the two tables

                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(5.0, 20.0, 0, 2.0),
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
                          padding: EdgeInsets.fromLTRB(25.0, 0.0, 0, 0),
                          child: Text(
                            'Add or remove samples',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.fromLTRB(0.0, 20.0, 0, 2.0),
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

                  SizedBox(height: 20),

                  //============ table of outputs ====================
                  if (_controllers.isNotEmpty && _freshWeights.isNotEmpty)
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
                                  constraints: BoxConstraints(minHeight: 50.0),
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
                                  constraints: BoxConstraints(minHeight: 50.0),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 0, 10),
                                    child: Text(
                                      'Total Samples Fresh Weight (kgs):',
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
                                    '${_freshWeights.reduce((a, b) => a + b)}',
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
                                  constraints: BoxConstraints(minHeight: 50.0),
                                  child: Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                        20.0, 10.0, 0, 10),
                                    child: Text(
                                      'Total Crop Fresh Wt Yield (kg/ha):',
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
                                    totalPlantFw.toStringAsFixed(0),
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
                    padding: EdgeInsets.fromLTRB(0.0, 40, 0, 0),
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
    var inputMessage = 'Total Fresh Weight:  '
        '${totalPlantFw.toStringAsFixed(0)} kg FW/ha\n\n'
        'Total Yield: '
        '${totalPlantDm.toStringAsFixed(0)} kg DM/ha\n\n';

    String inputEmail;

    Email email;
    setState(() {
      inputEmail = _emailText;

      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          body: inputMessage,
          subject: 'Yield for $cultivar in paddock: $_paddock',
          recipients: [inputEmail],
          cc: [''],
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
