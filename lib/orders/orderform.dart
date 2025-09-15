import 'package:flutter/material.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

void launchURL(url) async {
  if (await launchUrl(Uri.parse(url))) {
    print("Successfully launched URL: $url"); // Optional success message
  } else {
    // Handle case where url can't be launched (e.g., show a message)
    print("Could not launch $url");
  }
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Order Form',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrderForm(),
    );
  }
}

class ProductItem {
  String forageType;
  String product;
  String quantity;
  String unit;

  ProductItem({
    required this.forageType,
    required this.product,
    required this.quantity,
    required this.unit,
  });
}

class OrderForm extends StatefulWidget {
  @override
  _OrderFormState createState() => _OrderFormState();
}

class _OrderFormState extends State<OrderForm> {
  final _formKey = GlobalKey<FormState>();
  final datetoday = TextEditingController()
    ..text = DateFormat('dd-MM-yyyy').format(DateTime.now());
  final firstname = TextEditingController();
  final secondname = TextEditingController();
  final phonenum = TextEditingController();
  final deliveryaddress = TextEditingController();
  final areasown = TextEditingController();
  final emailController = TextEditingController();

  List<ProductItem> products = [];
  String _selectedForageType = 'Forage Grasses';
  String _selectedProduct = '';
  final _quantityController = TextEditingController();
  String _selectedUnit = 'kg';

  List<String> _forageTypes = [
    'Forage Grasses',
    'Forage Legumes',
    'Forage Herbs',
    'Forage Brassicas',
    'Fodder Beet',
    'Other',
  ];

  Map<String, List<String>> _products = {
    'Forage Grasses': [
      'Stampede Perennial Ryegrass',
      'Matrix Perennial Ryegrass',
      'Sequel Perennial Ryegrass',
      'Ultra Perennial Ryegrass',
      'Barrier Festulolium',
      'Frenzy Hybrid Ryegrass',
      'Splice Hybrid Grass',
      'Appeal Italian Ryegrass',
      'Vibe Italian Ryegrass',
      'Bullet Annual Ryegrass',
      'Rampage Annual Ryegrass',
      'Dash Annual Ryegrass',
      'Vision Cocksfoot',
      'Kainui Cocksfoot',
    ],
    'Forage Legumes': [
      'Demand White Clover',
      'Mantra White clover',
      'Reaper Red Clover',
    ],
    'Forage Herbs': [
      'Chico Chicory',
      'Oracle Plantain',
    ],
    'Forage Brassicas': [
      'Rifleman Rape',
      'Pillar Rape',
      'Marco Turnip',
      'Kea Kale',
      'Coleor Kale',
      'Saddleback Swede',
    ],
    'Fodder Beet': [
      'Geronimo',
      'Dynamo',
      'Kokomo',
    ],
    'Other': [
      'Other Product',
    ],
  };

  List<DropdownMenuItem<String>> _buildForageTypeItems() {
    return _forageTypes.map((forageType) {
      return DropdownMenuItem(
        value: forageType,
        child: Text(forageType),
      );
    }).toList();
  }

  List<DropdownMenuItem<String>> _buildProductItems(String forageType) {
    return _products[forageType]!.map((product) {
      return DropdownMenuItem(
        value: product,
        child: Text(product),
      );
    }).toList();
  }

