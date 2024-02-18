import 'package:deliver_ease/Models/address_model.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Pages/Menu/MenuPage.dart';
import 'package:deliver_ease/Widgets/button_widget.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/FunctionsUtils.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ChoisirDestination extends StatefulWidget {
  @override
  _ChoisirDestinationState createState() => _ChoisirDestinationState();
}

class _ChoisirDestinationState extends State<ChoisirDestination> {
  String? depart;
  String? destination;
  late var screenWidth;
  late Color dominantColor = Colors.black;
  Future<void> setDominantColor() async {
    Color? extractedColor = await FunctionUtils.extractDominantColor(
        "assets/images/image_ville.jpg");
    setState(() {
      dominantColor = extractedColor ?? MyAppColors.blueSecondColor;
    });
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    screenWidth = MediaQuery.of(context).size.width;
    final desiredHeight = screenHeight * 0.6;

    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        drawer: NavigationDrawerWidget(),
        body: Builder(
          builder: (context) => Stack(
            children: [
              Positioned.fill(
                child: Stack(
                  children: [
                    Container(
                      height: desiredHeight,
                      child: Stack(children: [
                        Container(
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/image_ville.jpg"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                Color.fromRGBO(1, 1, 1, 0.5450980392156862),
                                dominantColor?.withOpacity(0.7) ??
                                    MyAppColors.blueSecondColor
                              ],
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                            ),
                          ),
                        ),
                      ]),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(top: desiredHeight - 80),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(20))),
                      ),
                    ),
                    Positioned(
                      top: screenHeight - 80,
                      left: screenWidth / 2 - 100,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
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
                    )
                  ],
                ),
              ),
              Positioned(
                width: screenWidth * 2.3 / 3,
                left: screenWidth / 2 - (screenWidth * 2.3 / 3) / 2,
                top: desiredHeight - 250,
                child: Container(
                    padding: EdgeInsets.all(15),
                    width: double.infinity,
                    height: 370,
                    decoration: BoxDecoration(
                        color: MyAppColors.backgroundColor,
                        boxShadow: [MyAppBoxShadow.boxShadowSecond],
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Bienvenue".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Montserrat",
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  height: 3,
                                ),
                                Text(
                                  "SAID Mounji",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontFamily: "Montserrat",
                                      fontSize: 11,
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
                                  child: Image.asset(
                                      "assets/images/image_avatar.jpg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          height: 1,
                          width: double.infinity,
                          decoration: BoxDecoration(color: Colors.deepOrange),
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Column(children: [
                          Row(children: [
                            Image(
                              image: AssetImage(
                                  "assets/images/icon_addresse_expedition.png"),
                              width: 20,
                            ),
                            SizedBox(width: 10),
                            Text("adresse d'expedition".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold))
                          ]),
                          SizedBox(height: 10),
                          CupertinoTextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Nunito",
                                fontSize: 13),
                            placeholder: 'Rabat',
                            placeholderStyle: TextStyle(
                                color: Color.fromRGBO(
                                    103, 103, 103, 0.7333333333333333),
                                fontSize: 13),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: MyAppColors.whiteCardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                            ),
                            onChanged: (value) {
                              depart = value;
                            },
                          ),
                          SizedBox(height: 10),
                          Row(children: [
                            Image(
                              image: AssetImage(
                                  "assets/images/icon_addresse_destination.png"),
                              width: 20,
                            ),
                            SizedBox(width: 10),
                            Text("adresse destination".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold))
                          ]),
                          SizedBox(height: 10),
                          CupertinoTextField(
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Nunito",
                                fontSize: 13),
                            placeholder: 'Rabat',
                            placeholderStyle: TextStyle(
                                color: Color.fromRGBO(
                                    103, 103, 103, 0.7333333333333333),
                                fontSize: 13),
                            padding: EdgeInsets.symmetric(
                                horizontal: 16, vertical: 16),
                            decoration: BoxDecoration(
                              color: MyAppColors.whiteCardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                            ),
                            onChanged: (value) {
                              destination = value;
                            },
                          ),
                          SizedBox(height: 10),
                          Container(
                            width: double.infinity,
                            child: MaterialButton(
                              onPressed: () {
                                if(depart!="" && destination!="")
                                {
                                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => MenuPage(addDepart: City(city: depart), addArrive: City(city: destination))));
                                }
                              },
                              height: 50,
                              color: Colors.deepOrange,
                              child: Text(
                                "Chercher".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Cairo"),
                              ),
                              padding: EdgeInsets.symmetric(
                                  vertical: 10, horizontal: 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Image(
                            image: AssetImage(
                                "assets/images/livraison_rapide.png"),
                            width: 30,
                          )
                        ])
                      ],
                    )),
              )
            ],
          ),
        ),
      ),
    );
  }
}
