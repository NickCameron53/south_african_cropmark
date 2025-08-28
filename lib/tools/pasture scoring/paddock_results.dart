import '../../orders/orderform.dart';
import '../../tools/pasture%20scoring/sendresults.dart';
import 'package:flutter/material.dart';
import '../../../main.dart';
import '../../Species_Tool_List.dart';
import '../../webpage.dart';

class paddockresults extends StatefulWidget {
  final String datetoday;
  final String paddock;
  final String farmname;
  final String assessor;
  final String emailController;
  final String season;
  final avscore;

  const paddockresults({
    Key? key,
    required this.emailController,
    required this.paddock,
    required this.farmname,
    required this.assessor,
    required this.datetoday,
    required this.season,
    required this.avscore,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _paddockresultsState();
  }
}

class _paddockresultsState extends State<paddockresults> {
  String recommendation = '';
  String product = '';

  final _emailFormKey = GlobalKey<FormState>();
  final TextEditingController emailController = new TextEditingController();

  @override
  void initState() {
    super.initState();
    _resultforpaddock(); // Call the function to calculate recommendation and product
  }

  void _resultforpaddock() {
// ======================== spring recommendations =================================
    if (double.parse(widget.avscore) >= 1.0 &&
        double.parse(widget.avscore) <= 1.999 &&
        widget.season == "Spring") {
      recommendation =
          "Immediate action required this spring. This paddock may have been severely pugged over winter or has major plant density or weed issues. Check soil fertility and presence of pasture pests such as porina and grass grub.\nSow into crop this spring before returning to perennial pasture (the products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall).\n";
      product =
          "Summer Crop: Chico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nHaymaker Summer grass @8kg/ha. \nPillar Rape@4-5kg/ha  Or  Winter Crop Proteor Kale @3-4kg/ha \nColeor Kale @3-4kg/ha";
    }
    if (double.parse(widget.avscore) >= 2.0 &&
        double.parse(widget.avscore) <= 2.999 &&
        widget.season == "Spring") {
      recommendation =
          "Check soil fertility and presence of pasture pests. It is likely that this pasture is limiting on farm production.\nConsider cropping this spring for a new season forage crop (depending on rank of paddock for pasture score) followed by a crop & then followed by a perennial pasture.\nThe products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall. \nIf cropping this paddock is not desired consider under-sowing this paddock early in the season with a high rate of a short-term Italian ryegrass to last for the next 12 months.\n";
      product =
          "Summer Crop:\nChico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nHaymaker summer grass @8kg/ha. \nPillar Rape@4-5kg/ha \n\nOr Winter Crop: \nProteor Kale @3-4kg/ha \nColeor Kale @3-4kg/ha \n\n Or Ryegrasses: \n Vibe Italian Ryegrass	@15-20kg/ha \nAppeal Italian Ryegrass @15-20kg/ha \nFrenzy Hybrid Ryegrass @20-25/ha \n\nPasture spray with a 24D or MCPA/MCPB type product to control majority of weeds that may be present.";
    }
    if (double.parse(widget.avscore) >= 3.0 &&
        double.parse(widget.avscore) <= 3.5 &&
        widget.season == "Spring") {
      recommendation =
          "This paddock has some plant density or weed concerns or has a moderate level of pugging.\nIf still early in the season, consider undersowing this paddock with a fast establishing Italian or hybrid ryegrass.\nThis paddock may also require a pasture spray to control weed pressure.\nIf paddock is bumpy or rough, the use of a roller or harrows can be a good idea to help smooth out any pugging damage before undersowing.\nThis paddock may be a candidate for future cropping in 1 - 3 years.\n";
      product =
          "Vibe Italian Ryegrass	@12-18kg/ha.\nAppeal Italian Ryegrass @12-18kg/ha.\nFrenzy Hybrid Ryegrass	@15-20kg/ha.\n\nPasture spray with a 24D or MCPA/MCPB type product to control majority of weeds that may be present.";
    }
    if (double.parse(widget.avscore) > 3.5 &&
        double.parse(widget.avscore) <= 4.5 &&
        widget.season == "Spring") {
      recommendation =
          "This paddock may have some pugging damage from winter and/or weed or plant density concerns. \nConsider an early spring weed spray targeting problematic weeds such as dock. Or a more general weed spray targeting other pasture weeds. \nApply spring fertiliser along with an application of Urea/N-Protect. \nPaddock will be okay for the coming season.\n";
      product =
          "For Dock Issues, use an Asulam type product such as Dockstar.\nFor general weed control, a 24D amine or MCPA/MPCB type products work best. \nConsult your local rural representative for specific information.\n\nFertiliser:  N-Protect @65-80kg/ha.\nAmmo 31 @90-110kg/ha if sulphur is known to be limiting.";
    }
    if (double.parse(widget.avscore) > 4.5 &&
        double.parse(widget.avscore) <= 5.0 &&
        widget.season == "Spring") {
      recommendation =
          "Keep up the good work, this paddock has good levels of grass and clovers and minimal weed pressure. No action required. Stay on top of general fertiliser and good grazing management.\n";
      //  product = "";
    }
// ============================  autumn recommendations ====================================
    if (double.parse(widget.avscore) >= 1.0 &&
        double.parse(widget.avscore) <= 1.999 &&
        widget.season == "Autumn") {
      recommendation =
          "Immediate action is required. \nCheck soil fertility and presence of pasture pests such as Argentine Stem Weevil or Black Beetle. \nSpray out and sow into an annual ryegrass such as Rampage, Bullet or Zoom this autumn and then a crop in spring before returning to a perennial pasture. \nThe products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall.\n";
      product =
          " Rampage Cropcote 	@25-30kg/ha.\n Zoom Cropcote	@25-30kg/ha.\n Bullet Cropcote	@25-30kg/ha.\n\n Summer Crop:\nChico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nHaymaker Summer grass @8kg/ha. \nPillar Rape @4-5kg/ha.\n\n Or Winter Crop: \nProteor Kale @3-4kg/ha. \nColeor Kale @3-4kg/ha.";
    }
    if (double.parse(widget.avscore) >= 2.0 &&
        double.parse(widget.avscore) <= 2.999 &&
        widget.season == "Autumn") {
      recommendation =
          "Check soil fertility and presence of pasture pests.\nIt is likely that this pasture is limiting on farm production.\nUnder sow this autumn with an annual ryegrass such as Rampage for 6-8 months followed by a crop & then followed by a perennial pasture.\nThe products and grass endophyte type should be chosen using the app choices for your region, animal type, soil acidity, and summer rainfall.\n";
      product =
          "Rampage Annual Ryegrass @15-20kg/ha.\nZoom Annual Ryegrass	@15-20kg/ha.\nBullet Annual Ryegrass	@15-20kg/ha.\n\nFollowed by: \nSummer Crop:\nChico Chicory @10kg/ha.\nMarco Turnip @3kg/ha. \nHaymaker summer grass @8kg/ha. \nPillar Rape@4-5kg/ha \n\nOr Winter Crop: \nProteor Kale @3-4kg/ha. \nColeor Kale @3-4kg/ha. ";
    }
    if (double.parse(widget.avscore) >= 3.0 &&
        double.parse(widget.avscore) <= 3.5 &&
        widget.season == "Autumn") {
      recommendation =
          "This pasture has some weed or plant density concerns.\nConsider under-sowing these pastures with a short-term Italian (such as Vibe or Appeal) or Hybrid Ryegrass like Frenzy. \nThis should increase the lifespan of the pasture by several years before full renovation is required.\nA late Autumn/Winter pasture spray may be required to control any weed issues.\n";
      product =
          "Vibe Italian Ryegrass	@12-18kg/ha.\nAppeal Italian Ryegrass @12-18kg/ha.\nFrenzy Hybrid Ryegrass	@15-20kg/ha.\n\nPasture spray with a 24D or MCPA/MCPB type product to control majority of weeds that may be present.";
    }
    if (double.parse(widget.avscore) > 3.5 &&
        double.parse(widget.avscore) <= 4.5 &&
        widget.season == "Autumn") {
      recommendation =
          "Apply pasture spray this autumn or winter to control any weeds beginning to take hold in pasture, apply pre-winter nitrogen to boost pasture covers and encourage tillering of pastures prior to winter.\nPaddock is probably okay for coming season.\n";
      product =
          "Pasture spray with a 24D or MCPA/MCPB type product to control majority of weeds that may be present.\n\nN-Protect @65-80kg/ha.\nAmmo 31 @90-110kg/ha if sulphur is known to be limiting.";
    }
    if (double.parse(widget.avscore) > 4.5 &&
        double.parse(widget.avscore) <= 5.0 &&
        widget.season == "Autumn") {
      recommendation =
          "Keep up the good work, this paddock has good levels of grass and clovers and minimal weed pressure. No action required. Stay on top of general fertiliser and good grazing management.\n";
      //  product = "";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 80,
        title: Column(
          children: [
            Container(
              padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
              child: Text(
                "Paddock Results",
                style: TextStyle(color: Colors.white, fontSize: 16.0),
                textAlign: TextAlign.right,
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
              child: Text(
                "Scroll down to send results.",
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        ),
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
                  ),
                ),
              );
            },
          ),
        ],
      ),
      body: Form(
        child: LayoutBuilder(
          builder: (BuildContext context, BoxConstraints viewportConstraints) {
            return SingleChildScrollView(

              child: Padding(
                padding: const EdgeInsets.fromLTRB(20.0, 20.0, 20, 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[
                    SizedBox(height: 20),
                    Container(
                        padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                        child: Text('Results:',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: Colors.green.shade900,
                            ))),

                    Divider(
                      color: Colors.green,
                      thickness: 1,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Farm:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ))),
                        Container(
                            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                            child: Text(widget.farmname,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Date:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ))),
                        Container(
                            padding: EdgeInsets.fromLTRB(45, 0, 0, 0),
                            child: Text(widget.datetoday,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),

                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Assessor:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ))),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(widget.assessor,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),
//================name ===============================
                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Paddock:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ))),
                        Container(
                            padding: EdgeInsets.fromLTRB(15, 0, 0, 0),
                            child: Text(widget.paddock,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),

//===================   Score ==========================================

                    Row(
                      children: [
                        Container(
                            padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                            child: Text('Score:',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black,
                                ))),
                        // Add spacing between values
                        Container(
                          padding: EdgeInsets.fromLTRB(35, 0, 0, 0),
                          child: Text(
                            double.tryParse(widget.avscore)
                                    ?.toStringAsFixed(1) ??
                                "-", // Handle null or parse error
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
//=====================    renovate =================
                    Row(
                      children: [
                        Container(
                          padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
                          child: Text(
                            'Renovate:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black,
                            ),
                          ),
                        ),
                        Container(
                            padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                            child: Text(widget.season,
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.green.shade900,
                                  fontWeight: FontWeight.bold,
                                ))),
                      ],
                    ),

                    Divider(
                      color: Colors.green,
                      thickness: 1,
                      height: 20,
                      indent: 5,
                      endIndent: 5,
                    ),

                    Container(
                      padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                      decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(10)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Recommendation:',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.green.shade900,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            recommendation,
                            style: TextStyle(fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 20),

                    if (double.parse(widget.avscore) <= 4.5) ...[
                      Container(
                        padding: EdgeInsets.fromLTRB(10, 20, 10, 20),
                        decoration: BoxDecoration(
                            color: Colors.grey[200],
                            borderRadius: BorderRadius.circular(10)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Product(s):',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.green.shade900,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            SizedBox(height: 10),
                            Text(
                              product,
                              style: TextStyle(fontSize: 14),
                            ),
                          ],
                        ),
                      ),
                    ],

                    //make a button go to send results page
                    Container(
                      padding: EdgeInsets.fromLTRB(60.0, 50.0, 60.0, 5.0),
                      child: ElevatedButton(
                        child: Text('Send',
                            style: TextStyle(
                              color: Colors.black,
                            )),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              //                 builder: (context) => scoring(
                              builder: (context) => sendresults(
                                datetoday: widget.datetoday,
                                paddock: widget.paddock,
                                farmname: widget.farmname,
                                assessor: widget.assessor,
                                emailController: widget.emailController,
                                product: product,
                                recommendation: recommendation,
                                avscore: widget.avscore,

                                // need to add season and average score here as a pass through
                              ),
                            ),
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.lime,
                          // Set background color to lime
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(
                                  30.0) // Set corner radius
                              ),
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                  ],
                ),
              ),
            );
          },
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
