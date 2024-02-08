import 'package:deliver_ease/Widgets/button_widget.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  @override
  Widget build(BuildContext context) => SafeArea(
    child: Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      drawer: NavigationDrawerWidget(),
      body: Builder(
        builder: (context) => Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
               Row(
                 crossAxisAlignment: CrossAxisAlignment.center,
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: [
                   Row(children: [
                     Text("DELIVER " , style: TextStyle(color: Colors.black, fontFamily: "Cairo",fontSize: 21,fontWeight: FontWeight.bold),),
                     Text("EASE", style: TextStyle(color : Colors.deepOrange, fontFamily: "Cairo", fontSize: 21, fontWeight:  FontWeight.bold),)
                   ],),
                   GestureDetector(
                     onTap: (){
                      Scaffold.of(context).openDrawer();
                      // Scaffold.of(context).openEndDrawer();
                      },
                     child: Container(
                       height: 40,
                       width: 40,
                       padding: EdgeInsets.all(2),
                       decoration: BoxDecoration(
                         border: Border.all(color: Colors.deepOrange),
                         borderRadius: BorderRadius.circular(40),
                       ),
                       child: ClipRRect(
                         borderRadius: BorderRadius.circular(40),
                         child: Image.asset("assets/images/image_avatar.jpg"),
                       ),
                     ),
                   ),
               ],),

            ],

          ),
        ),
      ),
    ),

  );
}