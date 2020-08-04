import 'package:flutter/material.dart';

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

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          leading: Padding(
            padding: const EdgeInsets.all(8.0),
            child: InkWell(
              onTap: () {},
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
                  child: Icon(Icons.shopping_cart, color: Colors.black),
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
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        children: <Widget>[
                          _customTabBar('All'),
                          SizedBox(width: 10.0),
                          _customTabBar('Grocery'),
                          SizedBox(width: 10.0),
                          _customTabBar('Vegetable'),
                          SizedBox(width: 10.0),
                          _customTabBar('Fruits'),
                          SizedBox(width: 10.0),
                          _customTabBar(''),
                          SizedBox(width: 10.0),
                          _customTabBar('Vegetable'),
                          SizedBox(width: 10.0),
                          _customTabBar('Vegetable'),
                        ],
                      )),
                  Expanded(
                    child: GridView.builder(
                      itemCount: 5,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2),
                      itemBuilder: (context, index) {
                        return Container(
                          padding: EdgeInsets.symmetric(
                              horizontal: 20, vertical: 10),
                          child: _buildInfoCard(),
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

  Widget _customTabBar(String cardTitle) {
    return InkWell(
        onTap: () {
          selectCard(cardTitle);
        },
        child: AnimatedContainer(
            duration: Duration(milliseconds: 500),
            curve: Curves.easeIn,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color:
                  cardTitle == selectedCard ? Color(0xFF7A9BEE) : Colors.white,
              border: Border.all(
                  color: cardTitle == selectedCard
                      ? Colors.transparent
                      : Colors.grey.withOpacity(0.3),
                  style: BorderStyle.solid,
                  width: 0.75),
            ),
            height: 10.0,
            width: 100.0,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0, left: 15.0),
                    child: Text(cardTitle,
                        style: TextStyle(
                          fontSize: 12.0,
                          color: cardTitle == selectedCard
                              ? Colors.white
                              : Colors.grey.withOpacity(0.7),
                        )),
                  ),
                ])));
  }

  Widget _buildInfoCard() {
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
                        'http://www.1zoom.net/big2/716/326686-svetik.jpg',
                        fit: BoxFit.fitHeight,
                      ),
                    ),
                  ),
                  Text(
                    'Beach BBQ Burger',
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
                    '₹' + '80.5',
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.black),
                  ),
                ])));
  }
}
