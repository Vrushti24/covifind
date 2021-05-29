import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:async';
import 'package:http/http.dart' as http;

class CovidGlobal extends StatefulWidget {
  @override
  _CovidGlobalState createState() => _CovidGlobalState();
}

class _CovidGlobalState extends State<CovidGlobal> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    covidcountries();
  }

  void covidcountries() async {
    var data;
    final response =
        await http.Client().get("https://api.covid19api.com/summary");
    data = json.decode(response.body);
    var countrydata = [];
    for (var i in data["Countries"]) {
      countrydata.add(i);
    }
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) {
          return Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: Text("Global Stats"),
            ),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: (20)),
              child: ListView.builder(
                itemCount: countrydata.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Container(
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.5,
                              child: Text(
                                "Active: " +
                                    "${countrydata[index]["TotalConfirmed"]}",
                                style: TextStyle(
                                    color: Colors.black, fontSize: 16),
                                maxLines: 3,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                Text.rich(
                                  TextSpan(
                                    text:
                                        "Country: ${countrydata[index]["Country"]}",
                                    style: TextStyle(
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("CoviFind"),
      ),
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }
}
