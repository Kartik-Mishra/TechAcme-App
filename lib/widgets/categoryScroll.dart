import 'package:techacme_app/Data.dart';
import 'package:flutter/material.dart';
import 'package:techacme_app/EventList.dart';
import 'package:techacme_app/widgets/categoryTile.dart';
import 'package:techacme_app/Detailpage.dart';

Widget categories(CategoryList clist , BuildContext context) => InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => EventScrollList(
                     list: clist,
                    )),
          );
        },
        child: CategoryTile(
      image: clist.image,
      name: clist.name,
      size: 140,
    ));

Widget categoryScroll(BuildContext context) {
  final popularScroll = Container(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: categorylist.map<Widget>((pl) => categories(pl , context)).toList(),
      ),
    ),
  );
  return popularScroll;
}
