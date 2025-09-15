import '../../tools_and_calculators.dart';
import '../../WebPage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'main.dart';
import 'orders/orderform.dart';

class ToolList extends StatefulWidget {
  ToolList({
    Key? key,
  }) : super(key: key);

  @override
  State<ToolList> createState() {
    return _ToolListState();
  }
}

class _ToolListState extends State<ToolList> {
  _makingPhoneCall() async {
    var url = Uri.parse('tel:+27 72 586 7864');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

//some state variable should be here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          toolbarHeight: 70,
          title: Column(
            children: [
              Text(
                'Tools and Calculators',
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.center,
              ),
              Text(
                'Call for assistance',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              onPressed: (_makingPhoneCall),
            ),
          ]),
      body: Container(
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



        child: Padding(padding: const EdgeInsets.only(bottom: 100.0),
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.all(5),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Tools and calculators",
                    style: TextStyle(
                        color: Colors.lime,
                        fontSize: 22,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        "These tools can be helpful in improving pastures, calculating crop yields, crop planning, and crop grazing allocation.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 40),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 35.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Pasture",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Pasture",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 48.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Herbs",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Herbs",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 0.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Fodder Beet",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Fodder Beet",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 70.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Kale",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Kale",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 0.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Forage Rape",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Forage Rape",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Turnip",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Turnip",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 50.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Swede",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Swede",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),

              Row(
                children: [
                  Container(
                    padding: EdgeInsets.fromLTRB(50.0, 10.0, 40.0, 2.0),
                    child: RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: "Cereals",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        elevation: 0,
                        backgroundColor: Colors.transparent,
                      ),
                      onPressed: () {
                        // Navigate to the 'toolsandcalculators' screen with the specified plant type
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => toolsandcalculators(
                              planttype: "Cereals",
                            ),
                          ),
                        );
                      },
                      child: Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.white,
                        size: 32,
                      ),
                    ),
                  ),
                ],
              ),
              Divider(
                color: Colors.green,
                thickness: 1,
                height: 20,
                indent: 5,
                endIndent: 5,
              ),
              SizedBox(height: 20,)
            ],
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
