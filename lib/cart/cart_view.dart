import 'package:flutter/material.dart';

class CartView extends StatefulWidget {
  const CartView({Key? key}) : super(key: key);

  @override
  State<CartView> createState() => _CartViewState();
}

class _CartViewState extends State<CartView> {
  var countDat = 1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 20,
        right: 20,
        top: 10,
      ),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.4),
              offset: const Offset(0, 5),
              blurRadius: 5,
              spreadRadius: 1,
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/man_1.png',
                height: 120,
                width: 120,
                fit: BoxFit.cover,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 20,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 167.0,
                      child: const Text(
                        'Woman T-shirt for afawe f w',
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontSize: 18, color: Colors.black),
                      ),
                    ),
                    const Text(
                      'Bata',
                      style: TextStyle(fontSize: 16, color: Color(0xFF919191)),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      '\$34.00',
                      style: TextStyle(
                        fontSize: 14,
                        color: Color(0xFF667EEA),
                      ),
                    ),
                    const SizedBox(
                      height: 17,
                    ),
                    Container(
                      color: Color(0xFFF6F6F6),
                      height: 35,
                      width: 115,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          IconButton(
                            onPressed: () {
                              if(countDat!=1) {
                                setState(() {
                                  countDat--;
                                });
                              }
                            },
                            icon: Icon(
                              Icons.remove,
                              size: 16,
                            ),
                          ),
                          Text(
                            '$countDat',
                            style: TextStyle(color: Colors.black, fontSize: 16),
                          ),
                          IconButton(
                            onPressed: () {
                              setState(() {
                                countDat++;
                              });
                            },
                            icon: Icon(
                              Icons.add,
                              size: 16,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topRight,
                child: Icon(
                  Icons.highlight_remove_outlined,
                  color: Colors.black,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