  void _addProduct() {
    if (_selectedProduct.isEmpty || _quantityController.text.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please select a product and enter quantity'),
          backgroundColor: Colors.red,
          duration: Duration(seconds: 3),
        ),
      );
      return;
    }

    setState(() {
      products.add(ProductItem(
        forageType: _selectedForageType,
        product: _selectedProduct,
        quantity: _quantityController.text,
        unit: _selectedUnit,
      ));

      // Reset form for next product
      _selectedProduct = '';
      _quantityController.clear();
      _selectedUnit = 'kg';
    });
  }

  void _removeProduct(int index) {
    setState(() {
      products.removeAt(index);
    });
  }

  void _showValidationError(String fieldName) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Please fill in the required field: $fieldName'),
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
      ),
    );
  }

  bool _validateForm() {
    if (firstname.text.isEmpty) {
      _showValidationError('First Name');
      return false;
    }
    if (secondname.text.isEmpty) {
      _showValidationError('Last Name');
      return false;
    }
    if (emailController.text.isEmpty ||
        !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
            .hasMatch(emailController.text)) {
      _showValidationError('Valid Email');
      return false;
    }
    if (phonenum.text.isEmpty) {
      _showValidationError('Phone Number');
      return false;
    }
    if (deliveryaddress.text.isEmpty) {
      _showValidationError('Delivery Address');
      return false;
    }
    if (products.isEmpty) {
      _showValidationError('At least one product');
      return false;
    }
    return true;
  }

  void sendMessage() {
    if (!_validateForm()) {
      return;
    }

    var _date = datetoday.text;
    var _firstname = firstname.text;
    var _secondname = secondname.text;
    var _phonenum = phonenum.text;
    var _deliveryaddress = deliveryaddress.text;
    var _areasown = areasown.text;
    var _emailText = emailController.text;

    // Build products list
    String productsList = '';
    for (int i = 0; i < products.length; i++) {
      var product = products[i];
      productsList +=
          'Product ${i + 1}: ${product.product} - ${product.quantity} ${product.unit}\n';
    }

    var inputMessage = 'Date: $_date\n\n'
        'Client: $_firstname $_secondname\n\n'
        'Email: $_emailText\n\n'
        'Phone: $_phonenum\n\n'
        'Delivery address: $_deliveryaddress\n\n'
        'Area to be sown: $_areasown ha\n\n'
        'PRODUCTS:\n$productsList\n';

    Email email = Email(
      body: inputMessage,
      subject: 'Order Form: $_firstname $_secondname',
      recipients: ['bradleywadevincent@gmail.com'],
      cc: ['rocky@agrims.co.za', 'reynolds.tyrone123@gmail.com'],
    );

    send(email);
  }

  void send(Email email) async {
    await FlutterEmailSender.send(email);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        toolbarHeight: 70,
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              "\nOrder Form",
              style: TextStyle(color: Colors.white, fontSize: 20),
            ),
            Text(
              "Characters marked * are required.",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
            Text(
              "Submit using the Email Order button.\n\n",
              style: TextStyle(color: Colors.white, fontSize: 14),
            ),
          ],
        ),
        backgroundColor: Colors.green[800],
        foregroundColor: Colors.white,
        iconTheme: IconThemeData(color: Colors.white),
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
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            padding: EdgeInsets.fromLTRB(30, 20, 30, 80),
            child: Column(
              children: [
                // Logo
                Center(
                  child: Container(
                    width: 180,
                    padding: EdgeInsets.fromLTRB(10.0, 10.0, 10, 10),
                    child: Image.asset(
                      'assets/cropmarklogo.png',
                    ),
                  ),
                ),

                // Info text
                Container(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    "➤ A description of the products listed here can be found within the guide.",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),

                // Date field
                _buildLabel('Date *'),
                _buildTextField(datetoday, 'Date', false),

                // Client name fields
                _buildLabel('Client Name *'),
                _buildTextField(firstname, 'First name', true,
                    showPersonIcon: true),
                SizedBox(height: 10),
                _buildTextField(secondname, 'Last name', true,
                    showPersonIcon: true),

                // Email field
                _buildLabel('Email *'),
                _buildEmailField(emailController, 'example@example.com'),

                // Phone field
                _buildLabel('Phone Number *'),
                _buildTextField(phonenum, '000 000 0000', true,
                    showPhoneIcon: true, keyboardType: TextInputType.phone),

                // Delivery address
                _buildLabel('Delivery Address *'),
                _buildTextField(deliveryaddress, 'Delivery address', true,
                    showAddressIcon: true),

                // Area to be sown
                _buildLabel('Area to be sown (ha)'),
                _buildTextField(areasown, 'Area to be sown (ha)', false,
                    keyboardType: TextInputType.number),

                // Products section
                _buildLabel('Products *'),

                // Display added products
                if (products.isNotEmpty) ...[
                  _buildProductsList(),
                  SizedBox(height: 20),
                ],

                // Add product form
                _buildAddProductForm(),

                // Add product button
                Container(
                  margin: EdgeInsets.only(top: 10),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.add),
                    label: Text("Add Product"),
                    onPressed: _addProduct,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.black,
                    ),
                  ),
                ),

                // Email button
                Container(
                  margin: EdgeInsets.fromLTRB(40, 60, 40, 80),
                  child: ElevatedButton.icon(
                    icon: Icon(Icons.email),
                    label: Text("Email Order"),
                    onPressed: sendMessage,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.lightGreen,
                      foregroundColor: Colors.black,
                      padding:
                          EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                    ),
                  ),
                ),

                Stack(
                  children: [
                    Center(
                      child: Container(
                        width: 520,
                        padding: EdgeInsets.fromLTRB(0.0, 10.0, 10, 0),
                        child: Image.asset(
                          'assets/email pic.png',
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      bottom: 0,
                      left: 180,
                      right: 0,
                      child: Center(
                        child: ElevatedButton(
                          onPressed: () {
                            launchURL(
                                'https://www.cropmarkseeds.com/forage-seeds/appeal/');
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.transparent,
                            // Semi-transparent black
                            foregroundColor: Colors.transparent,
                            padding: const EdgeInsets.symmetric(
                                horizontal: 132, vertical: 36),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(8),
                              side: BorderSide(
                                  color: Colors.transparent, width: 1),
                            ),
                            elevation: 6,
                          ),
                          child: const Text(
                            '',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProductsList() {
    return Column(
      children: [
        for (int i = 0; i < products.length; i++)
          Card(
            color: Colors.lime[100],
            margin: EdgeInsets.symmetric(vertical: 5),
            child: ListTile(
              title: Text(
                '${products[i].product}',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                '${products[i].quantity} ${products[i].unit} (${products[i].forageType})',
              ),
              trailing: IconButton(
                icon: Icon(Icons.delete, color: Colors.red),
                onPressed: () => _removeProduct(i),
              ),
            ),
          ),
      ],
    );
  }

  Widget _buildAddProductForm() {
    return Column(
      children: [
        // Forage type dropdown
        _buildLabel('Forage Type'),
        _buildForageTypeDropdown(),

        // Product dropdown
        _buildLabel('Product'),
        _buildProductDropdown(),

        // Quantity and unit
        _buildLabel('Quantity'),
        IntrinsicHeight(
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Expanded(
                flex: 2,
                child: _buildTextField(_quantityController, 'Quantity', false,
                    keyboardType: TextInputType.number),
              ),
              SizedBox(width: 10),
              Expanded(
                flex: 1,
                child: _buildUnitDropdown(),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildLabel(String text) {
    return Container(
      alignment: Alignment.centerLeft,
      padding: EdgeInsets.only(top: 15, bottom: 5),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }

  Widget _buildTextField(
      TextEditingController controller, String hint, bool required,
      {bool showPersonIcon = false,
      bool showEmailIcon = false,
      bool showPhoneIcon = false,
      bool showAddressIcon = false,
      TextInputType keyboardType = TextInputType.text}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.lime[500],
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: _getPrefixIcon(
          showPersonIcon,
          showEmailIcon,
          showPhoneIcon,
          showAddressIcon,
        ),
      ),
      style: TextStyle(color: Colors.black),
      keyboardType: keyboardType,
    );
  }

  Widget? _getPrefixIcon(
      bool showPerson, bool showEmail, bool showPhone, bool showAddress) {
    if (showPerson) return Icon(Icons.person);
    if (showEmail) return Icon(Icons.email);
    if (showPhone) return Icon(Icons.phone);
    if (showAddress) return Icon(Icons.location_on);
    return null;
  }

  Widget _buildEmailField(TextEditingController controller, String hint) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.lime[500],
        hintText: hint,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        prefixIcon: Icon(Icons.email),
      ),
      style: TextStyle(color: Colors.black),
      keyboardType: TextInputType.emailAddress,
    );
  }

  Widget _buildForageTypeDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lime[500],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: _selectedForageType,
        isExpanded: true,
        items: _buildForageTypeItems(),
        onChanged: (value) {
          setState(() {
            _selectedForageType = value!;
            _selectedProduct = '';
          });
        },
        dropdownColor: Colors.lime[500],
        underline: SizedBox(),
      ),
    );
  }

  Widget _buildProductDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lime[500],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: _selectedProduct.isEmpty ? null : _selectedProduct,
        isExpanded: true,
        items: _buildProductItems(_selectedForageType),
        onChanged: (value) {
          setState(() {
            _selectedProduct = value!;
          });
        },
        dropdownColor: Colors.lime[500],
        underline: SizedBox(),
        hint: Text('Select Product'),
      ),
    );
  }

  Widget _buildUnitDropdown() {
    return Container(
      decoration: BoxDecoration(
        color: Colors.lime[500],
        borderRadius: BorderRadius.circular(10),
      ),
      padding: EdgeInsets.symmetric(horizontal: 12),
      child: DropdownButton<String>(
        value: _selectedUnit,
        isExpanded: true,
        items: <String>['kg', 'tonnes', 'seeds'].map((String value) {
          return DropdownMenuItem<String>(
            value: value,
            child: Text(value),
          );
        }).toList(),
        onChanged: (value) {
          setState(() {
            _selectedUnit = value!;
          });
        },
        dropdownColor: Colors.lime[500],
        underline: SizedBox(),
      ),
    );
  }
}
