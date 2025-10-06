import '../../global_widgets.dart';
import '../../legumes/sub%20clover/antas.dart';
import '../../legumes/sub%20clover/bindoon.dart';
import '../../legumes/sub%20clover/coolamon.dart';
import '../../legumes/sub%20clover/denmark.dart';
import '../../legumes/sub%20clover/narrikup.dart';
import '../../legumes/sub%20clover/rosabrook.dart';
import '../../legumes/sub%20clover/rouse.dart';
import '../../legumes/sub%20clover/woogenellup.dart';
import '../../select%20species/Legume/cultivar_card_subclover.dart';
import 'package:flutter/material.dart';
import '../../main.dart';

class subclover extends StatefulWidget {
  subclover({
    Key? key,
    required this.country,
    required this.region,
  }) : super(key: key);
  final String country, region;

  @override
  State<subclover> createState() {
    return _subcloverState();
  }
}

class _subcloverState extends State<subclover> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
            title: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Sub Clover',
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
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
                            )),
                  );
                },
              ),
            ]),
      ),
      body: ListView(
        children: [
          Container(
            // This container wraps all content within the list

            child: Column(
              // Use Column to manage the vertical layout

              children: [
                Container(
                  width: MediaQuery.of(context)
                      .size
                      .width, // Takes full width of the screen
                  height: 100,
                  child: Image.asset(
                    'assets/whitecloverpic.png',
                    fit: BoxFit
                        .cover, // Use BoxFit.cover to cover the entire area
                  ),
                ),
                Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 10.0, 2.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 50),
                        width: 350,
                        child: Column(
                          children: [
                            Text('Sub Clover',
                                style: TextStyle(
                                    fontSize: 24,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700])),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.green,
                              thickness: 1,
                              height: 20,
                              indent: 5,
                              endIndent: 5,
                            ),
                            SizedBox(height: 10),
                            Container(
                              child: Text(
                                  "Sub clover is an annual clover mostly suited to acid soils for use in areas of low rainfall with dry summers. The mature plant buries it’s seedhead under the soil surface and regenerates through reseeding with autumn rains. Part of the seed set contains a percentage of hard seeds. Some of these seeds will germinate one or two years later. This helps protect the plant from ‘false strikes’ where early germination is followed by drought and loss of seedlings. Sub clovers are resistant to clover root weevil. Late heading cultivars give better spring growth. In the first year maximise seed yield by de-stocking at flowering until growth has dried off. After germination in autumn, de-stock until lateral roots are running.",
                                  style: TextStyle(fontSize: 15)),
                            ),
                            SizedBox(height: 10),
                            Divider(
                              color: Colors.green,
                              thickness: 1,
                              height: 20,
                              indent: 5,
                              endIndent: 5,
                            ),
                            SizedBox(height: 10),
                            Text('Recommended cultivars:',
                                style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.green[700])),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Bindoon',
                                  link: bindoon(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Highly productive cultivar suited to summer-dry areas with well drained soils.',
                                  maturity: 'Early to Mid',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Antas',
                                  link: antas(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Belongs to the sub species Brachycalycinum, and is a black seeded sub clover.',
                                  maturity: 'Mid to Late',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Coolamon',
                                  link: coolamon(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'A winter active cultivar with high seedling regeneration and hard seeded content to provide a large seed bank for subsequent years.',
                                  maturity: 'Mid',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Woogenellup',
                                  link: woogenellup(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Black seeded with low levels of hard seed.',
                                  maturity: 'Mid',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Narrikup',
                                  link: narrikup(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Black seeded with low levels of hard seed.',
                                  maturity: 'Mid',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Rouse',
                                  link: rouse(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Waterlogging-tolerant ‘white-seeded’ yanninicum sub-species of sub clover.',
                                  maturity: 'Mid to Late',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Denmark',
                                  link: denmark(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'High yielding variety. Moderate hard seed levels (15%). Is adapted to higher rainfall situations.',
                                  maturity: 'Late',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                            Container(
                              child: cultivarcardsubclover(
                                  title: 'Rosabrook',
                                  link: rosabrook(
                                    country: widget.country,
                                    region: widget.region,
                                  ),
                                  description:
                                      'Black seeded cultivar suited to areas where the season will continue to mid-late November.',
                                  maturity: 'Late',
                                  persistence: '1 year'),
                            ),
                            SizedBox(height: 40),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: GlobalWidgets.buildBottomNavigationBar(context),

    );
  }
}
