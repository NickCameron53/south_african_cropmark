import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class MaturityCard extends StatelessWidget {
  const MaturityCard({Key? key}) : super(key: key);

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
                      "Maturity",
                      style: TextStyle(fontSize: 22, color: Colors.black),
                    ),
                    const Text(  // Existing text
                      "\nRelative to Nui (day 0)."
                          "\n\nVery Early           ≤    -12 days."
                          "\n\n Early                 -11 to -6 days."
                          "\n\n Mid                   -5  to +7 days."
                          "\n\n Late                  +8  to +21 days."
                          "\n\n Very Late          +22 to +25 days."
                          "\n\n Extremely Late     +26 to +36 days."
                      "\n\n\n Generally grass quality through the spring period improves with later maturity cultivars."
                      ,
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