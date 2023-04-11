import 'package:flutter/material.dart';

class MenuCard extends StatelessWidget{
  const MenuCard ({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      margin: EdgeInsets.fromLTRB(10, 10, 10, 10),
      padding: EdgeInsets.fromLTRB(0, 25, 0, 25),
      // color: Colors.white,
      height: 100,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            // offset: Offset(5, 5),
          ),
        ],
      ),
      child: GridView(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 4,
          mainAxisSpacing: 2,
          crossAxisSpacing: 1,
          childAspectRatio: 1 / 0.3,
        ),
        children: [
          Icon(Icons.restaurant, color: Colors.amber,),
          Icon(Icons.local_drink, color: Colors.cyan,),
          Icon(Icons.delete_outline, color: Colors.red,),
          Icon(Icons.videocam, color: Colors.lightGreen,),
          Text("Food", textAlign: TextAlign.center,),
          Text("Water", textAlign: TextAlign.center,),
          Text("Clean", textAlign: TextAlign.center,),
          Text("Camera", textAlign: TextAlign.center,),
        ],
      ),
    );
  }
}