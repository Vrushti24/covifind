import 'package:flutter/material.dart';

class CovidIndex extends StatefulWidget {
  @override
  _CovidIndexState createState() => _CovidIndexState();
}

class _CovidIndexState extends State<CovidIndex> {
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
