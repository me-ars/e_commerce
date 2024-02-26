import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class cartmodel extends ChangeNotifier {
  //[name,display_image,price,image2,image3]
  final List shopItems = [
    [
      "Rolex-Mens Watch",
      "lib/assets/product1_1.jpg",
      "Wristwatches Hardcover – 1 January 2010",
      100000,
      "lib/assets/product1_2.jpg",
      "lib/assets/product1_3.jpg"
    ],
    [
      "Titan- womens chain watch",
      "lib/assets/product2_2.jpg",
      "Titan Analog Watch For Men -NR1696NC01",
      50000,
      "lib/assets/product2_2.jpg",
      "lib/assets/product2_3.jpg"
    ],
    [
      "Breguet Tradition GMT BNIB 2022",
      "lib/assets/product3_1.jpg",
      " Royal Look| High-Quality & Water Resistant",
      75000,
      "lib/assets/product3_2.jpg",
      "lib/assets/product3_3.jpg"
    ],
    [
      "Suunto Vertical Titanium Solar Watch",
      "lib/assets/prod4.jpg",
      "Stress Monitor, Bluetooth Phone Calls,",
      33000,
      "lib/assets/prod4_1.jpg",
      "lib/assets/prod4_3.jpg"
    ]
  ];
  Future<Map<String, dynamic>> getCartDataFromStorage() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final String? cartDataJson = await secureStorage.read(key: 'cartData');
    if (cartDataJson != null) {
      return jsonDecode(cartDataJson);
    } else {
      return {};
    }
  }

  Future<void> saveCartDataToStorage(Map<String, dynamic> cartData) async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    await secureStorage.write(key: 'cartData', value: jsonEncode(cartData));
  }

  // void delete(int index) async {
  //   Map<String, dynamic> cartData = await getCartDataFromStorage();
  //   List<Map<String, dynamic>> cartList = [];
  //   if (cartData.containsKey('cartList')) {
  //     final String cartListJson = cartData['cartList'];
  //     final List<dynamic> decodedJson = jsonDecode(cartListJson);
  //     cartList = decodedJson.cast<Map<String, dynamic>>();
  //   }
  //
  //   if (index >= 0 && index < cartList.length) {
  //     cartList.removeAt(index);
  //     cartData['cartList'] = jsonEncode(cartList);
  //     cartData['numItems'] = cartList.length;
  //     await saveCartDataToStorage(cartData);
  //   } else {
  //     print('Index out of range');
  //   }
  // }

int itemnum=0;
  Future<List<Map<String, dynamic>>> getCartListFromStorage() async {
    final FlutterSecureStorage secureStorage = FlutterSecureStorage();
    final String? cartListJson = await secureStorage.read(key: 'cartList');
    if (cartListJson != null) {
      final List<dynamic> decodedJson = jsonDecode(cartListJson);
      return decodedJson.cast<Map<String, dynamic>>();
    } else {
      return [];
    }
  }
 int total=0;
  void addtocaart(String name, String desc, String img, int price, int count)async {
    Map<String, dynamic> item = {
      'name': name,
      'img': img,
      'desc': desc,
      'price': price,
      'count': count,
    };
    Cart.add(item);   final FlutterSecureStorage secureStorage = FlutterSecureStorage();

    var items = await secureStorage.read(key: 'items');
    if (items == null) {
      items = '0';
      itemnum=0;
    }
    int itemCount = int.parse(items) + 1;
    itemnum=itemCount;
    await secureStorage.write(key: 'items', value: itemCount.toString());

    // Print the item count
    print('Item count: $itemCount');
    notifyListeners();
  }
void subtotal(){
  Cart.forEach((item) {
    print(item['price']);
  });
}
  Future<void> delete(int index) async {
    List<Map<String, dynamic>> cartList = await getCartListFromStorage();
    Map<String, dynamic> cartData = await getCartDataFromStorage();
    cartData.clear();
notifyListeners();
  }


  final List<Map<String, dynamic>> Cart = [];
}
