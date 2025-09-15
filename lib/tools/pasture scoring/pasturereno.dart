import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';
import 'farmdetail.dart';

class pasturereno extends StatefulWidget {
  pasturereno({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _pasturerenoState();
  }
}

class _pasturerenoState extends State<pasturereno> {
  final farmname = TextEditingController()..text = '';
  final paddock = TextEditingController()..text = '';
  final assessor = new TextEditingController()..text = '';
  final datetoday = new TextEditingController()
    ..text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  final TextEditingController emailController = new TextEditingController();

  String recommendation = '';
  String product = '';

  _makingPhoneCall() async {
    var url = Uri.parse('tel:0800427676');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: PreferredSize(
            preferredSize: Size.fromHeight(85),
            child: AppBar(toolbarHeight: 85,
                title: Column(
                  children: [
                    Text(
                      'Pasture Scoring Tool',
                      style: TextStyle(color: Colors.white, fontSize: 15.0),
                      textAlign: TextAlign.center,
                    ),
                    Text(
                      'Call the regional representative\nfor any assistance in using this tool. ',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                      textAlign: TextAlign.right,
                    ),
                    Text(
                      'Scroll down. ',
                      style: TextStyle(color: Colors.white, fontSize: 12.0),
                      textAlign: TextAlign.right,
                    ),
                  ],
                ),
                backgroundColor:Colors.green[800],
                foregroundColor: Colors.white,
                actions: <Widget>[
                  IconButton(
                    icon: Icon(Icons.call),
                    onPressed: (_makingPhoneCall),
                  ),
                ])),
        body: Center(
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.all(5),
            children: <Widget>[
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 20.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Guide to the use of the tool:",
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.fromLTRB(10.0, 0.0, 3.0, 5.0),
                child: RichText(
                  text: TextSpan(
                    text:
                        "\n\u25BA This scoring tool gives an indication of pasture health and pasture performance and allows  identification of under performing paddocks."
                        "\n\n\u25BA  The assessor walks a transect of the paddock making observations based on a 1 to 5 score."
                        "\n\n\u25BA When the walk is finished the scores are averaged and recommendations are made as to appropriate actions and products to improve under performing paddocks."
                        "\n\n\u25BA The scores are based on the following examples and descriptions:",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                    ),
                  ),
                ),
              ),
              DataTable(
                columnSpacing: 0,
                dataRowMaxHeight: double.infinity,
                dataTextStyle: TextStyle(
                  fontSize: 13,
                  color: Colors.black,
                ),
                headingRowHeight: (35),
                border: TableBorder.symmetric(
                  inside: BorderSide(color: Colors.transparent, width: 1),
                ),
                headingRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.red.shade700),
                dataRowColor: WidgetStateColor.resolveWith(
                    (states) => Colors.lime.shade200),
                columns: <DataColumn>[
                  DataColumn(
                    label: Text(
                      'Score',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '   Description',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  DataColumn(
                    label: Text(
                      '  Example',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
                rows: <DataRow>[
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          '5',
                        ),
                      ),
                      DataCell(
                        Text(
                          'Whole paddock has dense sward of desired grasses and clovers.',
                        ),
                      ),
                      DataCell(
                        Image.asset(
                          'assets/score5.png',
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          '4',
                        ),
                      ),
                      DataCell(
                        Text(
                          'Parts of the paddock show signs of low level damage, less vigorous grasses and some weeds.',
                        ),
                      ),
                      DataCell(
                        Image.asset(
                          'assets/score4.png',
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          '3',
                        ),
                      ),
                      DataCell(
                        Text(
                          'Majority of paddock has low level damage, weeds, and less vigorous grasses.',
                        ),
                      ),
                      DataCell(
                        Image.asset(
                          'assets/score3.png',
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          '2',
                        ),
                      ),
                      DataCell(
                        Text(
                          'Parts of the paddock have severe damage, a lot of weeds and bare ground.',
                        ),
                      ),
                      DataCell(
                        Image.asset(
                          'assets/score2.png',
                        ),
                      ),
                    ],
                  ),
                  DataRow(
                    cells: <DataCell>[
                      DataCell(
                        Text(
                          '1',
                        ),
                      ),
                      DataCell(
                        Text(
                          'Entire paddock severely damaged from pugging and loss of plants, weeds present throughout paddock ',
                        ),
                      ),
                      DataCell(
                        Image.asset(
                          'assets/score1resize.png',
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.fromLTRB(80.0, 5.0, 80.0, 5.0),
                child: ElevatedButton(
                    child: Text('Continue',
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        )),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => farmdetail()),
                      );
                    }),
              ),

// cropmark logo
              Container(
                child: Image.asset('assets/cropmarklogo.png'),
                height: 60,
              ),
            ],
          ),
        ));
  }
}
