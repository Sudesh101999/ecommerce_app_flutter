import 'package:ecommerce_app/add_address_page.dart';
import 'package:ecommerce_app/address/address_view.dart';
import 'package:ecommerce_app/payments/payment_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';

class AddressPage extends StatefulWidget {
  const AddressPage({Key? key}) : super(key: key);

  @override
  State<AddressPage> createState() => _AddressPageState();
}

class _AddressPageState extends State<AddressPage> {
  late bool _newNotification = true;

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
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 10,left: 30),
                    child: Text(
                      'Address',
                      style: TextStyle(
                        fontWeight: FontWeight.normal,
                        fontSize: 33,
                        color: Color(0xFF000000),
                      ),
                    ),
                  ),
                  SizedBox(height: 10,),
                  AddressView(),
                  AddressView(),
                  AddressView(),

                ],
              ),
            ),
          ),


          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 18,right: 18,top: 10,bottom: 5),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      //click operation
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => AddAddressPage()));
                    });
                  },
                  child: DottedBorder(
                    color: Color(0xFF667EEA),//color of dotted/dash line
                    strokeWidth: 2, //thickness of dash/dots
                    dashPattern: [4,4],
                    child: Container(
                      padding: EdgeInsets.only(top: 10, bottom: 10),
                      child: Align(
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.add),
                            SizedBox(width: 20,),
                            Text(
                              'Add Address',
                              style: TextStyle(
                                  fontSize: 14,
                                  color: Color(0xFF667EEA),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: InkWell(
                  onTap: () {
                    showMessage('Continue to payment clicked');
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => PaymentPage()));
                  },
                  child: Container(
                    padding: EdgeInsets.only(top: 15, bottom: 15),
                    color: Color(0xFF667EEA),
                    child: Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Continue to payment',
                        style: TextStyle(
                            fontSize: 16,
                            color: Color(0xFFFFFFFF),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }

  void showMessage(String msg) {
    Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.blue,
      textColor: Colors.white,
      fontSize: 16.0,
    );

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        backgroundColor: Colors.blue,
        behavior: SnackBarBehavior.floating,
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
