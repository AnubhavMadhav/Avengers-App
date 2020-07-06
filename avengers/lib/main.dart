import 'package:avengers/avengerDetail.dart';
import 'package:avengers/avengers.dart';
import 'package:flutter/material.dart';
import "package:http/http.dart" as http;
import 'dart:convert';

void main() => runApp(
  MaterialApp(
    title: "Avengers",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(primarySwatch: Colors.teal),
    home: HomePage(),
  )
);

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  var url = "https://raw.githubusercontent.com/AnubhavMadhav/Avengers-JSON-API/master/avengers.json?token=AKC46GIGURLQYY2X7IK6U6C7BRRDG";


  AvengersHub avengersHub;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    fetchData();
  }

  fetchData() async {
    var res = await http.get(url);
    var decodedValue = jsonDecode(res.body);

    avengersHub = AvengersHub.fromJson(decodedValue);

//    print(avengersHub);

    setState(() {

    });
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Avengers"),

      ),
        body: avengersHub==null? Center(child: CircularProgressIndicator(),): GridView.count(
          crossAxisCount: 2,
          children: avengersHub.avengers.map((Avengers avenge) => Padding(
            padding: const EdgeInsets.all(2.0),
            child: InkWell(
              onTap: (){
                Navigator.push(context, MaterialPageRoute(builder: (context) => AvengerDetail(
                  avengers: avenge,
                )));
              },
              child: Card(
                elevation: 3.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Hero(
                      tag: avenge.img,
                      child: Container(
                        height: 160.0,
                        width: 100.0,
                        decoration: BoxDecoration(
                          image: DecorationImage(image: NetworkImage(avenge.img)),
                        ),

                      ),
                    ),
                    Text(avenge.name, style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
          )).toList()
        ),
//      body: Center(
//        child: Text("Avengers by Anubhav Madhav"),
//      ),
//      drawer: Drawer(),
//      floatingActionButton: FloatingActionButton(
//        onPressed: (){},
//        child: Icon(Icons.refresh),
//      ),
    );
  }
}
