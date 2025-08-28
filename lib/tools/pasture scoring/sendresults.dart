import '../../orders/orderform.dart';
import '../../tools/pasture%20scoring/farmdetail.dart';
import '../../tools/pasture%20scoring/paddock_name.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import '../../Species_Tool_List.dart';
import '../../webpage.dart';

class sendresults extends StatefulWidget {
  final String datetoday;
  final String paddock;
  final String farmname;
  final String assessor;
  final String emailController;
  final String product;
  final String recommendation;
  final String avscore;

  const sendresults(
      {Key? key,
      required this.emailController,
      required this.paddock,
      required this.farmname,
      required this.assessor,
      required this.product,
      required this.avscore,
      required this.recommendation,
      required this.datetoday})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _sendresultsState();
  }
}

class _sendresultsState extends State<sendresults> {
  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Column(
          children: [
            Text(
              "Email to send your results",
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
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Container(
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
          key: _emailFormKey,
          child: Center(
            child: ListView(
              shrinkWrap: false,
              padding: EdgeInsets.all(5),
              children: <Widget>[
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0.0, 0.0, 20.0),
                  child: Text(
                    '\n\nYou can email the results for paddock:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(0, 0.0, 0.0, 20.0),
                  child: Text(
                    widget.paddock,
                    style: TextStyle(
                      color: Colors.lime,
                      fontSize: 14.0,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Container(
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
                Divider(
                  color: Colors.green,
                  thickness: 1,
                  height: 20,
                  indent: 5,
                  endIndent: 5,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0.0, 0.0, 0.0),
                  child: Text(
                    '\n\nand/or score a new paddock:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 5.0),
                  child: ElevatedButton(
                    child: Text('Score a new paddock',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //                 builder: (context) => scoring(
                          builder: (context) => paddockname(
                            datetoday: widget.datetoday,
                            paddock: widget.paddock,
                            farmname: widget.farmname,
                            assessor: widget.assessor,
                            emailController: widget.emailController,
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
                SizedBox(height: 10),
                Divider(
                  color: Colors.green,
                  thickness: 1,
                  height: 20,
                  indent: 5,
                  endIndent: 5,
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20, 0.0, 0.0, 0.0),
                  child: Text(
                    '\n\nand/or score a new farm:',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(60.0, 20.0, 60.0, 8.0),
                  child: ElevatedButton(
                    child: Text('Score a new farm',
                        style: TextStyle(
                          color: Colors.black,
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          //                 builder: (context) => scoring(
                          builder: (context) => farmdetail(),
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
                SizedBox(height: 40),
                Divider(
                  color: Colors.green,
                  thickness: 1,
                  height: 20,
                  indent: 5,
                  endIndent: 5,
                ),
              ],
            ),
          ),
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

  void sendMessage() {
    var _farmname = widget.farmname;
    var _assessor = widget.assessor;
    var _paddock = widget.paddock;
    var _date = widget.datetoday;
    var _emailaddress = widget.emailController;
    var _product = widget.product;
    var _recommendation = widget.recommendation;
    var _avscore = widget.avscore;

    var inputMessage = 'Farm:  '
        '$_farmname ,\n\n'
        'Assessor:  '
        '$_assessor \n\n'
        'Date:  '
        '   $_date\n\n'
        'Paddock:  '
        '   $_paddock\n\n'
        'Recommendations: '
        '$_recommendation\n\n';

    String inputEmail;

    Email email;
    setState(() {
      inputEmail = _emailaddress;

      if (inputMessage.isNotEmpty && inputEmail.isNotEmpty) {
        email = Email(
          body: inputMessage +
              ( // Add condition to include products only if avscore <= 4.5
                  double.parse(_avscore) <= 4.5
                      ? 'Suggested Products: $_product\n\n'
                      : ''),
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
    await FlutterEmailSender.send(email);
  }
}
