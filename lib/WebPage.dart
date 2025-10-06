import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../main.dart';
import 'package:url_launcher/url_launcher.dart';
import 'global_widgets.dart';

_aboutcropmark() async {
  var url = Uri.parse('https://www.cropmarkseeds.com/our-story/');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

_techsheets() async {
  var url =
      Uri.parse('https://www.cropmarkseeds.com/Seed-technology/Tech-Sheets');
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

class WebPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: AppBar(
          title: Text('Web Hub'),
          centerTitle: true,
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
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 20.0),
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
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 20.0),
                child: ElevatedButton.icon(
                  onPressed: _techsheets,
                  icon: Icon(
                    FontAwesomeIcons.paperclip,
                    size: 20,
                  ),
                  label: Text('Tech Sheets'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 20.0),
                child: ElevatedButton.icon(
                  onPressed: _contactus,
                  icon: Icon(
                    FontAwesomeIcons.contao,
                    size: 20,
                  ),
                  label: Text('Contact Us'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 20.0),
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
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 20.0),
                child: ElevatedButton.icon(
                  onPressed: _instagram,
                  icon: Icon(
                    FontAwesomeIcons.instagram,
                    size: 20,
                  ),
                  label: Text('Instagram'),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0),
                      )),
                ),
              ),

              Container(
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 20.0),
                child: ElevatedButton.icon(
                  onPressed: _youtube,
                  icon: Icon(
                    FontAwesomeIcons.youtube,
                    size: 20,
                  ),
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
      ),
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),
    );
  }
}
