import 'package:ecommerce_app/address/address_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class AddAddressPage extends StatefulWidget {
  const AddAddressPage({Key? key}) : super(key: key);

  @override
  State<AddAddressPage> createState() => _AddAddressPageState();
}

class _AddAddressPageState extends State<AddAddressPage> {

  late bool _newNotification = true;
  late TextEditingController _userNameController,_userAddressController,_userCityController,_userPostalCodeController,_userPhoneNumController;

  @override
  void initState() {
    _userNameController = TextEditingController(text: 'Flutter Developer');
    _userAddressController = TextEditingController(text: 'Flutter Developer address');
    _userCityController = TextEditingController(text: 'Flutter Developer City');
    _userPostalCodeController = TextEditingController(text: '00001234');
    _userPhoneNumController = TextEditingController(text: '0000000');
  }


  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      systemNavigationBarColor: Color(0xFF000000),
      systemNavigationBarIconBrightness: Brightness.dark,
      systemNavigationBarDividerColor: null,
      statusBarColor: Color(0xFFFCFCFC),
      statusBarIconBrightness: Brightness.dark,
      statusBarBrightness: Brightness.dark,
    ));
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        elevation: 0,
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xFFFCFCFC),
        leading: Padding(
          padding: const EdgeInsets.only(
            left: 20,
            top: 10,
          ),
          child: IconButton(
            icon: Icon(
              Icons.keyboard_backspace_sharp,
              size: 35,
              color: Colors.grey[600],
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              left: 0,
              top: 10,
              right: 20,
            ),
            child: IconButton(
              icon: Stack(
                children: [
                  if (_newNotification)
                    Positioned(
                      right: 1,
                      top: 1,
                      child: Container(
                        decoration: BoxDecoration(
                            shape: BoxShape.circle, color: Colors.red),
                        width: 20.0 / 2.5,
                        height: 20.0 / 2.5,
                      ),
                    ),
                  Icon(
                    Icons.notifications_none_outlined,
                    color: Colors.black,
                    size: 30,
                  )
                ],
              ),
              onPressed: () {},
            ),
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.only(top: 10,left: 30,right: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Create Address',
                    style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontSize: 33,
                      color: Color(0xFF000000),
                    ),
                  ),
                  SizedBox(height: 30,),

                  //Name input
                  Text(
                    "Name",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA4A4A4),
                    ),
                  ),
                  TextFormField(
                    controller: _userNameController,
                    keyboardType: TextInputType.emailAddress,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),

                  SizedBox(height: 25,),
                  //address input
                  Text(
                    "Address lane",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA4A4A4),
                    ),
                  ),
                  TextFormField(
                    controller: _userAddressController,
                    keyboardType: TextInputType.multiline,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  //address input
                  Text(
                    "City",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA4A4A4),
                    ),
                  ),
                  TextFormField(
                    controller: _userCityController,
                    keyboardType: TextInputType.text,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  //address input
                  Text(
                    "Postal Code",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA4A4A4),
                    ),
                  ),
                  TextFormField(
                    controller: _userPostalCodeController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  SizedBox(height: 25,),
                  //address input
                  Text(
                    "Phone Number",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0xFFA4A4A4),
                    ),
                  ),
                  TextFormField(
                    controller: _userPhoneNumController,
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                      fontSize: 17,
                      color: Colors.black,
                    ),
                    decoration: InputDecoration(
                      hintText: "",
                      hintStyle: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ],
              ),
            )),

            Padding(
              padding: const EdgeInsets.all(18.0),
              child: InkWell(
                onTap: () => Navigator.of(context).pop(),
                child: Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.all(18),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    gradient: LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.topRight,
                        colors: [
                          Color(0xff6d81eb),
                          Color(0xff64b2fd),
                        ]
                    ),
                  ),
                  child: Text(
                    'Add address',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ),

          ],
        ),
      ),
    );
  }
}