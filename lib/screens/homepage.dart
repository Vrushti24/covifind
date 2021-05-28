import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

//int currentIndex = 0;

List cardList = [
  Image.asset(
    "assets/images/coronavirus-safety-tw.jpg",
    fit: BoxFit.scaleDown,
  ),
  Image.asset(
    "assets/images/covid_foodretail_bestpractices_header.png",
    fit: BoxFit.scaleDown,
  ),
  Image.asset(
    "assets/images/jknpiqrusu_actual-300x200.jpg",
    fit: BoxFit.cover,
  ),
  Image.asset(
    "assets/images/Mask tip.png",
    fit: BoxFit.cover,
  ),
];

Widget makeButton (String title, var width , Function function){
  return Container(
    margin: EdgeInsets.all(20.0),
    width: width,
    height: 50,
    decoration: BoxDecoration(
      color: Colors.blue.shade500,
      borderRadius: BorderRadius.circular(5.0),
      boxShadow: [
        BoxShadow(
          color: Colors.grey,
          blurRadius: 50.0,
          spreadRadius: 0,
          offset: Offset(
              0.0,20.0
          ),
        ),
      ],
    ),
    child: TextButton(
      onPressed: function,
      child: Text(title,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18,
        ),),
    ),
  );
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        title: Container(
          height: 60,
          child: Image.asset("assets/images/covifind.png"),
        )
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20,),
            CarouselSlider(
              options: CarouselOptions(
                autoPlay: true,
                autoPlayInterval: Duration(seconds: 5),
                autoPlayAnimationDuration: Duration(milliseconds: 800),
                autoPlayCurve: Curves.fastOutSlowIn,
                aspectRatio: 1.70,
                enlargeCenterPage: true,
              ),
              items: cardList.map((card) {
                return Builder(builder: (BuildContext context) {
                  return Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                    child: Card(
                      color: Colors.blue,
                      child: card,
                    ),
                  );
                });
              }).toList(),
            ),
            makeButton(
                "Live Covid Data",
                width, (){
                  //Navigator.push(context, MaterialPageRoute(builder: builder))
            } ),
            makeButton("Consult a Doctor", width , (){} )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: (){},
        icon: Icon(Icons.document_scanner),
          label: Text("Scan X-Ray",style: TextStyle(fontSize: 18),),
      ),
    );
  }
}
