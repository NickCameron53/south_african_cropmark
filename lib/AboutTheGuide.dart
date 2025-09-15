import 'package:southafrica_seed_guide/selectregionsa.dart';
import '../../WebPage.dart';
import 'package:flutter/material.dart';
import 'Species_Tool_List.dart';
import 'orders/orderform.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutTheGuide extends StatefulWidget {
  const AboutTheGuide({
    Key? key,
  }) : super(key: key);

  @override
  State<AboutTheGuide> createState() {
    return _AboutTheGuideState();
  }
}

class _AboutTheGuideState extends State<AboutTheGuide> {
  _makingPhoneCall() async {
    var url = Uri.parse('tel:+27 84 209 1990');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  void _onBottomNavTap(int index) {
    switch (index) {
      case 0:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => AboutTheGuide()), // Removed const
        );
        break;
      case 1:
      // Navigate to WebPage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => WebPage()), // Removed const
        );
        break;
      case 2:
      // Navigate to Toolkit page
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ToolList()), // Removed const
        );
        break;
      case 3:
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => OrderForm()), // Removed const
        );
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          children: [
            Text( // Removed const
              'South African Seed Guide',
              style: TextStyle(color: Colors.white, fontSize: 15.0),
              textAlign: TextAlign.center,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text( // Removed const
                  'Call: ',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
                Text( // Removed const
                  'Tyrone Reynolds',
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                ),
              ],
            ),
            Text( // Removed const
              'for any assistance in using this App.',
              style: TextStyle(color: Colors.white, fontSize: 12.0),
              textAlign: TextAlign.right,
            ),
          ],
        ),
        backgroundColor: Colors.green[800], // This can't be const
        foregroundColor: Colors.white,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.call), // Removed const
            onPressed: _makingPhoneCall,
          ),
        ],
      ),
      body: Container(
        decoration: BoxDecoration( // Removed const
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
            padding: EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 2.0), // Removed const
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(60.0, 0.0, 60.0, 100.0), // Removed const
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Image.asset(
                    'assets/cropmarklogo.png',
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(0.0, 30.0, 12.0, 10.0), // Removed const
                child: RichText( // Removed const
                  text: TextSpan(
                    text: "About the Seed Guide:",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 3.0, 5.0), // Removed const
                child: RichText( // Removed const
                  text: TextSpan(
                    text: "\u25BA This seed guide allows you to select suitable cultivars based on choices you make for your region, animal type, soil acidity and summer rainfall."
                        "\n\n\u25BA It includes commercially available cultivars with a detailed description of each.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(50.0, 50.0, 50.0, 150.0), // Removed const
                child: Align(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                    ),
                    child: Text('Proceed'), // Removed const
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => selectregionsa(), // Removed const
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(width: 6.0, color: Colors.green.shade700), // Can't be const
          ),
          borderRadius: BorderRadius.all(Radius.circular(20)), // Removed const
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(18)), // Removed const
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            selectedItemColor: Colors.green.shade700, // Can't be const
            unselectedItemColor: Colors.green.shade700, // Can't be const
            onTap: _onBottomNavTap,
            items: [ // Removed const
              BottomNavigationBarItem(
                label: 'Seed Guide',
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
