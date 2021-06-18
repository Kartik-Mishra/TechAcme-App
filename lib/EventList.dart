import 'package:techacme_app/Data.dart';
import 'package:flutter/material.dart';
import 'package:techacme_app/Detailpage.dart';
import 'package:techacme_app/widgets/categoryTile.dart';

class EventScrollList extends StatelessWidget {
  CategoryList list;
   EventScrollList({this.list});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(list.name , style: TextStyle(fontFamily: "OpenSans"),),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          itemCount: list.list.length,
          itemBuilder: (context , num){
            double size = MediaQuery.of(context).size.height/5 ;
           String name = list.list[num].name;
           String image = list.list[num].image;
            return SingleChildScrollView(
              scrollDirection: Axis.vertical,
                        child: InkWell(
                          child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:0.0 , horizontal: 4),
                  child: Material(
                    elevation: 10,
                    color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.circular(8),
                   child: Container(
                   decoration: new BoxDecoration(color: Color.fromARGB(255, 60, 60, 60),
                    borderRadius: BorderRadius.circular(8),
                    border: new Border.all(color: Color.fromARGB(255, 100, 100, 100 )),
                    boxShadow: [BoxShadow(color: Colors.black54)],
                    ),
                    
                    child: CategoryTile(image:image, name: name , size: size,),
                  ),),
                ),
               onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => DetailPage(
                         object: list.list[num],
                        )),
              );
          }, 
              ),
            );
          },
        ),
      ),
    );
  }
}
