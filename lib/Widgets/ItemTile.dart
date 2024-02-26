import 'package:flutter/material.dart';

class itemTile extends StatelessWidget {
  String ItemImage;
  String itemName;

  itemTile({
    super.key,
    required this.ItemImage,
    required this.itemName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Color(0xffD9D9D9),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Container(
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(18)),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 120, top: 8, bottom: 8),
                child: Icon(Icons.favorite_border),
              ),
              Container(
                  // color: Colors.red,
                  decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(ItemImage))),
                  height: MediaQuery.of(context).size.height * 0.15),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                    color: Colors.red,
                    height: MediaQuery.of(context).size.height * 0.05,
                    width: MediaQuery.of(context).size.width * 0.17,
                    child: Center(
                      child: Text(
                        "50% off",
                        style: TextStyle(color: Colors.white, fontSize: 15),
                      ),
                    ),
                  ),
                  Text(
                    "Deal of the\nDay",
                    style: TextStyle(
                        color: Colors.red, fontWeight: FontWeight.bold),
                  )
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  itemName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
