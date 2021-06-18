import 'package:flutter/material.dart';
import 'package:techacme_app/Data.dart';
import 'package:techacme_app/Detailpage.dart';
import 'package:techacme_app/widgets/categoryTile.dart';


Widget extrasScroll(BuildContext context) {
  return Container(
    child: SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      child: Row(
        children: eventList.where((obj)=>obj.category=="mis").toList()
            .map((pl) => extraTile( pl,
                  context
                ))
            .toList(),
      ),
    ),
  );
}



  Widget extraTile(EventList object,BuildContext context) {
    return GestureDetector (
      child: CategoryTile(image: object.image, name: object.name, size: 120, raduis: 10,),
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=>DetailPage(object: object,) ));
      },
    );
  }

