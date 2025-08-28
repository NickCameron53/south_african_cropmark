import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'package:url_launcher/url_launcher.dart';

import 'Species_Tool_List.dart';
import 'abouttheguide.dart';
import 'orders/orderform.dart';


_aboutcropmark() async {
  var url = Uri.parse('https://www.cropmarkseeds.com');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_techsheets() async {
  var url = Uri.parse('https://www.cropmarkseeds.com/Seed-technology/Tech-Sheets');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_sowingguides() async {
  var url = Uri.parse('https://www.cropmarkseeds.com/Seed-technology/Sowing-Guides');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_productvideos() async {
  var url = Uri.parse('https://www.cropmarkseeds.com/Cropmark-Seeds-Videos');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_contactus() async {
  var url = Uri.parse('https://www.cropmarkseeds.com/Contact-Cropmark-Seeds');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_facebook() async {
  var url = Uri.parse('https://www.facebook.com/CropmarkSeeds/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_instagram() async {
  var url = Uri.parse('https://www.instagram.com/cropmarkseeds/?hl=en');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_youtube() async {
  var url = Uri.parse('https://www.youtube.com/@CropmarkSeeds');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

class webpage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Web Hub'),
          centerTitle: true,
          backgroundColor:Colors.green[800],
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
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 20.0),
              child: RichText(
                text: TextSpan(
                  text: "Useful Web Sites:",
                  style: TextStyle(
                      color: Colors.lime,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            // ================  about cropmark ===============
            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _aboutcropmark,
                icon: Icon(Icons.search_sharp),
                label: Text('About Cropmark'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _productvideos,
                icon: Icon(FontAwesomeIcons.video,size: 20,),
                label: Text('Product Videos'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _techsheets,
                icon: Icon(FontAwesomeIcons.paperclip,size: 20,),
                label: Text('Tech Sheets'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _sowingguides,
                icon: Icon(FontAwesomeIcons.seedling,size: 20,),
                label: Text('Sowing Guides'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _contactus,
                icon: Icon(FontAwesomeIcons.contao,
                  size: 20,),
                label: Text('Contact Us'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _facebook,
                icon: Icon(Icons.facebook),
                label: Text('Facebook'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _instagram,
                icon: Icon(FontAwesomeIcons.instagram,
                  size: 20,),
                label: Text('Instagram'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),

            Container(
              padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
              child: ElevatedButton.icon(
                onPressed: _youtube,
                icon: Icon(FontAwesomeIcons.youtube,
                  size: 20,),
                label: Text('You Tube'),
                style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.lightGreen,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    )),
              ),
            ),
          ],
        ),
      ),
    ),bottomNavigationBar: Container(
      color: Colors.green.shade800, // Add the background color here
      child: ClipRRect(
        borderRadius: BorderRadius.vertical(top: Radius.circular(18)),
        child: Container( // This container is now just for the border
          decoration: BoxDecoration(
            border: Border(
              top: BorderSide(width: 6.0, color: Colors.green.shade700),
            ),
          ),
          child: BottomNavigationBar(
            type: BottomNavigationBarType.fixed,
            backgroundColor: Colors.black,
            showUnselectedLabels: true,
            selectedItemColor: Colors.green.shade700,
            unselectedItemColor: Colors.green.shade700,
            onTap: (index) {
              switch (index) {
                case 0:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => abouttheguide()),
                  );
                  break;

                case 1:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => toollist()),
                  );
                  break;
                case 2:
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => OrderForm()),
                  );
                  break;
              }
            },
            items: [
              BottomNavigationBarItem(
                label: 'Seed Guide',
                icon: Icon(Icons.home),
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
    ),
    );
  }
}
