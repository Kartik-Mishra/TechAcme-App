import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:techacme_app/Data.dart';
import 'package:techacme_app/Detailpage.dart';

Widget popularScroll(BuildContext context) {
  return Stack(children: <Widget>[
    CarouselSlider(
        autoPlay: true,
        viewportFraction: 0.8,
        aspectRatio: 1.96,
        enlargeCenterPage: true,
        items: popularList.list  .map<Widget>((pl) {
          return InkWell(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Stack(
                children: <Widget>[
                  Container(
                    decoration: BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(pl.image), fit: BoxFit.cover, ),
                        borderRadius: BorderRadius.circular(12),
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
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: <Widget>[
                      Container(
                        decoration: BoxDecoration(
                            color: Color.fromARGB(240, 110, 110, 110),
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(10),
                                bottomRight: Radius.circular(10))),
                        height: 40,
                        child: Center(
                            child: Text(
                          pl.name,
                          style: new TextStyle(
                              color: Color.fromARGB(255, 255, 255, 255),
                              fontFamily: "OpenSans",
                              fontWeight: FontWeight.bold),
                        )),
                      ),
                    ],
                  )
                ],
              ),
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                          object: pl,
                        )),
              );
            },
          );
        }).toList()),
  ]);
}
