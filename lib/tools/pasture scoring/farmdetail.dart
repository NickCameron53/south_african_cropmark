import '../../orders/orderform.dart';
import '../../tools/pasture%20scoring/paddock_name.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import 'package:intl/intl.dart';
import '../../Species_Tool_List.dart';
import '../../WebPage.dart';

class farmdetail extends StatefulWidget {
  const farmdetail({super.key});

  @override
  State<StatefulWidget> createState() {
    return _farmdetailState();
  }
}

class _farmdetailState extends State<farmdetail> {
  final farmname = TextEditingController()..text = '';
  final paddock = TextEditingController()..text = '';
  final assessor = new TextEditingController()..text = '';
  final datetoday = new TextEditingController()
    ..text = DateFormat('EEE, d MMM yyyy').format(DateTime.now());
  final TextEditingController emailController = new TextEditingController();

  String recommendation = '';
  String product = '';

  final _emailFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          children: [
            Text(
              "Enter Farm & Paddock Detail",
              style: TextStyle(color: Colors.white, fontSize: 16.0),
              textAlign: TextAlign.right,
            ),
            Text(
              "An email address is needed\n to save the results",
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
        key: _emailFormKey,
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text('Enter Farm Details:',
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(height: 20),
                    Container(
                      width: 260,
                      padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                      child: Text(
                        'Email:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
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
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      width: 260,
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0, 0),
                      child: Text(
                        'Farm name:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
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
                        controller: farmname,
                        onChanged: (val) {
                          setState(() {
                            farmname.text = val;
                            farmname.selection = TextSelection.fromPosition(
                              TextPosition(offset: farmname.text.length),
                            );
                          });
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      width: 260,
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0, 0),
                      child: Text(
                        'Assessor name:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
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
                        controller: assessor,
                        onChanged: (val) {
                          setState(() {
                            assessor.text = val;
                            assessor.selection = TextSelection.fromPosition(
                              TextPosition(offset: assessor.text.length),
                            );
                          });
                        },
                        keyboardType: TextInputType.text,
                      ),
                    ),
                    Container(
                      width: 260,
                      padding: EdgeInsets.fromLTRB(0.0, 20.0, 0, 0),
                      child: Text(
                        'Walk Date:',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                        ),
                      ),
                    ),
                    Container(
                      width: 260,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // Set corner radius
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.0),
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextFormField(
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(20.0, 10.0, 0, 10.0),
                                border: InputBorder.none,
                              ),
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.bold,
                                color: Colors.green[900],
                              ),
                              enabled: false, // Set to false to disable editing
                              controller: datetoday,
                            ),
                          ),
                          IconButton(
                            icon: Icon(
                              Icons.calendar_month_rounded,
                              color: Colors.lime,
                            ),
                            onPressed: () {
                              showDatePicker(
                                context: context,
                                initialDate: DateTime.now(),
                                firstDate: DateTime(2024, 1, 1),
                                lastDate: DateTime(2025, 12, 31),
                                builder: (context, child) {
                                  return Theme(
                                    data: Theme.of(context).copyWith(
                                      colorScheme: ColorScheme.light(
                                        primary: Colors.green.shade900,
                                        onPrimary: Colors.black,
                                        onSurface: Colors.black,
                                      ),
                                      textButtonTheme: TextButtonThemeData(
                                        style: TextButton.styleFrom(
                                          foregroundColor: Colors.green
                                              .shade900, // button text color
                                        ),
                                      ),
                                    ),
                                    child: child!,
                                  );
                                },
                              ).then((selectedDate) {
                                if (selectedDate != null) {
                                  setState(() {
                                    datetoday.text =
                                        DateFormat('EEE, d MMM yyyy')
                                            .format(selectedDate);
                                  });
                                }
                              });
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(60.0, 50.0, 60.0, 5.0),
                      child: ElevatedButton(
                        child: Text('Continue',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //                 builder: (context) => scoring(
                              builder: (context) => paddockname(
                                datetoday: datetoday.text,
                                paddock: paddock.text,
                                farmname: farmname.text,
                                assessor: assessor.text,
                                emailController: emailController.text,
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lime,
                          // Set background color to lime
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30.0) // Set corner radius
                              ),
                        ),
                      ),
                    ),
                  ],
                ),
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
                // Navigate to WebPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => WebPage()),
                  );
                  break;
                case 2:
                // Navigate to Toolkit page
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => ToolList()),
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
