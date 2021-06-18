import 'package:flutter/material.dart';
import 'package:techacme_app/Homepage.dart';
import 'main.dart';

class Ad extends StatefulWidget {
  Ad({Key key}) : super(key: key);

  _AdState createState() => _AdState();
}

class _AdState extends State<Ad> {
  final CallService service = locator<CallService>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("Sponsors", style: TextStyle(fontFamily: "OpenSans")),
      ),
      body:
          ListView.builder(
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemCount: ad.length + 2,
              itemBuilder: (context, index) {
                if (index == ad.length) {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: <Widget>[
                        Container(
                          height: 340,
                          decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("images/cases.jpg"),
                                fit: BoxFit.contain,
                              ),
                              borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10),
                                  topRight: Radius.circular(10)),
                              border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(200, 120, 120, 120)),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3,
                                    spreadRadius: 2,
                                    color: Color.fromARGB(255, 30, 30, 30))
                              ]),
                        ),
                        Container(
                          decoration: BoxDecoration(
                              color: Color.fromARGB(240, 110, 110, 110),
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(10),
                                  bottomRight: Radius.circular(10))),
                          height: 40,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                "Proceed to page:",
                                style: new TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w300),
                              ),
                              IconButton(
                                onPressed: () {
                                  service.web(
                                      "https://www.instagram.com/techacmeogi/?hl=en");
                                },
                                icon: Image.asset(
                                  "images/insta.png",
                                  height: 22,
                                ),
                              ),
                              Text(
                                "   Contact:",
                                style: new TextStyle(
                                    color: Color.fromARGB(255, 255, 255, 255),
                                    fontFamily: "OpenSans",
                                    fontWeight: FontWeight.w300),
                              ),
                              IconButton(
                                  onPressed: () {
                                    service.call("9109079029");
                                  },
                                  icon: Icon(Icons.call)),
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                } 
                else if(index==ad.length+1)
                {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Divider(
                          height: 30,
                          color: Colors.grey,
                          indent: 5,
                          endIndent: 5,
                        ),
                        Material(
                            elevation: 10,
                            child: new Container(
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        width: 5,
                                        color: Color.fromARGB(
                                            255, 180, 180, 180))),
                                child: FadeInImage(
                                  image: AssetImage("images/swiggy.jpeg"),
                                  placeholder: AssetImage("images/loading.gif"),
                                ))),
                        Divider(
                          height: 30,
                          color: Colors.grey,
                          indent: 5,
                          endIndent: 5,
                        )
                      ],
                    ),
                  );


                }
                
                
                else {
                  return Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: <Widget>[
                        Material(
                            elevation: 10,
                            child: new Container(
                                decoration: new BoxDecoration(
                                    borderRadius: BorderRadius.circular(0),
                                    border: Border.all(
                                        width: 5,
                                        color: Color.fromARGB(
                                            255, 180, 180, 180))),
                                // height: 400,
                                // width: 300,
                                child: FadeInImage(
                                  //  fit: BoxFit.fill,
                                  image: NetworkImage(ad[index].data["image"]),
                                  placeholder: AssetImage("images/loading.gif"),
                                ))),
                        Divider(
                          height: 30,
                          color: Colors.grey,
                          indent: 5,
                          endIndent: 5,
                        )
                      ],
                    ),
                  );
                }
              }),
    );
  }
}
