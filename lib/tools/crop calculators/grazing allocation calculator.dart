import 'package:flutter/material.dart';
import '../../../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';

class cropcalculator extends StatefulWidget {
  cropcalculator({
    Key? key,
    required this.region,
    required this.species,
    required this.sownum,
    required this.expyld,
    required this.exputil,
  }) : super(key: key);
  final String region;
  final String species;
  final String sownum;
  final String expyld;
  final String exputil;

  @override
  State<StatefulWidget> createState() {
    return _cropcalculatorState();
  }
}

class _cropcalculatorState extends State<cropcalculator> {
  late var sowrate = TextEditingController(text: widget.sownum);
  late var expectedyield = TextEditingController(text: widget.expyld);
  late var averageutilisation = TextEditingController(text: widget.exputil);

  final area = new TextEditingController()..text = '10';
  final stocknum = new TextEditingController()..text = '300';
  final dailyallocation = new TextEditingController()..text = '8.0';
  final TextEditingController emailController = new TextEditingController();

  double availablefeed = 0.0;
  double totalavailablefeed = 0.0;
  double totalfeeddemand = 0.0;
  double grazingdaysperha = 0.0;
  double totalgrazingdaysavailable = 0.0;
  double arearequiredperday = 0.0;

  void _calculate() {
    setState(() {
      availablefeed = double.parse(expectedyield.text) *
          double.parse(averageutilisation.text) /
          100000;
      totalavailablefeed = availablefeed * double.parse(area.text);
      totalfeeddemand =
          double.parse(stocknum.text) * double.parse(dailyallocation.text);
      grazingdaysperha = availablefeed * 1000 / totalfeeddemand;
      totalgrazingdaysavailable =
          availablefeed * 1000 * double.parse(area.text) / totalfeeddemand;
      arearequiredperday = totalfeeddemand * 10 / availablefeed;
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
                  "Grazing Allocation Calculator",
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
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 12.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: "Grazing allocation calculator",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
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
                          _calculate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Stock number:',
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
                      controller: stocknum,
                      onChanged: (val) {
                        setState(() {
                          stocknum.text = val;
                          stocknum.selection = TextSelection.fromPosition(
                            TextPosition(offset: stocknum.text.length),
                          );
                          _calculate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Daily feed allocation (kg DM/head)',
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
                      controller: dailyallocation,
                      onChanged: (val) {
                        setState(() {
                          dailyallocation.text = val;
                          dailyallocation.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: dailyallocation.text.length),
                          );
                          _calculate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Expected Yield (kg DM/ha)',
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
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 230,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Average Utilisation (%):',
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
                      controller: averageutilisation,
                      onChanged: (val) {
                        setState(() {
                          averageutilisation.text = val;
                          averageutilisation.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: averageutilisation.text.length),
                          );
                          _calculate();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 30),

            //============ table of outputs ====================
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
                              'Available feed (tonne/ha):',
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
                            availablefeed.toStringAsFixed(1),
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
                              'Total Available feed (tonnes):',
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
                            totalavailablefeed.toStringAsFixed(1),
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
                              'Total feed demand (kg/day):',
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
                            totalfeeddemand.toStringAsFixed(0),
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Grazing days per hectare:',
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
                            grazingdaysperha.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Total grazing days available:',
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
                            totalgrazingdaysavailable.toStringAsFixed(0),
                            style: TextStyle(color: Colors.white, fontSize: 12),
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
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                          child: Text(
                            'Area required per day (sq. metres):',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            arearequiredperday.toStringAsFixed(0),
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
              child: Text('\n\nYou can send these results by email.'),
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
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey, width: 1.0),
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
            Container(
              height: 40,
              margin: EdgeInsets.fromLTRB(60, 10, 60, 20),
              child: ElevatedButton.icon(
                icon: Icon(Icons.email_sharp, color: Colors.black),
                // Set icon color to black
                label: Text(
                  "Email",
                  style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
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
                    borderRadius:
                        BorderRadius.circular(30.0), // Set rounded corners
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }

  void sendMessage() {
    var _emailText = emailController.text;

    var inputMessage = '';

    inputMessage += 'Available feed: $availablefeed tonnes/ha\n\n';
    inputMessage += 'Total available feed: $totalavailablefeed tonnes\n\n';
    inputMessage += 'Total feed demand: $totalfeeddemand kg/day\n\n';
    inputMessage += 'Grazing days per hectare: $grazingdaysperha days\n\n';
    inputMessage +=
        'Total grazing days available: $totalgrazingdaysavailable days\n\n';
    inputMessage +=
        'Area required per day: ${arearequiredperday.toStringAsFixed(1)} sq. metres\n\n';

    String inputEmail;

    Email email;
    setState(() {
      inputEmail = _emailText;

      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          subject: 'Grazing Allocation Calculations: ',
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
