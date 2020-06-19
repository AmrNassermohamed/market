import 'package:flutter/material.dart';
import 'main.dart';

class PlantList extends StatefulWidget {
  @override
  _PlantListState createState() => _PlantListState();
}
class _PlantListState extends State<PlantList> {
  ScrollController _scrollController;

  List allDescriptions = [
    'Aloe vera is a succelent plant of the genus Aloe. I\'ts medicinal uses and air purifying ability make it the plant that you shouldn\'t live without.',
    'Some other description',
    'Third description'
  ];

  String description;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(changedesc);
    setState(() {
      description = allDescriptions[0];
    });
  }

  changedesc() {
    var value = _scrollController.offset.round();
    var descIndex = (value / 150).round();
    print(value);
    setState(() {
      description = allDescriptions[descIndex];
    });
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Container(
          height: 350.0,
          child: ListView(
            padding: EdgeInsets.only(left: 25.0),
            controller: _scrollController,
            scrollDirection: Axis.horizontal,
            children: <Widget>[
              getPlantCard(
                  'assets/er.png', '25', 'OUTDOOR', 'fruits'),
              SizedBox(width: 15.0),
              getPlantCard('assets/err.png', '25', 'INDOOR', 'milk'),
              SizedBox(width: 15.0),
              getPlantCard('assets/apple.png', '25', 'INDOOR', 'egg'),
              SizedBox(width: 15.0),
            ],
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            'Description',
            style: TextStyle(
                fontFamily: 'Montserrat',
                color: Colors.black,
                fontSize: 17.0,
                fontWeight: FontWeight.w500),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(left: 25.0, top: 10.0),
          child: Text(
            description,
            style: TextStyle(
              fontFamily: 'Montserrat',
              fontSize: 12.0,
            ),
          ),
        )
      ],
    );
  }

  getPlantCard(
      String imgPath, String price, String plantType, String plantName) {
    return Stack(
      children: <Widget>[
        Container(
          height: 325.0,
          width: 225.0,
          child: Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Color(0xFF7A9BEE)),
            height: 250.0,
            width: 225.0,
            child: Column(
              children: <Widget>[
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        SizedBox(height: 10.0),
                        Text(
                          'FROM',
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7A9BEE)),
                        ),
                        Text(
                          '\$' + price,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        )
                      ],
                    ),
                    SizedBox(width: 10.0)
                  ],
                ),
                Image(
                  image: AssetImage(imgPath),
                  height: 165.0,
                ),
                Row(
                  children: <Widget>[
                    SizedBox(width: 25.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          plantType,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 12.0,
                              fontWeight: FontWeight.w600,
                              color: Color(0xFF7A9BEE)),
                        ),
                        Text(
                          plantName,
                          style: TextStyle(
                              fontFamily: 'Montserrat',
                              fontSize: 20.0,
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        )
                      ],
                    ),
                  ],
                ),
                SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    SizedBox(width: 25.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF7A9BEE),
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFF7A9BEE)),
                      child: Icon(Icons.wb_sunny,
                          color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF7A9BEE),
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFF7A9BEE)),
                      child: Icon(Icons.branding_watermark,
                          color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                    SizedBox(width: 15.0),
                    Container(
                      height: 30.0,
                      width: 30.0,
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Color(0xFF7A9BEE),
                              style: BorderStyle.solid,
                              width: 0.5),
                          borderRadius: BorderRadius.circular(5.0),
                          color: Color(0xFF7A9BEE)),
                      child: Icon(Icons.hot_tub,
                          color: Colors.white.withOpacity(0.4), size: 20.0),
                    ),
                    SizedBox(width: 10.0),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyHomePage()
                        ));
                      },
                      child: Container(
                        height: 30.0,
                        width: 30.0,
                        decoration: BoxDecoration(color: Color(0xFF7A9BEE)),
                        child: Icon(Icons.help_outline,
                            color: Colors.white.withOpacity(0.4), size: 20.0),
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),

      ],
    );
  }
}