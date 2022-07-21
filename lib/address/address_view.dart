import 'package:flutter/material.dart';

class AddressView extends StatefulWidget {
  const AddressView({Key? key}) : super(key: key);

  @override
  State<AddressView> createState() => _AddressViewState();
}

class _AddressViewState extends State<AddressView> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30.0,right: 30,top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Sample address',
                style: TextStyle(
                  fontSize: 14,
                  color: Color(0xFF676767),
                ),
              ),
              SizedBox(height: 2,),
              Text(
                'Your City',
                style: TextStyle(
                  fontSize: 12,
                  color: Color(0xFF676767),
                ),
              ),
            ],
          ),
          Radio(value: '', groupValue: 'groupValue', onChanged: (String? value)  {
            setState(() {

            });
          })
        ],
      ),
    );
  }
}
