import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class chicoryareacalculator extends StatefulWidget {
  chicoryareacalculator({
    Key? key,
    required this.region,
    required this.species,
    required this.sownum,
    required this.expyld,
    required this.dailyallocation,
  }) : super(key: key);
  final String region;
  final String species;
  final String sownum;
  final String expyld;
  final String dailyallocation;

  @override
  State<StatefulWidget> createState() {
    return _chicoryareacalculatorState();
  }
}

class _chicoryareacalculatorState extends State<chicoryareacalculator> {
  late var sowrate = TextEditingController(text: widget.sownum);
  late var expectedyield = TextEditingController(text: widget.expyld);
  final stocknum = new TextEditingController()..text = '300';
  final dailyallocation = TextEditingController();
  final daysrequiredfor = new TextEditingController()..text = '60';
  final wastage = new TextEditingController()..text = '20';
  final area = new TextEditingController()..text = '10';
  final TextEditingController emailController = new TextEditingController();
  final Map<String, double> _dailyAllocationValues = {
    'Cow': 4.0,
    '3 month calf': 2.7,
    '6 month calf': 4.1,
    '9 month calf': 5.5,
  };

  String stockclass = 'Cow';
  double stockrequirementperday = 0.0;
  double totalrequirementperday = 0.0;
  double croptonnagerequired = 0.0;
  double arearequired = 0.0;
  double seedrequired = 0.0;
  double fodbeetseed = 0.0;

  void _calculate() {
    setState(() {
      var stockrequirementperday =
          double.parse(stocknum.text) * _dailyAllocationValues[stockclass]!;
      totalrequirementperday =
          (stockrequirementperday * (double.parse(wastage.text) / 100)) +
              stockrequirementperday;
      croptonnagerequired =
          totalrequirementperday * double.parse(daysrequiredfor.text);
      arearequired = croptonnagerequired / double.parse(expectedyield.text);
      seedrequired = arearequired * double.parse(sowrate.text);
      fodbeetseed = seedrequired / 100000;
      dailyallocation.text = _dailyAllocationValues[stockclass]!.toString();
    });
  }

  @override
  void initState() {
    super.initState();
    _calculate();
  }

