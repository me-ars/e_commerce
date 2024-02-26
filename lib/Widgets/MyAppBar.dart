
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/CartModel.dart';
import 'SearchBar.dart';
import 'cartIcon.dart';

class myAppBar extends StatelessWidget {
  const myAppBar({Key? key});

  @override
  Widget build(BuildContext context) {
    return Consumer<cartmodel>(
      builder: (context, value, child) => Container(
        height: MediaQuery.of(context).size.height * 0.12,
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff079AAB), Color(0xff7CD85B)],
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // Use the cartModel instance to access the cart list
            searchBar(),
            cartIcon(cartCount: value.itemnum,),
          ],
        ),
      ),
    );
  }
}
