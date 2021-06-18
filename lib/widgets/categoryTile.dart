import 'package:flutter/material.dart';

class CategoryTile extends StatelessWidget {
  String image, name;
  double raduis;
double size;
  CategoryTile({this.image, this.name , this.size , this.raduis=6});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
         // Hero(
          //  tag: image,
           // child:
             Container(
              height: size,
              width: size,
              decoration: BoxDecoration(
                border: Border.all(
                  color: Colors.white.withOpacity(0.7)
                ),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(raduis),
                // boxShadow: [
                //   BoxShadow(
                //           offset: Offset(0.2, 1.0),
                //           blurRadius: 2,
                //           color: Colors.black.withOpacity(0.9))
                //     ]
              ),
            ),
        //  ),
          Container(
            width: 130,
            height: 20,
            margin: EdgeInsets.only(top: 5),
            child: Text(
              name,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 13,
                  fontFamily: "OpenSans",
                  fontWeight: FontWeight.w400,
                  color: Colors.white.withOpacity(0.9)),
            ),
          ),
        ],
      ),
    );
  }
}