  get species => null;
  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    _calculate(); // added this to perform the dailyallocation calculation
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
                  "Crop Planning Calculator",
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
                            )),
                  );
                },
              ),
            ]),
      ),
      body: Form(
        key: _emailFormKey,
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            const SizedBox(height: 10),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 0, 30, 0),
              width: 260,
              child: Row( // Wrap the Text widget with a Row
                mainAxisAlignment: MainAxisAlignment.center, // Center the child
                children: [
                  Text(
                    'Select your stock class:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),



            Column( mainAxisSize: MainAxisSize.min,
              children: [
                Container(width: 200.0,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black,
                        width: 1.0),
                  ),


                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: stockclass,
                      onChanged: (String? newValue) {
                        setState(() {
                          stockclass = newValue ?? '';
                        });
                      },
                      items: <String>[
                        'Cow',
                        '3 month calf',
                        '6 month calf',
                        '9 month calf',
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                            value: value, child: Text(value,style: TextStyle(color: Colors.green.shade800,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                        ),);
                      }).toList(),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.green.shade800, size: 28.0),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Stock number:',
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
                  child: TextFormField(
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 10),
                    ),
                    style: TextStyle(fontSize: 14),
                    cursorColor: Colors.teal,
                    controller: stocknum,
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                    onChanged: (val) {
                      setState(() {
                        stocknum.text = val;
                        stocknum.selection = TextSelection.fromPosition(
                          TextPosition(offset: stocknum.text.length),
                        );
                        _calculate();
                      });
                    },
                  ),
                ),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 210,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Daily feed allocation\n (kg DM/head/day)',
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 120,
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    cursorColor: Colors.teal,
                    controller: dailyallocation,
                    onChanged: (val) {
                      setState(() {
                        dailyallocation.text = val;
                        dailyallocation.selection = TextSelection.fromPosition(
                          TextPosition(offset: dailyallocation.text.length),
                        );
                        _calculate();
                      });
                    },
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 210,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Wastage %',
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 120,
                  padding: EdgeInsets.fromLTRB(30.0, 0.0, 30, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    cursorColor: Colors.teal,
                    controller: wastage,
                    onChanged: (val) {
                      setState(() {
                        wastage.text = val;
                        wastage.selection = TextSelection.fromPosition(
                          TextPosition(offset: wastage.text.length),
                        );
                        _calculate();
                      });
                    },
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                  ),
                ),
              ],
            ),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Expected Yield (kg DM/ha)',
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 120,
                  padding: EdgeInsets.fromLTRB(40.0, 0.0, 20, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    cursorColor: Colors.teal,
                    controller: expectedyield,
                    onChanged: (val) {
                      setState(() {
                        expectedyield.text = val;
                        expectedyield.selection = TextSelection.fromPosition(
                          TextPosition(offset: expectedyield.text.length),
                        );
                        _calculate();
                      });
                    },
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                  ),
                ),
              ],
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 220,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Number of days\n the crop is required for:',
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 12,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  width: 100,
                  padding: EdgeInsets.fromLTRB(20.0, 10.0, 17, 0),
                  child: TextFormField(
                    style: TextStyle(fontSize: 14),
                    cursorColor: Colors.teal,
                    controller: daysrequiredfor,
                    onChanged: (val) {
                      setState(() {
                        daysrequiredfor.text = val;
                        daysrequiredfor.selection = TextSelection.fromPosition(
                          TextPosition(offset: daysrequiredfor.text.length),
                        );
                        _calculate();
                      });
                    },
                    keyboardType: const TextInputType.numberWithOptions(
                        signed: true, decimal: true),
                  ),
                ),
              ],
            ),

            if (widget.species == 'Fodder Beet') ...[
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                    child: Text(
                      'Sowing Rate (seed number/ha)',
                      style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 17, 20),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      controller: sowrate,
                      onChanged: (val) {
                        setState(() {
                          sowrate.text = val;
                          sowrate.selection = TextSelection.fromPosition(
                            TextPosition(offset: sowrate.text.length),
                          );
                          _calculate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ],
              ),
            ],

              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 200,
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 0, 0),
                    child: Text(
                      'Sowing Rate (kg/ha)',
                      style: TextStyle(
                          color: Colors.green[800],
                          fontSize: 12,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  Container(
                    width: 120,
                    padding: EdgeInsets.fromLTRB(40.0, 10.0, 18, 20),
                    child: TextFormField(
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      controller: sowrate,
                      onChanged: (val) {
                        setState(() {
                          sowrate.text = val;
                          sowrate.selection = TextSelection.fromPosition(
                            TextPosition(offset: sowrate.text.length),
                          );
                          _calculate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ],
              ),


            //===================================
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
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Total requirement per day:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            totalrequirementperday.toStringAsFixed(0),
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Total crop tonnage required:',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            croptonnagerequired.toStringAsFixed(0),
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Area required (ha):',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            arearequired.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),

                    // last table row
                    if (widget.species != 'Fodder Beet') ...[
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
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Total seed required (kgs):',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              seedrequired.toStringAsFixed(1),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ],
                ),
              ),
            ),
            //===================================
            Container(
              padding: EdgeInsets.fromLTRB(10, 0.0, 12.0, 10.0),
              child: Text(
                  '\n\nYou can send these results by email by filling in a valid email address and then clicking the Email button.'),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(10, 15, 10, 15),
              child: TextFormField(
                style: TextStyle(color: Colors.white),
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
                decoration: InputDecoration(
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 2.0),
                      borderRadius: BorderRadius.circular(15),
                    ),
                    fillColor: Colors.grey,
                    filled: true,
                    labelText: "Enter an email address to send results *",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(
                        borderSide: BorderSide(
                      color: Colors.black,
                      width: 2.0,
                    ))),
              ),
            ),
            Container(
              margin: EdgeInsets.fromLTRB(70, 30, 100, 20),
              child: ElevatedButton.icon(
                  icon: Icon(Icons.email_sharp),
                  label: Text(
                    "Email",
                    style: TextStyle(fontSize: 13, fontWeight: FontWeight.bold),
                  ),
                  onPressed: () {
                    if (_emailFormKey.currentState!.validate()) {
                      sendMessage();
                    }
                  }),
            ),
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    var _emailText = emailController.text;

    var inputMessage = '';

    inputMessage +=
        'Total requirement per day: $totalrequirementperday kgDM/day\n\n';
    inputMessage +=
        'Total crop tonnage required: $croptonnagerequired tonnes\n\n';
    inputMessage += 'Number of hectares required: $arearequired ha\n\n';
    if (widget.species == 'Fodder Beet') {
      inputMessage +=
          'Total seed required: $fodbeetseed Seed Units (100,000 seeds/unit)\n\n';
    }

    if (widget.species != 'Fodder Beet') {
      inputMessage += 'Total seed required: $seedrequired kgs\n\n';
    }

    String inputEmail;

    Email email;
    setState(() {
      inputEmail = _emailText;

      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          subject: 'Crop Allocation Calculations: ',
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
