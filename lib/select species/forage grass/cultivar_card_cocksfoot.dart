import 'package:flutter/material.dart';

class cultivarcardcocksfoot extends StatelessWidget {
  const cultivarcardcocksfoot({
    super.key,
    required this.title,
    required this.link,
    required this.description,
    required this.date,
        required this.type,
  });

  final String title, description, date,  type;
  final Widget link;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: Future.sync(() => null),
        builder: (context, snapshot) {
// Handle different connection states
          switch (snapshot.connectionState) {
            case ConnectionState.done:
              return Column(children: [
                Container(
                    height: 70,
                    width: 325,
                    decoration: BoxDecoration(
                        color: Colors.green.shade800,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(20.0),
                          topRight: Radius.circular(20.0),
                        )),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(left: 20),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.only(right: 20),
                            child: ClipOval(
                                child: Material(
                                    color: Colors.white,
                                    child: InkWell(
                                        onTap: () {
                                          // Add your button onPressed logic here
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) => link),
                                          );
                                        },
                                        child: SizedBox(
                                            width: 50,
                                            height: 50,
                                            child: Center(
                                                child: Text(
                                                  '>',
                                                  style: TextStyle(
                                                      color: Colors.green.shade800,
                                                      fontWeight: FontWeight.bold,
                                                      fontSize: 30),
                                                ))))))),
                      ],
                    )),
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
                        )),
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        children: [
                          Text(description, style: TextStyle(fontSize: 12)),
                          SizedBox(height: 5),
                          Divider(
                            color: Colors.green.shade800,
                            thickness: 1,
                            height: 20,
                            indent: 5,
                            endIndent: 5,
                          ),
                          Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text('Heading date:',
                                          style: TextStyle(fontSize: 12)),
                                      Text(date,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ],
                                  )),

                              Container(
                                  margin: EdgeInsets.all(5.0),
                                  child: Column(
                                    children: [
                                      Text('Type:',
                                          style: TextStyle(fontSize: 12)),
                                      Text(type,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13)),
                                    ],
                                  )),
                            ],
                          )
                        ],
                      ),
                    )),
              ]);

            default:
            // Show a loading indicator while waiting
              return Center(child: CircularProgressIndicator());
          }
        });
  }
}