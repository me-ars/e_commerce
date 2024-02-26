import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Widgets/ItemTile.dart';
import '../Widgets/ViewProduct.dart';
import '../model/CartModel.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  PageController controller = PageController();

  @override
  Widget build(BuildContext context) {
    return Consumer<cartmodel>(
      builder: (context, value, child) => Scaffold(
        body: Column(
          children: [
            Expanded(
              child: GridView.builder(
                itemCount: 4,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  childAspectRatio: 1 / 1.5,
                ),
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            content: ViewProduct(
                              controller: controller,
                              Image1: value.shopItems[index][1],
                              Image2: value.shopItems[index][4],
                              Image3: value.shopItems[index][5],
                              desc: value.shopItems[index][2],
                              productname: value.shopItems[index][0],
                              price: value.shopItems[index][3],
                            ),
                            backgroundColor: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(
                                width: 4,
                                color: Color(0xff7CD85B),
                              ),
                              borderRadius: BorderRadius.circular(15),
                            ),
                          );
                        },
                      );
                    },
                    child: itemTile(
                      ItemImage: value.shopItems[index][1],
                      itemName: value.shopItems[index][0],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
