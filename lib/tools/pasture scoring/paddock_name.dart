import '../../orders/orderform.dart';
import '../../tools/pasture%20scoring/Score_paddock.dart';
import 'package:flutter/material.dart';
import '../../../../main.dart';
import '../../Species_Tool_List.dart';
import '../../WebPage.dart';


class paddockname extends StatefulWidget {
  final String datetoday;
  final String paddock;
  final String farmname;
  final String assessor;
  final String emailController;

  const paddockname(
      {super.key,
      required this.datetoday,
      required this.paddock,
      required this.farmname,
      required this.assessor,
      required this.emailController});

  @override
  State<StatefulWidget> createState() {
    return _paddocknameState();
  }
}

class _paddocknameState extends State<paddockname> {
  final paddock = new TextEditingController()..text = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          children: [
            Text(
              "Enter Paddock Name",
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
      body: Form(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 0, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    SizedBox(height: 100),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 20, 0, 0),
                        child: Text('Enter Paddock Name:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ))),
                    SizedBox(height: 10),

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
                    SizedBox(height: 100),
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
                              builder: (context) => scoreapaddock(emailController: widget.emailController, paddock: paddock.text, farmname: widget.farmname, assessor: widget.assessor, datetoday: widget.datetoday,

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
