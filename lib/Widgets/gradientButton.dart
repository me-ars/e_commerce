import 'package:flutter/material.dart';

class gradientButton extends StatelessWidget {
  String BtnText;
  VoidCallback BtnFunction;
   gradientButton({super.key,required this.BtnText,required this.BtnFunction});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(gradient: LinearGradient(colors: [Colors.orangeAccent,Colors.yellowAccent])),
        height: 30,
        width: MediaQuery.of(context).size.width*0.9,
        child: TextButton(
          child: Center(child: Text(BtnText)),
          onPressed: BtnFunction,
        ),
      ),
    );
  }
}
