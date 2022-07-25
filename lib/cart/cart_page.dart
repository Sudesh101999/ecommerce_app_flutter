import 'package:ecommerce_app/address/address_page.dart';
import 'package:ecommerce_app/cart/cart_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class CartPage extends StatefulWidget {
  const CartPage({Key? key}) : super(key: key);

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
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
      body: Stack(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 30, top: 10),
                    child: Text(
                      'Cart',
                      style: TextStyle(
                        fontSize: 30,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  CartView(),
                  CartView(),
                  CartView(),
                  CartView(),
                  CartView(),
                  CartView(),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20,
            left: 40,
            right: 40,
            child: InkWell(
              onTap: () {
                setState(() {
                  //click operation
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => AddressPage()));
                });
              },
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
                  'Continue',
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
