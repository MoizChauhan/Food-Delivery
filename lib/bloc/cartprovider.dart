import 'package:food_delivery/model/fooditem.dart';

class CartProvider {
  List<FoodItem> foodItems = [];
  List<FoodItem> addToList(FoodItem foodItem) {
    foodItems.add(foodItem);
    return foodItems;
  }

  List<FoodItem> removefromList(FoodItem foodItem) {
    foodItems.remove(foodItem);
    return foodItems;
  }
}
