import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class InfoCard extends StatelessWidget {
  const InfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(30, 100, 30, 0),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.0),
          topRight: Radius.circular(10.0),
          bottomLeft: Radius.circular(20.0), // Increased radius for bottom left
          bottomRight: Radius.circular(20.0), // Increased radius for bottom right
        ),
        child: Stack(
          children: [
            Material(
              child: Container(
                height: 500,
                width: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                padding: const EdgeInsets.fromLTRB(30, 50, 30, 0),
                child: Column(  // Use Column to stack header and text
                  crossAxisAlignment: CrossAxisAlignment.start,  // Align text to left
                  children: [
                    Text(  // Header text
                      "Endophytes",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    const Text(  // Existing text
                      "\n\nEndophytes are a fungus that exist naturally within ryegrass and other grasses, helping to protect plants from insect attack and improving pasture persistence."
                          "\nIn Australia many ryegrass cultivars contain endophyte, passed down through seeds. Including the naturally occurring \'standard endophyte\' as well as other cultivars like CM142, AR1 and NEA2."
                          "\n\n While endophytes help to protect against insects, some endophytes can impact livestock performance, including causing grass staggers and heat stress."
                          " Therefore it is important to select an endophyte that considers animal health and is suited to your farm's challenges.",
                      style: TextStyle(color: Colors.black, fontSize: 12),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topRight,
              child: IconButton(
                icon: FaIcon(FontAwesomeIcons.circleXmark), // Use FaIcon with circleXmark icon
                color: Colors.black,
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}