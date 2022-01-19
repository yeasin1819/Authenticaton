import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  
        title: Text("Home"),
        centerTitle: true,
      ),
      body: Center(  
        child: Container(  
          child: Text("Hello World", style: TextStyle(fontSize: 30),),
        ),
      ),
    );
  }
}
