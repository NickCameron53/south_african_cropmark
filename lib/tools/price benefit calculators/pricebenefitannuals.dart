import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class pricebenefitannuals extends StatefulWidget {
  pricebenefitannuals({
    Key? key,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _pricebenefitannualsState();
  }
}

class _pricebenefitannualsState extends State<pricebenefitannuals> {
  List<TextFormField> textFormFields = [];
  String selectedRegion = 'South Africa';
  String checkRegion = 'None';
  String selectedCultivar1 = 'Rampage';
  String selectedCultivar2 = 'Tama';
  double seedPrice1 = 55.48;
  double seedPrice2 = 48.00;
  double seedRate1 = 28;
  double seedRate2 = 28;
  double seedCost1 = 1553.44;
  double seedCost2 = 1344.00;
  double autvalue = 4.2;
  double winvalue = 3.2;
  double espvalue = 5.9;
  double lspvalue = 2.1;
  double aututil = 90;
  double winutil = 90;
  double esputil = 90;
  double lsputil = 75;
  double winbenefit = 0.0;
  double espbenefit = 0.0;
  double lspbenefit = 0.0;
  double autbenefit = 0.0;
  double totbenefit = 0.0;
  double priceBenefit = 0.0;

  List<Cultivar> cultivars = [];
  List<Cultivar> standards = [];

  // function to calculate autumn benefit
  void calculateAutBenefit() {
    autbenefit = (cultivars[cultivars.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar1)]
                .autyield -
            standards[standards.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar2)]
                .autyield) *
        (autvalue) *
        (aututil / 100);
  }

  // function to calculate winter benefit
  void calculateWinBenefit() {
    winbenefit = (cultivars[cultivars.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar1)]
                .winyield -
            standards[standards.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar2)]
                .winyield) *
        (winvalue) *
        (winutil / 100);
  }

  // function to calculate early spring benefit
  void calculateEspBenefit() {
    espbenefit = (cultivars[cultivars.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar1)]
                .espyield -
            standards[standards.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar2)]
                .espyield) *
        (espvalue) *
        (esputil / 100);
  }

  // function to calculate late spring benefit
  void calculateLspBenefit() {
    lspbenefit = (cultivars[cultivars.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar1)]
                .lspyield -
            standards[standards.indexWhere(
                    (cultivar) => cultivar.name == selectedCultivar2)]
                .lspyield) *
        (lspvalue) *
        (lsputil / 100);
  }

  void updateSeedCost() {
    if (selectedCultivar1 == selectedCultivar2) {
      priceBenefit = 0.0;
    } else {
      seedCost1 = seedRate1 * seedPrice1;
      seedCost2 = seedRate2 * seedPrice2;
      priceBenefit = totbenefit - (seedCost1 - seedCost2);
      setState(() {}); // Trigger UI updates if needed
    }
  }

  void calculatePriceBenefit() {
    setState(() {
      if (selectedCultivar1 == selectedCultivar2) {
        priceBenefit = 0.0;
      } else {
        updateSeedCost();
        // split the calculations into separate functions for easier management
        calculateAutBenefit();
        calculateWinBenefit();
        calculateEspBenefit();
        calculateLspBenefit();

        totbenefit = autbenefit + winbenefit + espbenefit + lspbenefit;
        priceBenefit = totbenefit - (seedCost1 - seedCost2);
      }
    });
  }

  // controllers which change values of $/kg DM for different seasons whenever a different region is selected
  TextEditingController controller1 = TextEditingController();
  TextEditingController controller2 = TextEditingController();
  TextEditingController controller3 = TextEditingController();
  TextEditingController controller4 = TextEditingController();
  TextEditingController controller5 = TextEditingController();

