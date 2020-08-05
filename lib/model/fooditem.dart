import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class FoodItem {
  String pid;
  String pname;
  String desc;
  String price;
  String imgUrl;
  String itemQty;
  int quantity;
  String deliveryTime;
  String ratings;
  String calories;

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

  FoodItem.fromJson(Map<String, dynamic> res) {
    pid = res['pid'];
    pname = res['pname'];
    price = res['price'];
    imgUrl = res['pphoto'];
    desc = res['pdesc'];
    deliveryTime = res['delivery_time'];
    itemQty = res['pqty'];
    calories = res['calories'];
  }
}

class FooditemList {
  bool isdataFound;
  List<FoodItem> foodItems = [];
  dynamic prodList;
  int getlenght() {
    return foodItems.length;
  }

  // ignore: missing_return
  Future<List<FoodItem>> getProduct(catId) async {
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
          foodItems.add(FoodItem.fromJson(res));
        }
        return foodItems;
      } else {
        isdataFound = false;
        return foodItems;
      }
    } catch (e) {
      print(e);
    }
  }
}
