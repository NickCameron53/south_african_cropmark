import 'package:flutter/material.dart';
import '../../../main.dart';

// ===============  financial return calculator ============

class cropcostcalculator extends StatefulWidget {
  cropcostcalculator({
    Key? key,
    required this.region,
    required this.species,
    required this.expyld,
    required this.seedcost,
  }) : super(key: key);
  final String region;
  final String species;
  final String expyld;
  final String seedcost;

  @override
  State<StatefulWidget> createState() {
    return _cropcostcalculatorState();
  }
}

class _cropcostcalculatorState extends State<cropcostcalculator> {
  late var expectedyield = TextEditingController(text: widget.expyld);
  late var seedcostspecies = TextEditingController(text: widget.seedcost);

  final sprayoutchem = new TextEditingController()..text = '40.0';
  final sprayoutcontractor = new TextEditingController()..text = '45.0';
  final cultivationcontractor = new TextEditingController()..text = '150.0';
  final drillingcontractor = new TextEditingController()..text = '190.0';
  final starterfertiliser = new TextEditingController()..text = '190.0';
  final slugbait = new TextEditingController()..text = '85.0';
  final postemergespray = new TextEditingController()..text = '90.0';
  final spraycontractor = new TextEditingController()..text = '45.0';
  final sidedressing = new TextEditingController()..text = '100.0';
  final maizesilage = new TextEditingController()..text = '30.0';
  final palmkernelpertonne = new TextEditingController()..text = '288.0';
  final freight = new TextEditingController()..text = '35.0';

  double costsperha = 0.0;
  double centsperkgdm = 0.0;
  double palmkernelperkgdm = 0.0;
  double versusmaizesilage = 0.0;
  double versuspalmkernel = 0.0;

  void _calculateCostsperha() {
    setState(() {
      costsperha = double.parse(seedcostspecies.text) +
          double.parse(sprayoutchem.text) +
          double.parse(sprayoutcontractor.text) +
          double.parse(cultivationcontractor.text) +
          double.parse(drillingcontractor.text) +
          double.parse(starterfertiliser.text) +
          double.parse(slugbait.text) +
          double.parse(postemergespray.text) +
          double.parse(spraycontractor.text) +
          double.parse(sidedressing.text);

      centsperkgdm = (costsperha / double.parse(expectedyield.text)) * 100;
      palmkernelperkgdm =
          (double.parse(palmkernelpertonne.text) + double.parse(freight.text)) *
              1.05 /
              1000 *
              100;
      versusmaizesilage = double.parse(maizesilage.text) - centsperkgdm;
      versuspalmkernel = palmkernelperkgdm - centsperkgdm;
    });
  }

  @override
  void initState() {
    super.initState();
    _calculateCostsperha();
  }

