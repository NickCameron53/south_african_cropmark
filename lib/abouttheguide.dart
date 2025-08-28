import 'package:southafrica_seed_guide/selectregionsa.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import 'Species_Tool_List.dart';
import '../main.dart';
import 'orders/orderform.dart';

class abouttheguide extends StatefulWidget {
  abouttheguide({
    Key? key,
  }) : super(key: key);

  @override
  State<abouttheguide> createState() {
    return _abouttheguideState();
  }
}

class _abouttheguideState extends State<abouttheguide> {


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
                'Cropmark Forage Seed Guide',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),

            ],
          ),
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          ),
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
        child: Center(
          child: ListView(
            shrinkWrap: true,
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 2.0),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 100.0),
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Image.asset(
                    'assets/cropmarklogo.png',
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 10.0),
                child: RichText(
                  text: TextSpan(
                    text: "About the Seed Guide:",
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 3.0, 5.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        "\u25BA This seed guide allows you to select suitable cultivars based on choices you make for your region, animal type, soil acidity and summer rainfall."
                        "\n\n\u25BA It includes commercially available cultivars with a detailed description of each.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 150.0),
                child: Align(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                        Colors.lightGreen, // Change the color here
                      ),
                      child: Text('Guide for South Africa'),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => selectregionsa()),
                        );
                      }),
                ),
              ),
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
}
