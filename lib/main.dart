import 'dart:async';
import 'package:flutter/services.dart';
import 'package:southafrica_seed_guide/Contacts/Representatives.dart';
import '../../Species_Tool_List.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import '../../drawer.dart';
import '../../fluttermap.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'abouttheguide.dart';
import 'orders/orderform.dart';
import 'package:upgrader/upgrader.dart';

void main() {
  runApp(const MyApp());
}

_makingPhoneCall() async {
  var url = Uri.parse('tel:+27 84 209 1990');
  if (await canLaunchUrl(url)) {
    await launchUrl(url);
  } else {
    throw 'Could not launch $url';
  }
}

Future<void> emailfeedback() async {
  // Create a new Email object.
  final email = Email(
    recipients: ['nick.cameron@cropmark.co.nz', 'reynolds.tyrone123@gmail.com'],
    subject: 'Cropmark APP Feedback',
    body: 'Please find our comments.',
  );

  // Send the email.
  await FlutterEmailSender.send(email);
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations(
        [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]);

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.green[800],
            foregroundColor: Colors.white,
            minimumSize: Size(360, 35),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
      home: const MyHomePage(title: 'Forage Seed Guide'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _index = 0;
  late final Timer timer;
  final images = [
    'assets/rocky.jpg',
   'assets/ultrapic.png',
   'assets/matrixpic.png',
    'assets/frenzypic.png',
    'assets/appealpic.png',
    'assets/rampagepic.png',
    'assets/kainuipic.png',
    'assets/reaperpic.png',
    'assets/mantrapic.png',
    'assets/chicopic.png',
    'assets/oraclepic.png',
    'assets/tyrone reynolds.png',
    'assets/geronimopic.png',
    'assets/dynamopic.png',
    'assets/keapic.png',
    'assets/coleorpic.png',
    'assets/proteorpic.png',
    'assets/riflemanpic2.png',
    'assets/pillarpic.png',
    'assets/saddlebackpic2.png',
  ];

  @override
  void initState() {
    super.initState();
    timer = Timer.periodic(Duration(seconds: 3), (timer) {
      setState(() => _index++);
    });
  }

  void dispose() {
    timer.cancel();
    super.dispose();
  }

  void toGoogleMap() {
    // pop menu drawer
    Navigator.pop(context);

    // go to google map
    Navigator.push(
        context, MaterialPageRoute(builder: (context) => FlutterMapPage()));
  }

  @override
  Widget build(BuildContext context) {
    return UpgradeAlert(
     /* upgrader: Upgrader(
        dialogStyle: UpgradeDialogStyle.cupertino,
        shouldPopScope: () => true,
      ),*/
      child: Scaffold(
        extendBody: true,
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              height: 40,
              width: 40,
              child: FloatingActionButton(
                heroTag: 't1',
                backgroundColor: Colors.green[800],
                foregroundColor: Colors.white,
                child: Icon(Icons.email),
                onPressed: () async {
                  // Email the feedback.
                  await emailfeedback();
                },
              ),
            ),
            const Text('   Got a suggestion? \n   Drop us a line!  ',
                style: TextStyle(color: Colors.white)),
          ],
        ),
        backgroundColor: Colors.white,
        drawer: MyDrawer(
          onGoogleTap: toGoogleMap,
        ),



        appBar: AppBar(
          toolbarHeight: 75,
          title: Column(
            children: [
              Text(
                'South African Seed Guide',
                style: TextStyle(color: Colors.white, fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center, // Align to right
                children: [
                  Text(
                    'Call: ',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                  Text(
                    'Tyrone Reynolds',
                    style: TextStyle(color: Colors.white, fontSize: 12.0),
                  ),
                ],
              ),
              Text(
                'for any assistance in using this App.',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.right,
              ),

            ],
          ),
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.green[800],
            actions: <Widget>[
              IconButton(
                icon: Icon(Icons.call),
                onPressed: (_makingPhoneCall),
              ),
            ]
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
          child: Stack(
            children: [
              Container(
                padding: EdgeInsets.fromLTRB(80.0, 80.0, 40.0, 3.0),
                child: SizedBox(
                  width: 200,
                  height: 60,
                  child: Image.asset(
                    'assets/cropmarklogo.png',
                  ),
                ),
              ),
              Center(
                  child: AnimatedSwitcher(
                duration: Duration(milliseconds: 200),
                child: Image.asset(
                  images[_index % images.length],
                  key: UniqueKey(),
                ),
              )),
            ],
          ),
        ),
        // bottomNavigationBar: new Theme(
        //   data: Theme.of(context).copyWith(canvasColor: Colors.black),
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
                    // Navigate to About the Guide page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => abouttheguide()),
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
                      MaterialPageRoute(builder: (context) => RepresentativesScreen()),
                    );
                    break;
                  case 4:
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => OrderForm()),
                    );
                    break;
                }
              },
              items: [
                BottomNavigationBarItem(
                  label: 'Guide',
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
                  label: 'Contacts',
                  icon: Icon(Icons.contacts),
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
