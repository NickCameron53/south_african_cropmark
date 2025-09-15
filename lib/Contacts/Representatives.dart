import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Species_Tool_List.dart';
import '../main.dart';
import '../orders/orderform.dart';
import '../WebPage.dart';

class RepresentativesScreen extends StatefulWidget {
  @override
  _RepresentativesScreenState createState() => _RepresentativesScreenState();
}

class _RepresentativesScreenState extends State<RepresentativesScreen> {
  String? selectedLocation;
  String representative = '';
  String phonenum = '';
  String email = '';

  final List<String> locations = [
    'KwaZulu Natal',
    'Free State',
    'Central Eastern Cape',
    'South Eastern Cape',
    'Western Cape',
    'Southern Cape',
    'Central Highveld',
    'Northern Cape',
    'North West Province',
    'Gauteng',
    'Mpumalanga',
    'Limpopo',
    'Zimbabwe',
    'Other'
  ];

  void updateRepresentative(String location) {
    switch (location) {
      case 'KwaZulu Natal':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      case 'Free State':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      case 'Central Eastern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        email = 'rocky@agrims.co.za';
        break;
      case 'South Eastern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        email = 'rocky@agrims.co.za';
        break;
      case 'Western Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        email = 'rocky@agrims.co.za';
        break;
      case 'Southern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        email = 'rocky@agrims.co.za';
        break;
      case 'Central Highveld':
        representative = 'Bradley Vincent';
        phonenum = 'tel:+27 72 586 7864';
        email = 'bradleywadevincent@gmail.com';
        break;
      case 'Northern Cape':
        representative = 'Rocky Reynolds';
        phonenum = 'tel:+27 83 655 9651';
        email = 'rocky@agrims.co.za';
        break;
      case 'North West Province':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      case 'Gauteng':
        representative = 'Bradley Vincent';
        phonenum = 'tel:+27 72 586 7864';
        email = 'bradleywadevincent@gmail.com';
        break;
      case 'Mpumalanga':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      case 'Limpopo':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      case 'Zimbabwe':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      case 'Other':
        representative = 'Tyrone Reynolds';
        phonenum = 'tel:+27 84 209 1990';
        email = 'reynolds.tyrone123@gmail.com';
        break;
      default:
        representative = '';
        phonenum = '';
        email = '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: AppBar(
        title: Text(
          'Contacts Directory',
          style: TextStyle(color: Colors.white, fontSize: 18.0),
          textAlign: TextAlign.center,
        ),
        backgroundColor: Colors.green.shade800,
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
        child: Padding(
          padding: EdgeInsets.fromLTRB(40.0, 50.0, 40.0, 2.0),
          child: Column(
            children: [
              // Dropdown for location selection
              DropdownButtonFormField<String>(
                value: selectedLocation,
                decoration: InputDecoration(
                  labelText: 'Select Location',
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.green.shade900,
                  labelStyle: TextStyle(color: Colors.lime),
                  // Remove focus border
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.shade800,
                      // Use green instead of purple
                      width: 2.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.green.shade800,
                      width: 1.0,
                    ),
                  ),
                ),
                dropdownColor: Colors.green.shade800,
                style: TextStyle(color: Colors.white),
                icon: Icon(
                  Icons.arrow_drop_down,
                  color: Colors.lime, // Lime color for the arrow
                  size: 30, // Larger size for the arrow
                ),
                iconSize: 30,
                // Ensure the icon size is consistent
                items: locations.map((String location) {
                  return DropdownMenuItem<String>(
                    value: location,
                    child: Text(
                      location,
                      style: TextStyle(color: Colors.white),
                    ),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedLocation = newValue;
                    if (newValue != null) {
                      updateRepresentative(newValue);
                    }
                  });
                },
              ),
              SizedBox(height: 80),

              // Display card if a location is selected
              if (selectedLocation != null && representative.isNotEmpty)
                ContactsCard(
                  representative: representative,
                  location: selectedLocation!,
                  phoneNumber: phonenum,
                  email: email,
                ),

              // Placeholder text when no location is selected
              if (selectedLocation == null)
                Expanded(
                  child: Center(
                    child: Text(
                      'Please select a location to see representative details',
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
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

class ContactsCard extends StatelessWidget {
  final String representative;
  final String location;
  final String phoneNumber;
  final String email;

  const ContactsCard({
    Key? key,
    required this.representative,
    required this.location,
    required this.phoneNumber,
    required this.email,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 70,
          width: 325,
          decoration: BoxDecoration(
            color: Colors.green.shade800,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20.0),
              topRight: Radius.circular(20.0),
            ),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 40),
                child: Text(
                  representative,
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ],
          ),
        ),
        Container(
          width: 325,
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.green.shade800,
              width: 3.0,
            ),
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20.0),
              bottomRight: Radius.circular(20.0),
            ),
            color: Color.fromRGBO(255, 255, 255, 0.95),
          ),
          child: Container(
            margin: EdgeInsets.all(10),
            child: Column(
              children: [
                Text(location,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    )),
                SizedBox(height: 5),
                Divider(
                  color: Colors.green.shade800,
                  thickness: 1,
                  height: 20,
                  indent: 5,
                  endIndent: 5,
                ),
                SizedBox(height: 10),
                // Phone row with icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.phone,
                      size: 16,
                      color: Colors.green.shade800,
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () async {
                        final Uri telLaunchUri = Uri(
                          scheme: 'tel',
                          path: phoneNumber.replaceFirst('tel:', ''),
                        );
                        if (await canLaunchUrl(telLaunchUri)) {
                          await launchUrl(telLaunchUri);
                        }
                      },
                      child: Text(
                        phoneNumber.replaceFirst('tel:', ''),
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 20),
                // Email row with icon
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.email,
                      size: 16,
                      color: Colors.green.shade800,
                    ),
                    SizedBox(width: 8),
                    InkWell(
                      onTap: () async {
                        final Uri emailLaunchUri = Uri(
                          scheme: 'mailto',
                          path: email,
                        );
                        if (await canLaunchUrl(emailLaunchUri)) {
                          await launchUrl(emailLaunchUri);
                        }
                      },
                      child: Text(
                        email,
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.black,
                          decoration: TextDecoration.underline,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
