import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DoctorPage extends StatefulWidget {
  @override
  _DoctorPageState createState() => _DoctorPageState();
}

void launchCall(int number) async {
  var url = "tel: ${number.toString()}";
  if (await canLaunch(url)) {
    await launch(url);
  } else {
    throw "Could not place a call";
  }
}

Widget doctorCard(String name, String hosp , int number){
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: Colors.blue,
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20,20,20,10),
        child: Column(
          children: [
            Row(
              children: [
                CircleAvatar(
                  radius: 35,
                  backgroundImage: AssetImage("assets/images/1.png"),
                ),
                SizedBox(width: 30,),
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name, style: TextStyle(fontSize: 26,color: Colors.white,fontWeight: FontWeight.bold),
                    textAlign: TextAlign.justify,),
                    SizedBox(height: 5,),
                    Text(hosp, style: TextStyle(fontSize: 16,color: Colors.white),
                      textAlign: TextAlign.justify,),
                  ],
                )
              ],
            ),
            SizedBox(height: 5,),
            Divider(color: Colors.white,),
            SizedBox(height: 5,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  height: 50,
                  width: 100,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                      onPressed: (){
                        launchCall(number);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Text("Call",style: TextStyle(color:Colors.green,fontSize: 20),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,5,0),
                            child: Icon(Icons.phone,color: Colors.green,),
                          ),
                        ],
                      )
                  ),
                ),
                Container(
                  height: 50,
                  width: 220,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: TextButton(
                      onPressed: (){},
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(5,0,0,0),
                            child: Text("Book Appointment",style: TextStyle(color: Colors.blue,fontSize: 18),),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0,0,5,0),
                            child: Icon(Icons.bookmark,color: Colors.blue,),
                          ),
                        ],
                      )
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    ),
  );
}

class _DoctorPageState extends State<DoctorPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Our Doctors"),
      ),
        body: Column(
          children: [
            doctorCard("Dr Divyam Mistry", "Covifind Hospital", 9875656410),
            doctorCard("Dr Vrushti Shah", "Covifind Hospital", 9855556410),
            doctorCard("Dr Jenil Patel", "Covifind Hospital", 9801514410),
          ],
        ),
//      body: ListView.builder(
//        physics: NeverScrollableScrollPhysics(),
//        shrinkWrap: true,
//        itemCount: doctorData.length,
//        itemBuilder: (context, index) => Padding(
//          padding: EdgeInsets.symmetric(vertical: 10),
//          child: Container(
//            decoration: BoxDecoration(
//                color: Colors.grey.shade200,
//                borderRadius: BorderRadius.circular(15)),
//            child: Padding(
//              padding: const EdgeInsets.fromLTRB(10, 10, 10, 5),
//              child: doctorCard(),
//            ),
//          ),
//        ),
//      ),
    );
  }
}
