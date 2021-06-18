
import 'package:flutter/material.dart';

class About extends StatelessWidget {

  final about_text  ="   TECHACME the best college fest among colleges in Bhopal, has developed over the years into so much more: a melting pot of Indian culture, a launchpad for upcoming artists, a spectacular showcase of talent, an epitome of incredible human experience: where you can never see it all, but what you do see lasts a lifetime. It will be a perfect platform for all young students, invited from other Universities & Colleges, to display their talent & participate in various technical and cultural competitions, to have an experience of a lifetime and an opportunity to network while celebrating our cherished culture and heritage.";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: Text("About", style: TextStyle(fontFamily: "OpenSans", ),) ,
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: new SingleChildScrollView(
        child: new Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              child: Center(
                child: new Image.asset("images/white_logo.png", height: 250,),
              ),
            ), 
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: new Text(about_text, style: TextStyle(fontFamily: "OpenSans" , height: 1.8 , fontSize: 16, ), textAlign: TextAlign.center,),
            )
          ],
        ),
      ),
    );
  }
}