  get species => null;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
            title: Column(
              children: [
                Text(
                  widget.species,
                  style: TextStyle(color: Colors.white, fontSize: 18.0),
                  textAlign: TextAlign.center,
                ),
                Text(
                  "Financial Return Calculator",
                  style: TextStyle(color: Colors.white, fontSize: 16.0),
                  textAlign: TextAlign.right,
                ),
                Text(
                  "Scroll down to see all results",
                  style: TextStyle(color: Colors.white, fontSize: 12.0),
                  textAlign: TextAlign.right,
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
      body: Center(
        child: ListView(
          shrinkWrap: false,
          padding: EdgeInsets.all(5),
          children: <Widget>[
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 20.0, 12.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: "Crop Cost per hectare",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 20),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    widget.species + ' Seed Cost: ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                                (35 - 8) / 2), // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: seedcostspecies,
                      onChanged: (val) {
                        setState(() {
                          seedcostspecies.text = val;
                          seedcostspecies.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: seedcostspecies.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Sprayout chemical:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding: EdgeInsets.symmetric(
                            vertical:
                                (35 - 8) / 2), // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: sprayoutchem,
                      onChanged: (val) {
                        setState(() {
                          sprayoutchem.text = val;
                          sprayoutchem.selection = TextSelection.fromPosition(
                            TextPosition(offset: sprayoutchem.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),

            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Sprayout Contractor:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: sprayoutcontractor,
                      onChanged: (val) {
                        setState(() {
                          sprayoutcontractor.text = val;
                          sprayoutcontractor.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: sprayoutcontractor.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Cultivation Contractor:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: cultivationcontractor,
                      onChanged: (val) {
                        setState(() {
                          cultivationcontractor.text = val;
                          cultivationcontractor.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: cultivationcontractor.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Drilling Contractor:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: drillingcontractor,
                      onChanged: (val) {
                        setState(() {
                          drillingcontractor.text = val;
                          drillingcontractor.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: drillingcontractor.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Starter Fertiliser:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: starterfertiliser,
                      onChanged: (val) {
                        setState(() {
                          starterfertiliser.text = val;
                          starterfertiliser.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: starterfertiliser.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Slug bait:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: slugbait,
                      onChanged: (val) {
                        setState(() {
                          slugbait.text = val;
                          slugbait.selection = TextSelection.fromPosition(
                            TextPosition(offset: slugbait.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Post emerge spraying:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: postemergespray,
                      onChanged: (val) {
                        setState(() {
                          postemergespray.text = val;
                          postemergespray.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: postemergespray.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Spray Contractor:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: spraycontractor,
                      onChanged: (val) {
                        setState(() {
                          spraycontractor.text = val;
                          spraycontractor.selection =
                              TextSelection.fromPosition(
                            TextPosition(offset: spraycontractor.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Side Dressing:',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: sidedressing,
                      onChanged: (val) {
                        setState(() {
                          sidedressing.text = val;
                          sidedressing.selection = TextSelection.fromPosition(
                            TextPosition(offset: sidedressing.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Expected Yield (kg DM/ha):',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: expectedyield,
                      onChanged: (val) {
                        setState(() {
                          expectedyield.text = val;
                          expectedyield.selection = TextSelection.fromPosition(
                            TextPosition(offset: expectedyield.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(0, 20, 0, 20),
              child: Divider(
                color: Colors.green, //color of divider
                height: 5, //height spacing of divider
                thickness: 1, //thickness of divider line
                //spacing at the end of divider
              ),
            ),
            Container(
              padding: EdgeInsets.fromLTRB(20.0, 0.0, 12.0, 2.0),
              child: RichText(
                text: TextSpan(
                  text: "Alternative Options:",
                  style: TextStyle(
                      color: Colors.green[800],
                      fontSize: 16,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Maize silage (cost in stack):',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: maizesilage,
                      onChanged: (val) {
                        setState(() {
                          maizesilage.text = val;
                          maizesilage.selection = TextSelection.fromPosition(
                            TextPosition(offset: maizesilage.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'Palm Kernel/Blend (cost/Tonne):',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: palmkernelpertonne,
                      onChanged: (val) {
                        setState(() {
                          palmkernelpertonne.text = val;
                          palmkernelpertonne.selection =
                              TextSelection.fromPosition(
                            TextPosition(
                                offset: palmkernelpertonne.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: 200,
                  padding: EdgeInsets.fromLTRB(10.0, 0.0, 0, 0),
                  child: Text(
                    'PKE freight  (cost/Tonne):',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 13,
                    ),
                  ),
                ),
                Container(
                  width: 20,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  child: Text(
                    '\$ ',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
                Container(
                  width: 70,
                  height: 35,
                  padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: Align(
                    alignment: Alignment.center,
                    child: TextFormField(
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.symmetric(vertical: (35 - 8) / 2),
                        // Adjust based on font size
                        border: InputBorder.none,
                      ),
                      style: TextStyle(fontSize: 14),
                      cursorColor: Colors.teal,
                      textAlign: TextAlign.center,
                      // This line centers the text horizontally
                      controller: freight,
                      onChanged: (val) {
                        setState(() {
                          freight.text = val;
                          freight.selection = TextSelection.fromPosition(
                            TextPosition(offset: freight.text.length),
                          );
                          _calculateCostsperha();
                        });
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10.0, 10.0, 12.0, 10.0),
              child: RichText(
                text: TextSpan(
                  text:
                      "Note that these default costings are approximate and for more accuracy use known costings.",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),

            //============ table of outputs ====================
            Padding(
              padding: EdgeInsets.all(8),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.green.shade600, // Optional background color
                  borderRadius: BorderRadius.circular(10),
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.green.shade800,
                    ),
                  ),
                ),
                child: Table(
                  columnWidths: {
                    0: FractionColumnWidth(0.75),
                    1: FractionColumnWidth(0.25),
                  },
                  children: [
                    // top table row
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.green.shade900,
                          width: 0.4,
                        )),
                        borderRadius: BorderRadius.only(
                          //  setting the border radius circular for the top row
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10),
                        ),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              widget.species + ' crop costs (per ha):',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            '\$ ' + costsperha.toStringAsFixed(2),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
// second row
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.green.shade900,
                          width: 0.4,
                        )),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              widget.species + ' crop cost: (cents/kgDM)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            centsperkgdm.toStringAsFixed(2),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
                    // 3rd row
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.green.shade900,
                          width: 0.4,
                        )),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Maize silage cost:  (cents/kgDM)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            maizesilage.text,
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
// 4th row
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.green.shade900,
                          width: 0.4,
                        )),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Palm Kernel cost:  (cents/kgDM)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            palmkernelperkgdm.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),
// 5th row
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        border: Border(
                            bottom: BorderSide(
                          color: Colors.green.shade900,
                          width: 0.4,
                        )),
                      ),
                      children: [
                        ConstrainedBox(
                          constraints: BoxConstraints(minHeight: 50.0),
                          child: Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Benefit of ' +
                                  widget.species +
                                  ' over maize silage (cents/kgDM)',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            versusmaizesilage.toStringAsFixed(1),
                            style: TextStyle(color: Colors.white, fontSize: 12),
                          ),
                        ),
                      ],
                    ),

                    // last table row
                    TableRow(
                      decoration: BoxDecoration(
                        color: Colors.green.shade600,
                        borderRadius: BorderRadius.only(
                          //  setting the border radius circular for the bottom row
                          bottomLeft: Radius.circular(10),
                          bottomRight: Radius.circular(10),
                        ),
                      ),
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                          child: Text(
                            'Benefit of ' +
                                widget.species +
                                ' over PKE\n (cents/kgDM)',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                          child: Text(
                            versuspalmkernel.toStringAsFixed(1),
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),

            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