// LIST FOR EACH REGION ==============
  List<Cultivar> cultivarsSouthAfrica = [
    Cultivar('Rampage', 1943, 1899, 3007, 4217, 11066, 4.2, 3.2, 5.9, 2.1, 55.48, 28),
    Cultivar('Dash', 1560, 1803, 3013, 3909, 10284, 4.2, 3.2, 5.9, 2.1, 55.48, 28),
    Cultivar('Zoom', 1618, 1868, 2875, 3790, 10151, 4.2, 3.2, 5.9, 2.1, 55.48, 28),
    Cultivar('Tama', 1405, 1784, 2698, 3327, 9213, 4.2, 3.2, 5.9, 2.1, 48.00, 28),
  ];


  List<Cultivar> standardsSouthAfrica = [
    Cultivar(
        'Tama', 1405, 1784, 2698, 3327, 9213, 4.2, 3.2, 5.9, 2.1, 48.00, 28),
  ];


  @override
  void initState() {
    super.initState();
    _populateCultivarList();
    updateSeedCost();
    calculatePriceBenefit();
  }

  _makingPhoneCall() async {
    var url = Uri.parse('tel:0800427676');
    if (await canLaunchUrl(url)) {
      await launchUrl(url);
    } else {
      throw 'Could not launch $url';
    }
  }



  _populateCultivarList() {
    // show correct values of $/kg DM whenever a different region is selected
    if (checkRegion != selectedRegion) {
      checkRegion = selectedRegion;
      late List<double> valueList;
      setState(() {
        switch (selectedRegion) {
          case 'South Africa':
            cultivars = cultivarsSouthAfrica;
            standards = standardsSouthAfrica;
            valueList = [
              cultivars[0].autvalue,
              cultivars[0].winvalue,
              cultivars[0].espvalue,
              cultivars[0].lspvalue
            ];
            break;
         
          default:
            valueList = [0.00, 0.00, 0.00, 0.00];
        }
      });
      controller1.text = valueList[0].toStringAsFixed(2);
      controller2.text = valueList[1].toStringAsFixed(2);
      controller3.text = valueList[2].toStringAsFixed(2);
      controller4.text = valueList[3].toStringAsFixed(2);

      // reset the values to default values when a new region is selected
      autvalue = valueList[0];
      winvalue = valueList[1];
      espvalue = valueList[2];
      lspvalue = valueList[3];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          toolbarHeight: 85,
          title: Column(
            children: [
              Text(
                'A Financial Benefit Tool\nto compare Annual Ryegrass cultivars. ',
                style: TextStyle(color: Colors.white, fontSize: 12.0),
                textAlign: TextAlign.center,
              ),
              Text(
                '\nScroll down. ',
                style: TextStyle(color: Colors.white, fontSize: 11.0),
                textAlign: TextAlign.right,
              ),
            ],
          ),
          backgroundColor: Colors.green[800],
          foregroundColor: Colors.white,
          actions: <Widget>[
            IconButton(
              icon: Icon(Icons.call),
              onPressed: (_makingPhoneCall),
            ),
          ],
        ),
        body: Center(
          child: ListView(
            shrinkWrap: false,
            padding: EdgeInsets.all(5),
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 260,
                  child: Text(
                    'Price Benefit Tool to compare cultivars.',
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              Center(
                child: Container(
                  width: 260,
                  child: Text(
                    'Use your default region or select another',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 5),
              Center(
                child: Container(
                  padding: EdgeInsets.fromLTRB(20.0, 0.0, 10, 0),
                  width: 260,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.white,
                    border: Border.all(color: Colors.black, width: 1.0),
                  ),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      dropdownColor: Colors.white,
                      value: selectedRegion,
                      onChanged: (value) {
                        setState(() {
                          selectedRegion = value!;
                          _populateCultivarList();
                          calculatePriceBenefit();
                          // Call a function to update the cultivar list
                        });
                      },
                      items: <String>[
                        'South Africa',

                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(
                            value,
                            style: TextStyle(
                                color: Colors.green[800],
                                fontSize: 15,
                                fontWeight: FontWeight.bold),
                          ),
                        );
                      }).toList(),
                      icon: Icon(Icons.keyboard_arrow_down_outlined,
                          color: Colors.green.shade800, size: 32.0),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.fromLTRB(30.0, 20.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Select cultivars for comparison:",
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Container(
                padding: EdgeInsets.fromLTRB(30, 0, 0, 0),
                child: Row(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: selectedCultivar1,
                          onChanged: (value) {
                            setState(() {
                              selectedCultivar1 = value!;
                            });
                            seedPrice1 = cultivars[cultivars.indexWhere(
                                    (cultivar) =>
                                        cultivar.name == selectedCultivar1)]
                                .seedPrice;
                            seedRate1 = cultivars[cultivars.indexWhere(
                                    (cultivar) =>
                                        cultivar.name == selectedCultivar1)]
                                .seedRate;
                            _populateCultivarList();
                            updateSeedCost();
                            calculatePriceBenefit();

                          },
                          items: cultivars
                              .map((cultivar) => DropdownMenuItem(
                                  value: cultivar.name,
                                  child: Text(
                                    cultivar.name,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )))
                              .toList(),
                          icon: Icon(Icons.keyboard_arrow_down_outlined,
                              color: Colors.green.shade800, size: 32.0),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    Container(
                      padding: EdgeInsets.fromLTRB(10, 0, 0, 0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        color: Colors.white,
                        border: Border.all(color: Colors.black, width: 1.0),
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          dropdownColor: Colors.white,
                          value: selectedCultivar2,
                          onChanged: (value) {
                            setState(() {
                              selectedCultivar2 = value!;
                            });
                            seedPrice2 = cultivars[cultivars.indexWhere(
                                    (cultivar) =>
                                        cultivar.name == selectedCultivar2)]
                                .seedPrice;
                            seedRate2 = cultivars[cultivars.indexWhere(
                                    (cultivar) =>
                                        cultivar.name == selectedCultivar2)]
                                .seedRate;
                            _populateCultivarList();
                            updateSeedCost();
                            calculatePriceBenefit();
                          },
                          items: standards
                              .map((cultivar) => DropdownMenuItem(
                                  value: cultivar.name,
                                  child: Text(
                                    cultivar.name,
                                    style: TextStyle(
                                        color: Colors.green.shade800,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  )))
                              .toList(),
                          icon: Icon(Icons.keyboard_arrow_down_outlined,
                              color: Colors.green.shade800, size: 32.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 30),

              Container(
                padding: EdgeInsets.fromLTRB(30.0, 20.0, 12.0, 2.0),
                child: RichText(
                  text: TextSpan(
                    text: "Financial benefit for the year:",
                    style: TextStyle(
                        color: Colors.green[800],
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SizedBox(height: 10),

              Padding(
                padding: EdgeInsets.all(8),
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.green.shade600, // Optional background color
                    borderRadius: BorderRadius.circular(10),
                    border: Border(
                      bottom: BorderSide(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  child: Table(
                    columnWidths: {
                      0: FractionColumnWidth(0.70),
                      1: FractionColumnWidth(0.3),
                    },
                    children: [
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.lime,
                          border: Border(
                              bottom: BorderSide(
                            color: Colors.black,
                            width: 0.4,
                          )),
                          borderRadius: BorderRadius.only(
                            //  setting the border radius circular for the top row
                            topLeft: Radius.circular(10),
                            topRight: Radius.circular(10),
                          ),
                        ),
                        children: [
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              'Financial benefit for',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
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
                            padding:
                                const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                            child: Text(
                              '$selectedCultivar1 over $selectedCultivar2:',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(0.0, 10.0, 0, 10),
                            child: Text(
                              ' \R${priceBenefit.toStringAsFixed(0)}/ha/yr',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),



              Container(
                padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 20.0),
                child: Text(
                    style: TextStyle(
                      color: Colors.green.shade800,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                    'Customise your seed price and sowing rate:\nDefault values are provided.'),
              ),
// ==========  price rate and cost for first cultivar =================
              Container(
                width: 230,
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 0, 0),
                child: Text(
                  '$selectedCultivar1:',
                  style: TextStyle(
                    color: Colors.green.shade800,
                    fontSize: 15, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // text editing box for seed price first cultivar
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 115,
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 0, 0),
                    child: Text(
                      ' Price/kg:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                    child: Text(
                      'Rate kg/ha:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                    child: Text(
                      ' Seed Cost/ha',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              // text editing box for seed rate first cultivar
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            ' \R${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].seedPrice.toStringAsFixed(2)}',
                      ),
                      onChanged: (value) {
                        setState(() {
                          seedPrice1 = double.parse(value);
                        });
                        calculatePriceBenefit();
                        _populateCultivarList();
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                  Container(
                    width: 90,
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            '  ${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].seedRate.toStringAsFixed(1)}',
                      ),
                      onChanged: (value) {
                        setState(() {
                          seedRate1 = double.parse(value);
                        });
                        calculatePriceBenefit();
                        _populateCultivarList();
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
                    child: Text(
                      '\R${seedCost1.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),

              // ==========  price rate and cost for second cultivar =================
              Container(
                width: 230,
                padding: EdgeInsets.fromLTRB(20.0, 0.0, 0, 0),
                child: Text(
                  '$selectedCultivar2:',
                  style: TextStyle(
                    color: Colors.green.shade800,
                    fontSize: 15, fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),

              // text editing box for seed price second cultivar
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 115,
                    padding: EdgeInsets.fromLTRB(20.0, 0.0, 0, 0),
                    child: Text(
                      ' Price/kg:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                    child: Text(
                      'Rate kg/ha:',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Container(
                    width: 110,
                    padding: EdgeInsets.fromLTRB(0.0, 0.0, 0, 0),
                    child: Text(
                      ' Seed Cost/ha',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),

              // text editing box for seed rate second cultivar
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Container(
                    width: 100,
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            ' \R${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].seedPrice.toStringAsFixed(2)}',
                      ),
                      onChanged: (value) {
                        setState(() {
                          seedPrice2 = double.parse(value);
                        });
                        calculatePriceBenefit();
                        _populateCultivarList();
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                  Container(
                    width: 90,
                    padding: EdgeInsets.fromLTRB(20, 0, 10, 0),
                    child: TextFormField(
                      decoration: InputDecoration(
                        labelText:
                            '  ${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].seedRate.toStringAsFixed(1)}',
                      ),
                      onChanged: (value) {
                        setState(() {
                          seedRate2 = double.parse(value);
                        });
                        calculatePriceBenefit();
                        _populateCultivarList();
                      },
                      keyboardType: const TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                    ),
                  ),
                  Container(
                    width: 100,
                    padding: EdgeInsets.fromLTRB(40.0, 0.0, 0, 0),
                    child: Text(
                      '\R${seedCost2.toStringAsFixed(0)}',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                      ),
                    ),
                  ),
                ],
              ),

              // ======================================================================

              Container(
                padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 10.0),
                child: Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                    "These calculations use the following Seasonal Feed values sourced from Dairy NZ and estimated % pasture utilisation, which are specific for each Region selected."
                    "\n\nYou can change the values of \R kg DM and % Utilisation."),
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
                      0: FractionColumnWidth(0.35),
                      1: FractionColumnWidth(0.28),
                      2: FractionColumnWidth(0.03),
                      3: FractionColumnWidth(0.28),
                      4: FractionColumnWidth(0.06),
                    },
                    children: [
                      // top table row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.lime,
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
                            constraints: BoxConstraints(minHeight: 30.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Season',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '\R/kg DM',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '\% Utilisation',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
// spacer row
                      TableRow(
                        children: [
                          Container(
                            height: 10,
                          ),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
// second row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Autumn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              10.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                controller: controller1,
                                onChanged: (value) {
                                  setState(() {
                                    autvalue = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              20.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                initialValue: aututil.toStringAsFixed(0),
                                onChanged: (value) {
                                  setState(() {
                                    aututil = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),

                      // 3rd row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Winter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              10.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                controller: controller2,
                                onChanged: (value) {
                                  setState(() {
                                    winvalue = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              20.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                initialValue: winutil.toStringAsFixed(0),
                                onChanged: (value) {
                                  setState(() {
                                    winutil = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),

// 3rd row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Early Spring',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              10.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                controller: controller3,
                                onChanged: (value) {
                                  setState(() {
                                    espvalue = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              20.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                initialValue: esputil.toStringAsFixed(0),
                                onChanged: (value) {
                                  setState(() {
                                    esputil = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
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
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Late Spring',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              10.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                controller: controller4,
                                onChanged: (value) {
                                  setState(() {
                                    lspvalue = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                          Container(
                            width: 50,
                            height: 35,
                            padding: EdgeInsets.fromLTRB(
                              10,
                              20.0,
                              20.0,
                              0.0,
                            ),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              color: Colors.green,
                              border: Border.all(
                                  color: Colors.green.shade800, width: 1.0),
                            ),
                            child: Align(
                              alignment: Alignment.center,
                              child: TextFormField(
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.symmetric(
                                    vertical: (35 - 8) / 2,
                                    horizontal: (1),
                                  ),
                                  // Adjust based on font size
                                  border: InputBorder.none,
                                ),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                                initialValue: lsputil.toStringAsFixed(0),
                                onChanged: (value) {
                                  setState(() {
                                    lsputil = double.parse(value);
                                    calculatePriceBenefit();
                                    _populateCultivarList();
                                    updateSeedCost;
                                  });
                                },
                                keyboardType:
                                    const TextInputType.numberWithOptions(
                                        signed: true, decimal: true),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

// ================   end of table ==========================================

              Container(
                padding: EdgeInsets.fromLTRB(10, 20.0, 12.0, 0.0),
                child: Text(
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 11,
                    ),
                    "Yield data in Kg DM/ha comes from New Zealand and is used to illustrate what might happen in South Africa when using an improved cultivar."),
              ),

              // =========  yield data table =========================================

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
                      0: FractionColumnWidth(0.35),
                      1: FractionColumnWidth(0.28),
                      2: FractionColumnWidth(0.03),
                      3: FractionColumnWidth(0.28),
                      4: FractionColumnWidth(0.06),
                    },
                    children: [
                      // top table row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.lime,
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
                            constraints: BoxConstraints(minHeight: 30.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Season',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '$selectedCultivar1',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '$selectedCultivar2',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.fromLTRB(10.0, 10.0, 0, 10),
                            child: Text(
                              '',
                              style:
                                  TextStyle(color: Colors.black, fontSize: 12),
                            ),
                          ),
                        ],
                      ),
// spacer row
                      TableRow(
                        children: [
                          Container(
                            height: 10,
                          ),
                          Container(),
                          Container(),
                          Container(),
                          Container(),
                        ],
                      ),
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Autumn',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].autyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${standards[standards.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].autyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
// second row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Winter',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].winyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${standards[standards.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].winyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),

                      // 3rd row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Early Spring',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].espyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${standards[standards.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].espyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),

// 4th row
                      TableRow(
                        decoration: BoxDecoration(
                          color: Colors.green.shade600,
                        ),
                        children: [
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Late Spring',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].lspyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${standards[standards.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].lspyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
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
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                'Total',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${cultivars[cultivars.indexWhere((cultivar) => cultivar.name == selectedCultivar1)].totyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                          ConstrainedBox(
                            constraints: BoxConstraints(minHeight: 50.0),
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(20.0, 10.0, 0, 10),
                              child: Text(
                                '${standards[standards.indexWhere((cultivar) => cultivar.name == selectedCultivar2)].totyield.toStringAsFixed(0)} ',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                          Container(),
                        ],
                      ),
                    ],
                  ),
                ),
              ),

// ================   end of table ==========================================
              SizedBox(height: 20),
              // Add the DataTable for National trial results


            ],
          ),
        ));
  }
}

class Cultivar {
  final String name;
  final double autyield;
  final double winyield;
  final double espyield;
  final double lspyield;
  final double totyield;
  final double autvalue;
  final double winvalue;
  final double espvalue;
  final double lspvalue;
  final double seedPrice;
  final double seedRate;

  Cultivar(
      this.name,
      this.autyield,
      this.winyield,
      this.espyield,
      this.lspyield,
      this.totyield,
      this.autvalue,
      this.winvalue,
      this.espvalue,
      this.lspvalue,
      this.seedPrice,
      this.seedRate);
}
