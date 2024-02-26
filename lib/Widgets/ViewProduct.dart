import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:provider/provider.dart';
import 'package:shopping/Widgets/productDetails.dart';
import 'package:shopping/model/CartModel.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'ImageSlider.dart';
import 'gradientButton.dart';

class ViewProduct extends StatefulWidget {
  PageController controller = PageController();
  String Image1;
  String Image2;
  String Image3;
  String productname;
  String desc;
  int price;

  ViewProduct(
      {super.key,
      required this.controller,
      required this.Image1,
      required this.Image2,
      required this.Image3,
      required this.productname,
      required this.desc,
      required this.price});

  @override
  State<ViewProduct> createState() => _ViewProductState();
}

class _ViewProductState extends State<ViewProduct> {
  int quantity = 1;

  void _decrementCounter() {
    setState(() {
      if (quantity > 1) {
        quantity--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      quantity++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<cartmodel>(
      builder: (context, value, index) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.only(
                left: 200,
                bottom: 10,
              ),
              child: TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("X"),
              ),
            ),
            productdetails(
                controller: widget.controller,
                Image1: widget.Image1,
                Image2: widget.Image2,
                Image3: widget.Image3),
            Padding(
              padding: const EdgeInsets.only(left: 70),
              child: SmoothPageIndicator(
                controller: widget.controller,
                count: 3,
                effect: WormEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.blue,
                  dotHeight: 8,
                  dotWidth: 8,
                ),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Text(
              widget.productname,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(
              widget.desc,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Container(
              color: Colors.white70,
              height: 30,
              width: MediaQuery.of(context).size.width * 0.8,
              child: TextButton(
                onPressed: () {},
                child: Text("see all detaails"),
              ),
            ),
            gradientButton(
              BtnFunction: () async {
                Map<String, dynamic> newItem = {
                  'name': widget.productname,
                  'img': widget.desc,
                  'desc': widget.Image1,
                  'price': widget.price,
                  'quantity': quantity,
                };

                value.addtocaart(
                  widget.productname,
                  widget.desc,
                  widget.Image1,
                  widget.price,
                  quantity,
                );

                final List<Map<String, dynamic>> cartList = value.Cart;
                value.total = (value.total + widget.price) * quantity;

                // Increment items
                final FlutterSecureStorage secureStorage = FlutterSecureStorage();


                // Store cart list
                final String cartListJson = jsonEncode(cartList);
                await secureStorage.write(key: 'cartList', value: cartListJson);

                Navigator.of(context).pop();
              },
              BtnText: "${widget.price * quantity} RS",
            ),

            Row(mainAxisAlignment: MainAxisAlignment.center, children: <Widget>[
              IconButton(
                icon: Icon(Icons.remove),
                onPressed: _decrementCounter,
              ),
              Text(
                '$quantity',
                style: TextStyle(fontSize: 20),
              ),
              IconButton(
                icon: Icon(Icons.add),
                onPressed: _incrementCounter,
              ),
            ])
          ],
        ),
      ),
    );
  }
}
