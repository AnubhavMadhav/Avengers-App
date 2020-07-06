import 'package:flutter/material.dart';
import 'avengers.dart';

class AvengerDetail extends StatelessWidget {

  final Avengers avengers;

  AvengerDetail({this.avengers});


  bodyWidget() => Stack(
    children: [

    ],
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      appBar: AppBar(
        centerTitle: true,
        title: Text(avengers.name),
      ),
      body: bodyWidget,
    );
  }
}
