import 'package:flutter/material.dart';

class InvalidPage extends StatefulWidget {
  @override
  _InvalidPageState createState() => _InvalidPageState();
}

class _InvalidPageState extends State<InvalidPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("404"),
        centerTitle: true,
      ),
      body: Container(child: Text("404"))
    );
  }
}