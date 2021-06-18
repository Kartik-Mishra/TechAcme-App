import 'package:techacme_app/Data.dart';
import 'package:flutter/material.dart';
import 'package:techacme_app/Detailpage.dart';

class FavoriteList extends StatefulWidget {

  FavoriteListState createState() => FavoriteListState();
}

class FavoriteListState extends State<FavoriteList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
   print("fav");
     getFavorites();
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: new Text("Favourites" , style: TextStyle(fontFamily: "OpenSans"),),
      ),
      body: ListView.builder(
        itemCount: favorites.length,
        itemBuilder: (context, num) {
          String name = favorites[num].name;
          String image = favorites[num].image;

          return SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: InkWell(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 8),
                child: Container(
                 // elevation: 10,
                  
                 
                  decoration: BoxDecoration(
 borderRadius: BorderRadius.circular(8),
 border: Border.all(color: Colors.white.withOpacity(0.8)),
color: Color.fromARGB(255, 60, 60, 60),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical:10.0 , horizontal: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        CircleAvatar(
                          radius: 30,
                          backgroundImage: AssetImage(image),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2,
                          child: Text(name , style: TextStyle(fontFamily: "OpenSans" , fontSize: 16),)),
                        IconButton(
                          icon: Icon(Icons.star, color: Color.fromARGB(255, 255, 255, 255), size: 26,),
                          onPressed: () {
                            setState(() {
                              
                                favorites.remove(favorites[num]);
                              
                            });
                          },
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => DetailPage(
                            object: favorites[num],
                          )),
                );
              },
            ),
          );
        },
      ),
    );
  }
}
