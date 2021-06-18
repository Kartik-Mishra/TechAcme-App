import 'dart:async';
import 'package:flutter/material.dart';
import 'package:techacme_app/Contact.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:techacme_app/Data.dart';
import 'widgets/PopularScroll.dart';
import "extra_activities.dart";
import 'ad.dart';
import 'widgets/categoryScroll.dart';
import 'favourites.dart';
import 'EventList.dart';
import 'About.dart';
import 'main.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

List<DocumentSnapshot> ad;

class _HomepageState extends State<Homepage>
    with SingleTickerProviderStateMixin {
  final CallService service = locator<CallService>();

  StreamSubscription<QuerySnapshot> subscription;
  final CollectionReference collectionReference =
      Firestore.instance.collection("Sponsors");

  int check = 0;
  @override
  void initState() {
    getFavorites();
    super.initState();

    subscription = collectionReference.snapshots().listen((documentSnapshot) {
      setState(() {
        ad = documentSnapshot.documents;
      });
    });
  }

  void adPop() {
    showDialog(
      barrierDismissible: true,
        context: context,
        child: Dialog(
            backgroundColor: Colors.transparent,
            elevation: 30,
            child: Center(
              child: Stack(
                children: <Widget>[
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Ad()));
                    },
                    child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(
                          color: Color.fromARGB(255, 180, 180, 180),
                        )),
                        child:
                            // FadeInImage(
                            //         //  fit: BoxFit.fill,
                            //         image: NetworkImage(ad[0].data["image"]),
                            //         placeholder: AssetImage("images/loading.gif"),
                            //       )
                            CachedNetworkImage(
                          imageUrl: ad[0].data["image"],
                          placeholder: (context, string) => Container(
                              height: 150,
                              width: MediaQuery.of(context).size.width - 100,
                              color: Color.fromARGB(255, 48, 48, 48),
                              child: Center(
                                  child: Container(
                                      child: CircularProgressIndicator()))),
                          errorWidget: (context, str, obj) {
                            Navigator.pop(context);
                            return Text("data");
                          },
                        )),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      IconButton(
                        icon: Icon(
                          Icons.cancel,
                          size: 25,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
                      )
                    ],
                  )
                ],
              ),
            )));
    check = 1;
  }

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((callback) {
      if (ad[0].data["check"] != 0 && check == 0) adPop();
    });

    final appDrawer = new Drawer(
      child: new ListView(
        children: <Widget>[
          DrawerHeader(
            child: Center(child: new Image.asset("images/drawer logo.png")),
            decoration: BoxDecoration(
              color: Colors.black,
            ),
          ),
          ListTile(
            title: Text("Register Now",
                style: TextStyle(
                  fontFamily: "OpenSans",
                )),
            leading: Icon(Icons.receipt),
            subtitle: Text(
              "Register here, just pay fee to coordinator",
              style: TextStyle(
                  fontFamily: "OpenSans", fontWeight: FontWeight.w200),
            ),
            onTap: () {
              service.web(
                  "https://docs.google.com/forms/d/e/1FAIpQLSejd2xvBk4ipg4vQiDNWauA-oE-9qCaS3IHNHFX8fo1LuzaSg/viewform");
            },
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            indent: 8,
            endIndent: 8,
          ),
          ListTile(
            title: Text(
              "Favorite Events",
              style: TextStyle(fontFamily: "OpenSans"),
            ),
            leading: Icon(Icons.star),
            subtitle: Text(
              "View your favorite events here",
              style: TextStyle(
                  fontFamily: "OpenSans", fontWeight: FontWeight.w200),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => FavoriteList()));
            },
          ),
          ExpansionTile(
            leading: new Icon(
              Icons.category,
              color: Colors.white,
            ),
            title: new Text(
              "Categories",
              style: TextStyle(fontFamily: "OpenSans"),
            ),
            children: <Widget>[
              ListTile(
                title: new Text(
                  "Technical Events",
                  style: TextStyle(fontFamily: "OpenSans"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventScrollList(
                                list: categorylist[0],
                              )));
                },
              ),
              ListTile(
                title: new Text(
                  "Cultural Events",
                  style: TextStyle(fontFamily: "OpenSans"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventScrollList(
                                list: categorylist[1],
                              )));
                },
              ),
              ListTile(
                title: new Text(
                  "School + College",
                  style: TextStyle(fontFamily: "OpenSans"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventScrollList(
                                list: categorylist[2],
                              )));
                },
              ),
              ListTile(
                title: new Text(
                  "Show Stoppers",
                  style: TextStyle(fontFamily: "OpenSans"),
                ),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => EventScrollList(
                                list: categorylist[3],
                              )));
                },
              ),
            ],
          ),
          Divider(
            color: Colors.grey.withOpacity(0.5),
            indent: 8,
            endIndent: 8,
          ),
          ListTile(
            leading: Icon(Icons.info_outline),
            title: Text(
              "About TechAcme",
              style: TextStyle(fontFamily: "OpenSans"),
            ),
            onTap: () {
              Navigator.pop(context);
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => About()));
            },
          ),
          ListTile(
            leading: Icon(Icons.mail_outline),
            title: Text(
              "Contact Us",
              style: TextStyle(fontFamily: "OpenSans"),
            ),
            subtitle: Text(
              "Raise query to Core Team or Developer",
              style: TextStyle(
                  fontFamily: "OpenSans", fontWeight: FontWeight.w200),
            ),
            onTap: () {
              Navigator.pop(context);

              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Contact()));
            },
          ),
        ],
      ),
    );

    return Scaffold(
        backgroundColor: Color.fromARGB(255, 30, 30, 30),
        drawer: appDrawer,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          centerTitle: true,
          title: //Image.asset("images/drawer logo.png", fit: BoxFit.cover,),
              Text(
            "Tech Acme",
            style: TextStyle(
                fontFamily: "OpenSans",
                fontWeight: FontWeight.bold,
                fontSize: 23),
          ),
          actions: <Widget>[
            IconButton(
              icon: Icon(
                Icons.card_giftcard,
                size: 23,
              ),
              onPressed: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => Ad()));
              },
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                icon: Icon(
                  Icons.star,
                  size: 25,
                ),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => FavoriteList()));
                },
              ),
            )
          ],
        ),
        body: Container(
          height: MediaQuery.of(context).size.height,
          decoration: BoxDecoration(
              border: Border.all(color: Color.fromARGB(255, 60, 60, 60)),
              color: Color.fromARGB(255, 47, 47, 47),
              borderRadius: new BorderRadius.only(
                topLeft: Radius.circular(10),
                topRight: Radius.circular(10),
              )),
          child: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.vertical,
            child: Column(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 10, bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Popular Events",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            color: Colors.white),
                      ),
                      GestureDetector(
                        child: Text(
                          "See All",
                          style: TextStyle(
                              fontWeight: FontWeight.w500,
                              fontFamily: "OpenSans",
                              fontSize: 15,
                              color: Colors.red),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => EventScrollList(
                                        list: popularList,
                                      )));
                        },
                      )
                    ],
                  ),
                ),
                popularScroll(context),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(255, 100, 100, 100),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10.0, bottom: 7, left: 8, right: 8),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Categories",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            color: Colors.white),
                      ),
                    ],
                  ),
                ),
                categoryScroll(context),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(255, 100, 100, 100),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8, top: 13, bottom: 4),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Text(
                        "Miscellaneous",
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 15,
                            fontFamily: "OpenSans",
                            color: Colors.white),
                      ),
                      // Text(
                      //   "See All",
                      //   style: TextStyle(
                      //       fontWeight: FontWeight.w500,
                      //       fontFamily: "OpenSans",
                      //       fontSize: 15,
                      //       color: Colors.red),
                      // )
                    ],
                  ),
                ),
                extrasScroll(context),
                Divider(
                  indent: 20,
                  endIndent: 20,
                  color: Color.fromARGB(255, 100, 100, 100),
                ),
                RaisedGradientButton(
                  child: Text(
                    "Register",
                    style: TextStyle(
                      fontFamily: "OpenSans",
                      fontSize: 18,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  onPressed: () {
                    service.web(
                        "https://docs.google.com/forms/d/e/1FAIpQLSejd2xvBk4ipg4vQiDNWauA-oE-9qCaS3IHNHFX8fo1LuzaSg/viewform");
                  },
                ),
              ],
            ),
          ),
        ));
  }
}

