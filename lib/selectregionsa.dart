import 'package:southafrica_seed_guide/orders/orderform.dart';
import 'package:southafrica_seed_guide/seedtype.dart';
import '../../webpage.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'Species_Tool_List.dart';
import '../main.dart';

class selectregionsa extends StatefulWidget {
  selectregionsa({
    Key? key,
  }) : super(key: key);

  @override
  State<selectregionsa> createState() {
    return _selectregionsaState();
  }
}

class _selectregionsaState extends State<selectregionsa> {
  _makingPhoneCall() async {
    var url = Uri.parse(phonenum);
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  String selectedCountry = 'SAF';
  String selectedRegion = 'KwaZulu Natal';
  String representative = 'Tyrone Reynolds';
  String phonenum = 'tel:+27 84 209 1990';

  void updateDetails(String region) {
    switch (region) {
      case 'KwaZulu Natal':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
      case 'Free State':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
      case 'Central Eastern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        break;
      case 'South Eastern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        break;
      case 'Western Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        break;
      case 'Southern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        break;
      case 'Central Highveld':
        representative = 'Bradley Vincent';
        phonenum = 'tel:+27 72 586 7864';
        break;
      case 'Northern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        break;
      case 'North West Province':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
      case 'Gauteng':
        representative = 'Bradley Vincent';
        phonenum = 'tel:+27 72 586 7864';
        break;
      case 'Mpumalanga':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
      case 'Limpopo':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
      case 'Zimbabwe':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
      case 'Other':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        break;
    }
  }

  Widget buildRadioListTile(String title, String value) {
    return Container(
      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: RadioListTile(
        title: Text(
          title,
          style: TextStyle(fontSize: 15, color: Colors.white),
        ),
        value: value,
        activeColor: selectedRegion == value ? Colors.white : Colors.white,
        // Dynamic color based on selection
        groupValue: selectedRegion,
        onChanged: (value) {
          setState(() {
            selectedRegion = value.toString();
            updateDetails(selectedRegion);
          });
        },
      ),
    );
  }

//some state variable should be here
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
            toolbarHeight: 70,
            title: Column(
              children: [
                Text(
                  'South African Seed Guide',
                  style: TextStyle(color: Colors.white, fontSize: 15.0),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center, // Align to right
                  children: [
                    Text(
                      'Call: $representative for assistance.\nScroll down to see all regions',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                    ),

                  ],
                )


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
          child: Center(
            child: ListView(
              padding: EdgeInsets.only(bottom: 100),
              children: <Widget>[
                Container(
                    padding: EdgeInsets.fromLTRB(10, 20, 0, 0),
                    child: Text('Confirm your region:',
                        style: TextStyle(fontSize: 20, color: Colors.lime))),
                SizedBox(height: 20),
                buildRadioListTile('KwaZulu Natal', 'KwaZulu Natal'),
                buildRadioListTile('Free State', 'Free State'),
                buildRadioListTile(
                    'Central Eastern Cape', 'Central Eastern Cape'),
                buildRadioListTile(
                    'South Eastern Cape', 'South Eastern Cape'),
                buildRadioListTile('Western Cape', 'Western Cape'),
                buildRadioListTile('Southern Cape', 'Southern Cape'),
                buildRadioListTile('Central Highveld', 'Central Highveld'),
                buildRadioListTile('Northern Cape', 'Northern Cape'),
                buildRadioListTile(
                    'North West Province', 'North West Province'),
                buildRadioListTile('Gauteng', 'Gauteng'),
                buildRadioListTile('Mpumalanga', 'Mpumalanga'),
                buildRadioListTile('Limpopo', 'Limpopo'),
                buildRadioListTile('Zimbabwe', 'Zimbabwe'),
                buildRadioListTile('Other', 'Other'),
                Container(
                  padding: EdgeInsets.fromLTRB(40.0, 3.0, 40.0, 30.0),
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            Colors.lightGreen, // Change the color here
                      ),
                      child: Text('Proceed',
                          style: TextStyle(
                            color: Colors.white,
                          )),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => SeedType(
                              country: selectedCountry,
                              region: selectedRegion,
                              representative: representative,
                              headshot: '',
                              phonenum: phonenum,
                              retailname: '',
                            ),
                          ),
                        );
                      }),
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
                    String homePageTitle =
                        'Home'; // Or derive title dynamically
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
