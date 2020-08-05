import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'package:http/http.dart';

class CategoryModel {
  int id;
  String category;
  CategoryModel({@required this.id, @required this.category});
}

class Category {
  dynamic catList;
  Future<void> getCategory() async {
    String url = 'http://webearl.com/minto_ecommerce/category_display.php';
    try {
      Response response = await post(url);
      print('Status Code: ${response.statusCode}');
      if (response.statusCode >= 200 && response.statusCode <= 299) {
        print(response);
        Map data = jsonDecode(response.body);
        catList = await data['server'];
        for (var res in catList) {
          String id = res['category_id'];
          String category = res['category_name'];
          print('$id   $category');
        }
      }
    } catch (e) {
      print(e);
    }
  }
}
