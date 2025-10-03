import 'package:flutter/material.dart';
import 'package:southafrica_seed_guide/abouttheguide.dart';
import 'package:southafrica_seed_guide/WebPage.dart';
import 'package:southafrica_seed_guide/Species_Tool_List.dart';
import 'package:southafrica_seed_guide/orders/orderform.dart';

class GlobalWidgets {
  // Constants
  static const Color titleColor = Color(0xFF2E7D32);
  static const Color primaryGreen = Color(0xFF2E7D32);
  static const Color lightGreen = Color(0xFF81C784);
  static const Color lightGreenButton = Color(0xFF4CAF50);
  static const Color subtitleColor = Color(0xFFE8F5E8);
  static const double sectionSpacing = 20.0;
  static const double dividerSpacing = 10.0;

  // Standard Bottom Navigation Bar
  static Widget buildBottomNavigationBar(BuildContext context, {int currentIndex = 0}) {
    void _onBottomNavTap(int index) {
      switch (index) {
        case 0:
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context) => AboutTheGuide()),
                (route) => false,
          );
          break;
        case 1:
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => WebPage()),
          );
          break;
        case 2:
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
    }

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 6.0, color: Colors.green.shade700),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          showUnselectedLabels: true,
          selectedItemColor: Colors.green.shade700,
          unselectedItemColor: Colors.green.shade700,
          currentIndex: currentIndex,
          onTap: _onBottomNavTap,
          items: const [
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
    );
  }

  // Alternative version with custom navigation handler
  static Widget buildBottomNavigationBarWithHandler({
    required BuildContext context,
    required Function(int) onTap,
    int currentIndex = 0,
    List<BottomNavigationBarItem>? customItems,
  }) {
    final items = customItems ?? const [
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
    ];

    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(width: 6.0, color: Colors.green.shade700),
        ),
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      child: ClipRRect(
        borderRadius: const BorderRadius.vertical(top: Radius.circular(18)),
        child: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          backgroundColor: Colors.black,
          showUnselectedLabels: true,
          selectedItemColor: Colors.green.shade700,
          unselectedItemColor: Colors.green.shade700,
          currentIndex: currentIndex,
          onTap: onTap,
          items: items,
        ),
      ),
    );
  }

  // Reusable divider with consistent styling
  static Widget buildDivider() {
    return Column(
      children: [
        const SizedBox(height: dividerSpacing),
        const Divider(
          color: Colors.green,
          thickness: 1,
          height: 20,
        ),
        const SizedBox(height: dividerSpacing),
      ],
    );
  }

  // Section title widget
  static Widget buildSectionTitle(String text, {Color? color}) {
    return SizedBox(
      width: double.infinity,
      child: Text(
        text,
        textAlign: TextAlign.left,
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color ?? titleColor,
        ),
      ),
    );
  }

  // Info row with label and value
  static Widget buildInfoRow(String label, String value) {
    return SizedBox(
      width: double.infinity,
      child: RichText(
        textAlign: TextAlign.left,
        text: TextSpan(
          style: const TextStyle(fontSize: 15, color: Colors.black),
          children: [
            TextSpan(
              text: '$label: ',
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            TextSpan(text: value),
          ],
        ),
      ),
    );
  }

  // Standard action button
  static Widget buildActionButton({
    required String text,
    required VoidCallback onPressed,
    Color? backgroundColor,
    Color? textColor,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: backgroundColor ?? lightGreenButton,
        foregroundColor: textColor ?? Colors.white,
        minimumSize: const Size(100, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        elevation: 2,
      ),
      child: Text(text),
    );
  }

  // Download button with icon
  static Widget buildDownloadButton({
    required String text,
    required VoidCallback onPressed,
    IconData icon = Icons.file_download,
  }) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        backgroundColor: lightGreenButton,
        foregroundColor: Colors.white,
        minimumSize: const Size(140, 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(icon),
          const SizedBox(width: 8),
          Text(text),
        ],
      ),
    );
  }

  // Bullet point text
  static Widget buildBulletPoint(String text) {
    return Text(
      "\n\u25BA $text",
      style: const TextStyle(fontSize: 15),
    );
  }

  static Widget buildAnimalIcons(List<String> animals, {double iconSize = 70}) {
    return Wrap(
      alignment: WrapAlignment.start,
      spacing: 8, // Horizontal space between icons
      runSpacing: 8, // Vertical space between rows
      children: animals.map((animal) {
        return Image.asset(
          'assets/$animal.ico',
          height: iconSize,
          width: iconSize,
          errorBuilder: (context, error, stackTrace) =>
              _getFallbackIcon(animal, iconSize),
        );
      }).toList(),
    );
  }

  static Widget _getFallbackIcon(String animal, double size) {
    final iconSize = size - 10;
    switch (animal.toLowerCase()) {
      case 'dairy':
        return Icon(Icons.local_drink, size: iconSize, color: Colors.white);
      case 'beef':
        return Icon(Icons.agriculture, size: iconSize, color: Colors.brown);
      case 'sheep':
        return Icon(Icons.agriculture, size: iconSize, color: Colors.grey);
      case 'deer':
        return Icon(Icons.nature, size: iconSize, color: Colors.orange);
      case 'goat':
        return Icon(Icons.agriculture, size: iconSize, color: Colors.grey);
      case 'horse':
        return Icon(Icons.agriculture, size: iconSize, color: Colors.brown);
      case 'alpaca':
        return Icon(Icons.pets, size: iconSize, color: Colors.grey);
      default:
        return Icon(Icons.pets, size: iconSize, color: Colors.grey);
    }
  }
}