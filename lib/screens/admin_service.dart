import 'package:flutter/material.dart';
import 'package:learning/list.dart';
import 'package:learning/screens/REGISTER.dart';
import '../main.dart';
import '../list.dart';


class  adminservice extends StatelessWidget {
  static String id="adminservice";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF7A9BEE),
      body: ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 15.0, left: 10.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                IconButton(
                  icon: Icon(Icons.arrow_back_ios),
                  color: Colors.white,
                  onPressed: () {},
                ),
                Container(
                    width: 125.0,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        IconButton(
                          icon: Icon(Icons.filter_list),
                          color: Colors.white,
                          onPressed: () {},
                        ),
                        IconButton(
                          icon: Icon(Icons.menu),
                          color: Colors.white,
                          onPressed: () {},
                        )
                      ],
                    ))
              ],
            ),
          ),
          SizedBox(height: 25.0),
          Padding(
            padding: EdgeInsets.only(left: 40.0),
            child: Row(
              children: <Widget>[
                Text('Admin services',
                    style: TextStyle(
                        fontFamily: 'Montserrat',
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 25.0)),

              ],
            ),
          ),
          SizedBox(height: 40.0),
          Container(
            height: MediaQuery
                .of(context)
                .size
                .height - 185.0,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topLeft: Radius.circular(75.0)),
            ),
            child: ListView(
              primary: false,
              padding: EdgeInsets.only(left: 25.0, right: 20.0),
              children: <Widget>[
                Padding(
                    padding: EdgeInsets.only(top: 45.0),
                    child: Container(
                        height: MediaQuery
                            .of(context)
                            .size
                            .height ,
                        child: GridView.count(
    crossAxisCount: 2,
    primary: false,
    crossAxisSpacing: 10.0,
    mainAxisSpacing: 15.0,
    childAspectRatio: 0.8,
    children: <Widget>[
    _buildCard('Cookie mint', '\$3.99', 'assets/apple.png',
    false, false, context),
    _buildCard('Cookie cream', '\$5.99', 'assets/apple.png',
    true, false, context),
    _buildCard('Cookie classic', '\$1.99',
    'assets/apple.png', false, true, context),
    _buildCard('Cookie choco', '\$2.99', 'assets/apple.png',
    false, false, context)
    ],
    )
                    )),

              ],
            ),
          )
        ],
      ),
    );
  }
  Widget _buildCard(String name, String price, String imgPath, bool added,
      bool isFavorite, context) {
    return Padding(
        padding: EdgeInsets.only(top: 5.0, bottom: 5.0, left: 5.0, right: 5.0),
            child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 3.0,
                          blurRadius: 5.0)
                    ],
                    color: Colors.white),
                child: Column(children: [
                  SizedBox(height: 30.0),
                  Hero(
                      tag: imgPath,
                      child: Container(
                          height: 75.0,
                          width: 75.0,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                  image: AssetImage(imgPath),
                                  fit: BoxFit.contain)))),
                  SizedBox(height: 20.0),

                  Text(name,
                      style: TextStyle(
                          color:  Color(0xFF7A9BEE),
                          fontFamily: 'Varela',
                          fontSize: 14.0)),


                ])));
  }

}