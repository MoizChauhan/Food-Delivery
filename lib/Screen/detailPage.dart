import 'package:flutter/material.dart';
import 'package:food_delivery/model/fooditem.dart';

class DetailsPage extends StatefulWidget {
  final FoodItem foodItem;

  DetailsPage({this.foodItem});

  @override
  _DetailsPageState createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  int qty = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFFCFCFC),
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back),
          color: Colors.amber,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.shopping_cart),
            onPressed: () {},
            color: Colors.amber,
          )
        ],
      ),
      floatingActionButton: Padding(
        padding: const EdgeInsets.only(top: 8.0, left: 50),
        child: Align(
          alignment: Alignment.bottomCenter,
          child: FloatingActionButton(
            onPressed: () {
              print(qty);
            },
            child: Icon(
              Icons.add,
              color: Colors.black,
            ),
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.all(8),
              child: Image.network(
                widget.foodItem.imgUrl,
                fit: BoxFit.fill,
              ),
              height: 300.0,
              width: 300.0,
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Expanded(
            child: Container(
              padding: EdgeInsets.all(20),
              //margin: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,

              child: Column(
                children: <Widget>[
                  Container(
                    width: 125.0,
                    height: 40.0,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(17.0),
                      color: Colors.amber.shade400,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            if (qty == 1) {
                              setState(() {
                                qty = qty;
                              });
                            } else {
                              setState(() {
                                qty = qty - 1;
                              });
                            }
                          },
                          child: Center(
                            child: Icon(
                              Icons.remove,
                              color: Colors.black,
                              size: 20.0,
                            ),
                          ),
                        ),
                        Text(qty.toString(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: 'Montserrat',
                                fontSize: 15.0)),
                        InkWell(
                          onTap: () {
                            setState(() {
                              qty = qty + 1;
                            });
                          },
                          child: Center(
                            child: Icon(
                              Icons.add,
                              color: Colors.black,
                              size: 20.0,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(vertical: 30),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            widget.foodItem.pname,
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '₹ ${widget.foodItem.price}/${widget.foodItem.itemQty}',
                            style: TextStyle(
                                fontSize: 30, fontWeight: FontWeight.bold),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.grade,
                              color: Color(0xFF800000),
                            ),
                            Text(
                              '${widget.foodItem.ratings}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.ac_unit,
                              color: Color(0xFF800000),
                            ),
                            Text(
                              '${widget.foodItem.calories} Calories',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.timer,
                              color: Color(0xFF800000),
                            ),
                            Text(
                              '${widget.foodItem.deliveryTime}',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Vendor Name:',
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              widget.foodItem.shopName,
                              style: TextStyle(
                                  fontSize: 25, fontWeight: FontWeight.w600),
                            )
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),
                        Align(
                            alignment: Alignment.centerLeft,
                            child: Text(
                              'Description',
                              style: TextStyle(
                                fontSize: 30,
                                fontWeight: FontWeight.bold,
                              ),
                            )),
                        Text(
                          ' ${widget.foodItem.desc}',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Colors.black87.withOpacity(0.7),
                          ),
                        )
                      ],
                    ),
                  )
                ],
              ),

              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey,
                    offset: const Offset(3.0, 3.0),
                    blurRadius: 10.0,
                    spreadRadius: 2.0,
                  )
                ],
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(40)),
                color: Colors.white,
              ),
            ),
          )
        ],
      ),
    );
  }
}
