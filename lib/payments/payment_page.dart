import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  State<PaymentPage> createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
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

      ),
    );
  }
}
