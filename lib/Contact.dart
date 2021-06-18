import 'package:flutter/material.dart';
import 'main.dart';

class Contact extends StatelessWidget {
  final CallService service = locator<CallService>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
        title: Text("CONTACT US",
            style:
                TextStyle(fontFamily: "OpenSans", fontWeight: FontWeight.w300)),
      ),
      body: new SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new Column(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    border:
                        Border.all(color: Color.fromARGB(255, 180, 180, 180)),
                    borderRadius: BorderRadius.circular(8)),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Address",
                        style: TextStyle(fontFamily: "OpenSans", fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Oriental Institute of Science and Technology, Raisen Rd, Opp, Patel Nagar, Bhopal, Madhya Pradesh 462021",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Core Team: ",
                          style:
                              TextStyle(fontFamily: "OpenSans", fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            service.call("7415702181");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.mail),
                          onPressed: () {
                            service.mail("info@techacme.in");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.web),
                          onPressed: () {
                            service.web("https://techacme.in/");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    border:
                        Border.all(color: Color.fromARGB(255, 180, 180, 180)),
                    borderRadius: BorderRadius.circular(8)),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "App Developer",
                        style: TextStyle(fontFamily: "OpenSans", fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Kartik Mishra, CSE, 3rd sem",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Contact: ",
                          style:
                              TextStyle(fontFamily: "OpenSans", fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            service.call("8319625496");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.mail),
                          onPressed: () {
                            service.mail("kartikmishra3110@gmail.com");
                          },
                        ),
                        IconButton(
                          icon: Image.asset("images/in.png", height: 22),
                          onPressed: () {
                            service.web(
                                "https://in.linkedin.com/in/kartik-mishra-443729159");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 5, vertical: 6),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    color: Color.fromARGB(255, 60, 60, 60),
                    border:
                        Border.all(color: Color.fromARGB(255, 180, 180, 180)),
                    borderRadius: BorderRadius.circular(8)),
                child: new Column(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Graphic Designer",
                        style: TextStyle(fontFamily: "OpenSans", fontSize: 17),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "Abhas Asati, CSE, 3rd sem",
                        style: TextStyle(
                            fontFamily: "OpenSans",
                            fontWeight: FontWeight.w300,
                            height: 1.8),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Contact: ",
                          style:
                              TextStyle(fontFamily: "OpenSans", fontSize: 15),
                        ),
                        IconButton(
                          icon: Icon(Icons.call),
                          onPressed: () {
                            service.call("7772012707");
                          },
                        ),
                        IconButton(
                          icon: Icon(Icons.mail),
                          onPressed: () {
                            service.mail("abhas.asati.26@gmail.com");
                          },
                        ),
                        IconButton(
                          icon: Image.asset("images/in.png", height: 22),
                          onPressed: () {
                            service.web(
                                "https://in.linkedin.com/in/abhas-asati-6927aa109");
                          },
                        ),
                      ],
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
