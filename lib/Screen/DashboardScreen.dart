import 'package:flutter/material.dart';
import 'package:food_delivery/Screen/detailPage.dart';
import 'package:food_delivery/model/category.dart';
import 'package:food_delivery/model/fooditem.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  var selectedCard = 'All';
  selectCard(cardTitle) {
    setState(() {
      selectedCard = cardTitle;
    });
  }

  int listLength = 0;
  List<FoodItem> foodItem = [
    /* FoodItem(
        pid: '1',
        pname: "Bhaji Pav",
        desc:
            'Street style Vegetable Hakka Noodles make a great weeknight meal!',
        price: 150,
        imgUrl:
            'http://webearl.com/minto_ecommerce/product_images/product.jpg'),
    FoodItem(
        pid: '2',
        pname: 'Pulav',
        desc:
            'Street style Vegetable Hakka Noodles make a great weeknight meal!',
        price: 7000,
        imgUrl:
            'http://webearl.com/minto_ecommerce/product_images/product.jpg'),
    FoodItem(
        pid: '3',
        pname: 'Manchurian',
        desc:
            'Street style Vegetable Hakka Noodles make a great weeknight meal!',
        price: 25,
        imgUrl:
            'http://webearl.com/minto_ecommerce/product_images/product.jpg'),
    FoodItem(
        pid: '4',
        pname: 'Hakka Noodles',
        desc:
            'Street style Vegetable Hakka Noodles make a great weeknight meal!',
        price: 700,
        imgUrl:
            'http://webearl.com/minto_ecommerce/product_images/product.jpg'),*/
  ];
  Future<void> getItem(catId) async {
    FooditemList instance = FooditemList();
    await instance.getProduct(catId);
    if (instance.isdataFound) {
      instance.foodItems = instance.foodItems;
      setState(() {
        foodItem = instance.foodItems;
        listLength = instance.getlenght();
        print('dashboard $foodItem');
        print('dashboard lenght $listLength');
      });
    }
  }

  @override
  void initState() {
    super.initState();
    //Category().getCategory();
    getItem(1);
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Scaffold(
        backgroundColor: Color(0xFFFCFCFC),
        appBar: AppBar(
          leading: InkWell(
            onTap: () {},
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                height: 65.0,
                width: 60.0,
                decoration: BoxDecoration(
                  color: Colors.amber,
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.08),
                      style: BorderStyle.solid,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.white,
          title: TextField(
            decoration: InputDecoration(
                prefixIcon: Icon(Icons.search),
                hintText: 'Search...',
                hintStyle: TextStyle(color: Colors.grey)),
          ),
          actions: <Widget>[
            InkWell(
              onTap: () {},
              child: Container(
                height: 65.0,
                width: 60.0,
                decoration: BoxDecoration(
                  border: Border.all(
                      color: Colors.grey.withOpacity(0.08),
                      style: BorderStyle.solid,
                      width: 1.0),
                  borderRadius: BorderRadius.circular(10.0),
                ),
                child: Center(
                  child: Icon(
                    Icons.shopping_cart,
                    color: Colors.amber,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
        body: SafeArea(
          child: Container(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  Container(
                    height: 50.0,
                    child: TabBar(
                        isScrollable: true,
                        indicatorColor: Colors.amber,
                        labelColor: Colors.amber,
                        unselectedLabelColor: Colors.black,
                        tabs: [
                          Text(
                            'All',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Vegetables',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Grocery',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Gutka',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Fruits',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          ),
                          Text(
                            'Others',
                            style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 17),
                          )
                        ]),
                  ),
                  Expanded(
                    child: GridView.builder(
                      itemCount: foodItem.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 30, vertical: 10),
                          child: InkWell(
                            onTap: () => Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => DetailsPage(
                                  foodName: foodItem[index].pname,
                                  foodPrice: foodItem[index].price.toString(),
                                  heroTag: foodItem[index].imgUrl,
                                ),
                              ),
                            ),
                            child: Card(
                              elevation: 15,
                              shadowColor: Colors.grey,
                              child: _buildInfoCard(index),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ]),
          ),
        ),
      ),
    );
  }

  Widget _buildInfoCard(index) {
    return InkWell(
        child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.white,
              border: Border.all(
                  color: Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    padding: const EdgeInsets.fromLTRB(20, 20, 20, 0),
                    child: ClipRRect(
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        foodItem[index].imgUrl,
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Text(
                    foodItem[index].pname,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    'Hotel Name',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    '₹' + '${foodItem[index].price}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ])));
  }
}
