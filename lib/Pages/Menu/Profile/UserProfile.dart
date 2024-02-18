import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UserProfile extends StatefulWidget {
  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var screenWidth;
  var popUpIsShowing = false;
  var width, height;

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        drawer: NavigationDrawerWidget(),
        body: Builder(
            builder: (context) => Stack(
                  children: [
                    SafeArea(
                      child: Column(children: [
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  width: 40,
                                  height: 40,
                                  margin: EdgeInsets.only(left: 20),
                                  decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(20),
                                  ),
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: Colors.white,
                                    size: 25,
                                  )),
                            ),
                            Transform.translate(
                              offset: Offset(-2.0, 0.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                        "assets/images/image_avatar.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Ayoub Seddiki".toUpperCase(),
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: "Montserrat"),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width * 0.3,
                          height: 1,
                          color: Colors.deepOrange,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Wrap(
                          alignment: WrapAlignment.center,
                          spacing:
                              10, // Espacement horizontal entre les éléments
                          runSpacing:
                              10, // Espacement vertical entre les lignes
                          children: [
                            makeCardInformation(
                                "assets/images/icon_gmail_3.png",
                                "ayoubseddiki132@gmail.com"),
                            makeCardInformation(
                                "assets/images/icon_telephone.png",
                                "0643559539"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IntrinsicWidth(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                popUpIsShowing = !popUpIsShowing;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      MyAppBoxShadow.boxShadowSecond
                                    ]),
                                child: Row(children: [
                                  Image(
                                    image:
                                        AssetImage("assets/images/logo2.png"),
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Vous Avez 5 colies en commun"
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: MyAppColors.backgroundColor,
                                        fontSize: 9,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        makeCardReview(),
                        SizedBox(
                          height: 10,
                        ),
                        makeCardReview(),
                      ]),
                    ),
                    AnimatedOpacity(
                      opacity: popUpIsShowing ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Visibility(
                        visible: popUpIsShowing,
                        child: Container(
                          width: width,
                          height: height,
                          decoration: BoxDecoration(
                            color: Color.fromARGB(194, 0, 0, 0),
                          ),
                          child: renderPopUp(),
                        ),
                      ),
                    )
                  ],
                )));
  }

  Widget renderPopUp() {
    return Center(
      child: Container(
          width: width * 0.8,
          height: height * 0.5,
          decoration: BoxDecoration(
            color: Color.fromARGB(194, 0, 0, 0),
          ),
          child: Container(
            padding: EdgeInsets.symmetric(horizontal: 10),
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                gradient: LinearGradient(
                  colors: [
                    Colors.white,
                    Colors.white,
                  ],
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                )),
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        child: Column(children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Image(
                              image: AssetImage("assets/images/logo2.png"),
                              width: 25),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            "colies en communs".toUpperCase(),
                            style: TextStyle(
                                color: Colors.black,
                                fontFamily: "Montserrat",
                                fontSize: 11,
                                fontWeight: FontWeight.bold),
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Expanded(
                              child: Container(
                            height: 1,
                            color: Colors.deepOrange,
                            width: double.infinity,
                          )),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                popUpIsShowing = !popUpIsShowing;
                              });
                            },
                            child: Container(
                                width: 30,
                                height: 30,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(15),
                                    color: Colors.black),
                                child: Icon(
                                  Icons.highlight_remove_outlined,
                                  color: Colors.white,
                                )),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      GestureDetector(
                        onTap: () {
                          /*
                          Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context) => ColieInformation()),
                          );
                          */
                        },
                        child: Container(
                          padding: EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              color: MyAppColors.backgroundColor,
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                              borderRadius: BorderRadius.circular(10)),
                          child: Row(children: [
                            Container(
                                width: 40,
                                height: 40,
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.deepOrange,
                                    borderRadius: BorderRadius.circular(20),
                                    boxShadow: [
                                      MyAppBoxShadow.boxShadowSecond
                                    ]),
                                child: Image(
                                  image: AssetImage("assets/images/logo2.png"),
                                  width: 20,
                                )),
                            SizedBox(width: 10),
                            Container(
                                width: 1, height: 20, color: Colors.deepOrange),
                            SizedBox(width: 10),
                            Text(
                              "AZERTY - 923848",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Montserrat",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13),
                            ),
                          ]),
                        ),
                      ),
                    ])),
                  ]),
            ),
          )),
    );
  }

  Widget makeCardInformation(String iconPath, String value) {
    return IntrinsicWidth(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 5),
        margin: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: MyAppColors.whiteCardColor,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [MyAppBoxShadow.boxShadowSecond],
            border: Border.all(
                color: Color.fromRGBO(1, 1, 1, 0.17647058823529413))),
        child: Row(
          children: [
            Image.asset(iconPath, width: 20, height: 20),
            SizedBox(
              width: 2,
            ),
            Text(
              value.toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 9,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Montserrat"),
            )
          ],
        ),
      ),
    );
  }

  Widget makeCardReview() {
    return Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Row(children: [
              Container(
                height: 50,
                width: 50,
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
              SizedBox(
                width: 10,
              ),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "AYOUB SEDDIKI".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 11),
                ),
                Text(
                  "10/01/2023".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 11),
                )
              ]),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(children: [
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star,
                color: Colors.amber,
              ),
              Icon(
                Icons.star_border,
                color: Colors.black45,
              ),
            ]),
            SizedBox(
              height: 10,
            ),
            Text(
              "Le livreur était ponctuel et professionnel. La livraison s'est déroulée sans encombre, et le colis était parfaitement emballé. Service impeccable, je referai appel à ce livreur sans hésiter.",
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            )
          ],
        ));
  }
}
