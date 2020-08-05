import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class FoodItem {
  String pid;
  String pname;
  String desc;
  double price;
  String imgUrl;
  int quantity;

  FoodItem({
    @required this.pid,
    @required this.pname,
    @required this.desc,
    @required this.price,
    @required this.imgUrl,
    this.quantity = 1,
  });

  void incrementQuantity() {
    this.quantity = this.quantity + 1;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}

class FooditemList {
  bool isdataFound;
  List<FoodItem> foodItems = [];
  dynamic prodList;
  int getlenght() {
    return foodItems.length;
  }

  Future<void> getProduct(catId) async {
    String url =
        'http://webearl.com/minto_ecommerce/product_display.php?cid=$catId';
    try {
      Response response = await get(url);
      print('prdouct response $response');
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        isdataFound = true;
        Map data = jsonDecode(response.body);
        prodList = await data['server'];
        print('outside..');
        for (var res in prodList) {
          String pid = res['pid'];
          print(pid);
        }
      }
    } catch (e) {
      isdataFound = false;
    }
  }
}
