import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/CartItem.dart';
import '../Widgets/gradientButton.dart';
import '../model/CartModel.dart';

class Cart extends StatelessWidget {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cartmodel>(builder: (context,value,child)=> Scaffold(
        body: Column(crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                "Subtotal${value.total} ",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("EMI available"),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.done,
                  color: Colors.green,
                ),
                Text("Free delivery available\nSelect this option to checkout")
              ],
            ),
            Divider(color: Colors.black45,thickness: 2,),
            Center(child: gradientButton(BtnFunction: (){},BtnText: "Proceed to Buy (${value.Cart.length})",)),
            Expanded(
              child: FutureBuilder<List<Map<String, dynamic>>>(
                future: cartmodel().getCartListFromStorage(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(
                      child: CircularProgressIndicator(),
                    );
                  } else if (snapshot.hasError) {
                    return Center(
                      child: Text('Error: ${snapshot.error}'),
                    );
                  } else {
                    List<Map<String, dynamic>> cartList = snapshot.data ?? [];
                    return ListView.builder(
                      itemCount: cartList.length,
                      itemBuilder: (context, index) {
                        Map<String, dynamic> item = cartList[index];
                        return cartItem(
                          price: item['price'],
                          dlt: () {
                         value.delete(index);
                         // value.subtotal();
                          },
                          Itemimage: item['img'],
                          productdesc: item['desc'],
                          productname: item['name'],
                          count: item['count'],
                        );
                      },
                    );
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 0),
              child: gradientButton(BtnFunction: (){},BtnText: "See similar products",),
            )
          ],
        ),
      ),
    );
  }
}
