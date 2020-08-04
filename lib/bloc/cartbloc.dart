import 'dart:async';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:food_delivery/bloc/cartprovider.dart';
import 'package:food_delivery/model/fooditem.dart';
import 'package:rxdart/rxdart.dart';

class CartBloc extends BlocBase {
  CartBloc();
  //Reciveng Stream

  var _counterController = BehaviorSubject<List<FoodItem>>.seeded([]);
  CartProvider provider = CartProvider();
  //output
  Stream<List<FoodItem>> get listStream => _counterController.stream;

  //input
  Sink<List<FoodItem>> get listSink => _counterController.sink;

  //Business Logic
  addToList(FoodItem foodItem) {
    listSink.add(provider.addToList(foodItem));
  }

  removefromList(FoodItem foodItem) {
    listSink.add(provider.removefromList(foodItem));
  }

  //dispose
  @override
  void dispose() {
    _counterController.close();
    super.dispose();
  }
}
