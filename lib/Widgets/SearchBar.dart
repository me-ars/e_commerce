import 'package:flutter/material.dart';

class searchBar extends StatelessWidget {
  const searchBar({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(8)),
          width: MediaQuery.of(context).size.width * 0.8,
          child: TextField(
            decoration: InputDecoration(
                border: InputBorder.none,
                prefixIcon: Container(height: 50,
                    color: Colors.black,
                    child: Icon(
                      Icons.search,
                      color: Colors.white,
                    )),
                suffixIcon: Icon(Icons.more_vert),
                filled: true,
                fillColor: Colors.white),
          )),
    );
  }
}
