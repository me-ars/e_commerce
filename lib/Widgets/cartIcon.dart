import 'package:flutter/material.dart';

class cartIcon extends StatelessWidget {
  int cartCount;
   cartIcon({super.key,required this.cartCount});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Icon(
          Icons.shopping_cart_outlined,
          color: Colors.black,
          size: 40,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 24,bottom: 20),
          child: CircleAvatar(radius: 10,
            backgroundColor: Colors.white,
            child: Center(
              child: Text(
                cartCount.toString(),

              ),
            ),
          ),
        )
      ],
    );
  }
}
