import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Profile/UserProfile.dart';
import 'package:deliver_ease/Widgets/MakeCardColieTrajet.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListColiesTrajet extends StatefulWidget {
  const ListColiesTrajet({Key? key}) : super(key: key);

  @override
  State<ListColiesTrajet> createState() => _ListColiesTrajetState();
}

class _ListColiesTrajetState extends State<ListColiesTrajet> {
  var screenWidth;

  List<Colie> colies = [];

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        appBar: AppBar(
          title: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Image(
                    image: AssetImage(
                      "assets/images/logo2.png",
                    ),
                    width: 30,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Text(
                    "DELIVER ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Cairo",
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "EASE",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontFamily: "Cairo",
                        fontSize: 21,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
              GestureDetector(
                onTap: () {
                  Scaffold.of(context).openDrawer();
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
            ],
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                Container(
                  height: 1,
                  width: double.infinity,
                  color: MyAppColors.orangeLight2,
                ),
                Column(
                  children: List.generate(colies.length, (index) {
                    return MakeCardColieTrajet(colieData: colies[index]);
                  }),
                )
              ],
            ),
          ),
        ));
  }
}
