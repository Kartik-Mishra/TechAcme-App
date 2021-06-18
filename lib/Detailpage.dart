import 'package:flutter/material.dart';
import 'Data.dart';
import "widgets/categoryTile.dart";
import 'main.dart';

class DetailPage extends StatefulWidget {
  final EventList object;
  DetailPage({this.object});

  DetailPageState createState() => DetailPageState(object: object);
}

class DetailPageState extends State<DetailPage> {
  final EventList object;
  final CallService service = locator<CallService>();
  DetailPageState({this.object});

  @override
  Widget build(BuildContext context) {
    bool liked = favorites.contains(object);

    return Scaffold(
      body: Column(
        children: <Widget>[
          topBar(),
          Padding(
            padding: const EdgeInsets.only(
                top: 30.0, left: 10, right: 0, bottom: 20),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width - 210,
                  child: Divider(
                    indent: 8,
                    thickness: 1,
                    color: Color.fromARGB(255, 170, 170, 170),
                  ),
                ),
                Container(
                  decoration: new BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(
                        color: Color.fromARGB(255, 170, 170, 170),
                      )),
                  child: Text("  Contact Coordinators  ",
                      style: TextStyle(
                        fontFamily: "OpenSans",
                        fontWeight: FontWeight.w300,
                        fontSize: 13,
                        color: Colors.red,
                      )),
                ),
                IconButton(
                  icon: Icon(Icons.call),
                  onPressed: () {
                    service.call(object.contact);
                  },
                )
              ],
            ),
          ),
          Container(
            // padding: EdgeInsets.all(20),
            child: Expanded(
              flex: 1,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    EventData(
                      date: object.date,
                      fees: object.fees,
                      venue: object.venue,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.max,
                        children: <Widget>[
                          SizedBox(
                            height: 20,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(bottom: 8.0),
                            child: Text(
                              object.description,
                              style: TextStyle(
                                  fontSize: 14,
                                  fontFamily: "OpenSans",
                                  fontWeight: FontWeight.w300,
                                  height: 1.8),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget topBar() {
    return Stack(
      overflow: Overflow.visible,
      children: <Widget>[
        EventPoster(
          object: object,
        ),
        EventImage(object.image)
      ],
    );
  }
}

class EventPoster extends StatefulWidget {
  EventList object;

  EventPoster({
    this.object,
  });

  EventPosterState createState() => EventPosterState(
        object: object,
      );
}

class EventPosterState extends State<EventPoster> {
  String image;
  String name;
  bool liked;
  EventList object;

  EventPosterState({
    this.object,
  });

  @override
  void initState() {
    image = object.image;
    name = object.name;
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    liked = favorites.contains(object) ? true : false;
    final size = MediaQuery.of(context).size;
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Stack(
          children: <Widget>[
            Container(
              height: 180,
              width: size.width,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(image), fit: BoxFit.cover)),
            ),
            Container(
              height: 180,
              width: size.width,
              color: Color.fromARGB(150, 30, 30, 30),
            ),
            AppBar(backgroundColor: Colors.transparent, elevation: 0,),
          ],
        ),
        Padding(
          padding: const EdgeInsets.only(top: 30.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                width: 100,
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 + 10,
                child: Center(
                  child: Text(
                    name,
                    style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 20,
                        fontFamily: 'OpenSans'),
                  ),
                ),
              ),
              GestureDetector(
                child: Icon(
                  liked ? Icons.star : Icons.star_border,
                ),
                onTap: () {
                  saveFavorites();
                  if (liked) {
                    favorites.remove(object);
                  } else {
                    favorites.add(object);
                  }
                  super.setState(() {});
                },
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class EventImage extends StatelessWidget {
  String image;
  String name;

  EventImage(this.image);

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;
    // return ControlledAnimation(
    //   duration: Duration(milliseconds: 600),
    //   delay: Duration(milliseconds: (300 * 2).round()),
    //   tween: Tween<double>(begin: 0, end: 1),
    //   curve: Curves.elasticInOut,
    //   builder: (context, scalevalue) {
    //     return Positioned(
    //       top: 110,
    //       left: 10,
    //       child: Transform.scale(
    //         scale: scalevalue,
    //         alignment: Alignment.center,
    //         child: Container(
    //           height: 130,
    //           width: 130,
    //           decoration: BoxDecoration(
    //               image: DecorationImage(
    //                 image: AssetImage(image),
    //                 fit: BoxFit.cover,
    //               ),
    //               borderRadius: BorderRadius.circular(6.0),
    //               boxShadow: [
    //                 BoxShadow(
    //                     offset: Offset(0, -1.0),
    //                     blurRadius: 3,
    //                     spreadRadius: 0.02,
    //                     color: Color.fromARGB(150, 47, 47, 47))
    //               ]),
    //         ),
    //       ),
    //     );
    //   },
    // );
    return Positioned(
      top: 140,
      left: -10,
      child: Container(
        child: CategoryTile(image: image, name: "", size: 100),
        // decoration: BoxDecoration(
        //     image: DecorationImage(
        //       image: AssetImage(image),
        //       fit: BoxFit.cover,
        //     ),
        //  borderRadius: BorderRadius.circular(6.0),
        // boxShadow: [
        //   BoxShadow(
        //       offset: Offset(0, -1.0),
        //       blurRadius: 3,
        //       spreadRadius: 0.02,
        //       color: Color.fromARGB(150, 47, 47, 47))
        // ]
      ),
    );

    // return Hero(
    //   tag: image,
    //       child: Container(
    //             height: 140,
    //             width: 100,
    //             decoration: BoxDecoration(
    //                 image: DecorationImage(
    //                   image: AssetImage(image),
    //                   fit: BoxFit.cover,
    //                 ),
    //                 borderRadius: BorderRadius.circular(6.0),
    //                 boxShadow: [
    //                   BoxShadow(
    //                       offset: Offset(0.5, 1.0),
    //                       blurRadius: 5,
    //                       color: Colors.white)
    //                 ]),
    //           ),
    // );
  }
}

class EventData extends StatefulWidget {
  String date, fees, venue;
  ///Icon icon;

  EventData({this.date, this.fees, this.venue});

  @override
  _EventDataState createState() => _EventDataState();
}

class _EventDataState extends State<EventData> {
  List<EventInfo> data = new List<EventInfo>();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    data.add(new EventInfo(
        "Date",
        widget.date,
        Icon(
          Icons.event,
          size: 42,
        )));

    data.add(new EventInfo(
      "Fees",
      widget.fees,
      Icon(
        Icons.monetization_on,
        size: 42,
      ),
    ));
    data.add(new EventInfo(
        "Venue",
        widget.venue,
        Icon(
          Icons.location_on,
          size: 42,
        )));

    // data.add(new EventInfo(
    //   "Director",
    //   widget.dname,
    //   Icon(
    //     Icons.people_outline,
    //     size: 42,
    //   ),
    // ));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      height: MediaQuery.of(context).size.width / 3 - 10,
      margin: EdgeInsets.only(top: 5),
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: data.length,
          itemBuilder: (context, int index) {
            return Container(
              margin: EdgeInsets.only(left: 4, right: 4),
              height: MediaQuery.of(context).size.width / 3 - 23,
              decoration: BoxDecoration(
                  color: Color.fromARGB(255, 60, 60, 60),
                  borderRadius: BorderRadius.circular(20),
                  border: Border.all(color: Colors.grey)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 10, vertical: 0),
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 3 - 45,
                      height: 7,
                    ),
                    Text(
                      data[index].heading,
                      style: TextStyle(fontSize: 14, fontFamily: "OpenSans"),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      data[index].value + "",
                      style:
                          TextStyle(fontFamily: 'MagnumSansBold', fontSize: 12),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    data[index].icon
                  ],
                ),
              ),
            );
          }),
    );
  }
}

class EventInfo {
  String heading, value;
  Icon icon;

  EventInfo(this.heading, this.value, this.icon);
}
