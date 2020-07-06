import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'avengers.dart';

class AvengerDetail extends StatelessWidget {

  final Avengers avengers;

  AvengerDetail({this.avengers});


  bodyWidget(BuildContext context) => Stack(
    children: [
      Positioned(
          height: MediaQuery.of(context).size.height / 1.6,
          width: MediaQuery.of(context).size.width - 20.0,
          left: 10.0,
        top: MediaQuery.of(context).size.height * 0.12,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                height: 50.0,
              ),
              Text(avengers.name,
              style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
              Text("Height: ${avengers.height}"),
              Text("Weight: ${avengers.weight}"),
              Text("Strengths"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: avengers.strength.map((e) => FilterChip(label: Text(e),
                    backgroundColor: Colors.amber,
                    onSelected: (b){})).toList(),
              ),
              Text("Weakness"),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: avengers.weaknesses.map((t) => FilterChip(label: Text(t, style: TextStyle(color: Colors.white),),
                backgroundColor: Colors.red,
                  onSelected: (b){})).toList(),
                ),

            ],
          ),
        ),
      ),

      Positioned(
        height: 160.0,
        width: MediaQuery.of(context).size.width - 20.0,
        left: 10.0,
        top: 10.0,
        child: Align(
          alignment: Alignment.topCenter,
          child: Hero(tag: avengers.img,
              child: Container(
                height: 200.0,
                width: 200.0,
                decoration: BoxDecoration(
                  image: DecorationImage(image: NetworkImage(avengers.img),)
                ),
              )),
        ),
      )




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
      body: bodyWidget(context),
      bottomNavigationBar: BottomAppBar(
        child: InkWell(
            child: Text(
              "</> by Anubhav Madhav",
              textAlign: TextAlign.center,
              
            ),
          onTap:() => launch('https://anubhavmadhav.github.io/Anubhav-Madhav/'),
        ),
      ),
    );
  }
}