class ImageData extends StatelessWidget {
  final String image;
  final String name;
  ImageData(this.image, this.name);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 180,
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(8.0)),
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Text(
          name,
          style: TextStyle(
              backgroundColor: Colors.black12,
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 28),
        ),
      ),
    );
  }
}

class RaisedGradientButton extends StatelessWidget {
  final Widget child;
  final Function onPressed;
  final double verticalMargin, horizontalMargin;

  RaisedGradientButton(
      {@required this.child,
      this.onPressed,
      this.verticalMargin = 10,
      this.horizontalMargin = 10});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      margin: EdgeInsets.symmetric(
          vertical: verticalMargin, horizontal: horizontalMargin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(17),
        border: Border.all(color: Color.fromARGB(255, 200, 200, 200)),
        color: Color.fromARGB(255, 80, 80, 80),
        // boxShadow: [
        //   BoxShadow(
        //     color: Colors.grey[500],
        //     offset: Offset(0.0, 1.5),
        //     blurRadius: 1.5,
        //   ),
        //]
      ),
      child: Material(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.horizontal(
                left: Radius.circular(50), right: Radius.circular(50))),
        clipBehavior: Clip.antiAlias,
        color: Colors.transparent,
        child: InkWell(
            splashColor: Colors.white54,
            onTap: onPressed,
            child: Center(
              child: child,
            )),
      ),
    );
  }
}
