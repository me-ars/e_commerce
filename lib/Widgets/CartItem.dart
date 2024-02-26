import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/CartModel.dart';

class cartItem extends StatefulWidget {
  String Itemimage;
  String productname;
  String productdesc;
  int price;
  int count;
 VoidCallback dlt;
  cartItem(
      {super.key,
        required this.dlt,
      required this.Itemimage,
      required this.price,
      required this.count,
      required this.productname,
      required this.productdesc});

  @override
  State<cartItem> createState() => _cartItemState();
}

void checked() {}

class _cartItemState extends State<cartItem> {
  void _decrementCounter() {
    setState(() {
      if (widget.count > 1) {
        widget.count--;
      }
    });
  }

  void _incrementCounter() {
    setState(() {
      widget.count++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<cartmodel>(builder:(context,value,child)=>Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Container(
          color: Colors.black45,
          height: MediaQuery.of(context).size.height * 0.4,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            children: [
              Row(
                children: [
                  SizedBox(
                    width: 30,
                  ),
                  Image(
                      height: 150,
                      width: 200,
                      image: NetworkImage(widget.Itemimage)),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0, top: 15),
                    child: SizedBox(
                      width: 100,
                      height: 200,
                      child: Column(
                        children: [
                          Text(
                            widget.productname,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Text(
                            widget.productdesc,
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              widget.price.toString(),
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  IconButton(
                    icon: Icon(Icons.remove),
                    onPressed: _decrementCounter,
                  ),
                  Text(
                    widget.count.toString(),
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    icon: Icon(Icons.add),
                    onPressed: _incrementCounter,
                  ),
                  TextButton(onPressed: () {widget.dlt();}, child: Text("Delete")),
                  TextButton(onPressed: () {}, child: Text("Save later"))
                ],
              )
            ],
          ),
        ),
      ),
    );
    ;
  }
}
