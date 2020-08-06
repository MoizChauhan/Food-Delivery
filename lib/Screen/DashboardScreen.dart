import 'package:flutter/material.dart';
import 'package:food_delivery/Screen/detailPage.dart';
import 'package:food_delivery/model/fooditem.dart';

class Dashboard extends StatefulWidget {
  @override
  _DashboardState createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  int listLength = 0;
  List<FoodItem> foodItem = [];
  Future<void> getItem(catId) async {
    FooditemList instance = FooditemList();
    instance.getProduct(catId).then((value) {
      if (instance.isdataFound) {
        setState(() {
          foodItem.clear();
          foodItem.addAll(value);
        });
      }
    });
  }

  @override
  void initState() {
    super.initState();
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
                      child: TabBarView(children: [
                    buildGridView(),
                    buildGridView(),
                    buildGridView(),
                    buildGridView(),
                    buildGridView(),
                    buildGridView()
                  ])),
                ]),
          ),
        ),
      ),
    );
  }

  Widget buildGridView() {
    return GridView.builder(
      itemCount: foodItem.length,
      gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
          child: InkWell(
            onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(foodItem: foodItem[index]),
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
                    foodItem[index].shopName,
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                  Text(
                    '₹' +
                        '${foodItem[index].price.toString()} / ${foodItem[index].itemQty}',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ])));
  }
}
