import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Trajet/InformationTrajet.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Services/trip_service.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MenuPage extends StatefulWidget {
  final City addDepart;
  final City addArrive;
  MenuPage({required this.addDepart, required this.addArrive});
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  List<Trajet> trajets = [];
  @override
  void initState() {
    super.initState();
    setTrajets();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (!isAuthenticated) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  void setTrajets() async {
    List<Trajet>? trajets = await TrajetService.searchTrajets(RechercheTrajet(
        departureCity: widget.addDepart, arrivalCity: widget.addArrive));
    setState(() {
      this.trajets = trajets ?? [];
    });
  }

  @override
  Widget build(BuildContext context) => SafeArea(
        child: Scaffold(
          backgroundColor: MyAppColors.backgroundColor,
          drawer: NavigationDrawerWidget(),
          body: Builder(
            builder: (context) => Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
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
                            child:
                                Image.asset("assets/images/image_avatar.jpg"),
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
                    color: MyAppColors.orangeLight2,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  IntrinsicWidth(
                    child: Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                      decoration: BoxDecoration(
                          color: Colors.black,
                          borderRadius: BorderRadius.circular(10)),
                      child: Row(children: [
                        Icon(Icons.arrow_back_ios_new_outlined,
                            size: 18, color: Colors.white),
                        SizedBox(
                          width: 10,
                        ),
                        Row(children: [
                          Image(
                            image: AssetImage(
                                "assets/images/icon_addresse_expedition_2.png"),
                            width: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.addDepart.city.toString().toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: "Cairo"),
                          ),
                          Icon(
                            Icons.arrow_right_alt,
                            size: 24,
                            color: Colors.white,
                          ),
                          Image(
                            image: AssetImage(
                                "assets/images/icon_addresse_destination.png"),
                            width: 20,
                          ),
                          SizedBox(
                            width: 5,
                          ),
                          Text(
                            widget.addArrive.city.toString().toUpperCase(),
                            style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 13,
                                fontFamily: "Cairo"),
                          )
                        ])
                      ]),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: trajets.length,
                      itemBuilder: (context, index) {
                        Trajet trajet = trajets[index];
                        return GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        InformationTrajet(trajet: trajet)));
                          },
                          child: Column(
                            children: [
                              SizedBox(height: 10),
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width *
                                      2.8 /
                                      3,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: Colors.white,
                                      boxShadow: [
                                        MyAppBoxShadow.boxShadowSecond
                                      ]),
                                  child: Padding(
                                    padding: const EdgeInsets.all(15.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              width: 60,
                                              height: 60,
                                              padding: EdgeInsets.all(2),
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                border: Border.all(
                                                    color: Colors.deepOrange,
                                                    width: 2),
                                              ),
                                              child: GestureDetector(
                                                onTap: () {},
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
                                                  child: Image.asset(
                                                      "assets/images/image_avatar.jpg"),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              width: 20,
                                            ),
                                            Expanded(
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                    trajet.user!.firstName!,
                                                    style: TextStyle(
                                                      color: Colors.black,
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      fontFamily: "Montserrat",
                                                      fontSize: 16,
                                                    ),
                                                    softWrap: true,
                                                  ),
                                                  Row(
                                                    children: [
                                                      Icon(Icons.star,
                                                          color:
                                                              Colors.black45),
                                                      Text(
                                                          trajet.user!.rating
                                                              .toString(),
                                                          style: TextStyle(
                                                              color:
                                                                  Colors
                                                                      .black45,
                                                              fontFamily:
                                                                  "Montserrat",
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              fontSize: 19)),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Row(children: [
                                              Text(
                                                trajet.cost.toString(),
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "Montserrat"),
                                              ),
                                              SizedBox(
                                                width: 5,
                                              ),
                                              Image(
                                                image: AssetImage(
                                                    "assets/images/icon_money.png"),
                                                width: 20,
                                              )
                                            ]),
                                          ],
                                        ),
                                        Container(
                                          width: double.infinity,
                                          height: 2,
                                          color: Colors.black12,
                                        ),
                                        Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Column(
                                                children: [
                                                  Text(
                                                    DateFormat(
                                                            'dd-MM-yyyy HH:mm')
                                                        .format(trajet
                                                            .departureDate!),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  Text(
                                                    "${trajet.arrivalDate!.difference(trajet.departureDate!).inHours}h ${trajet.arrivalDate!.difference(trajet.departureDate!).inMinutes.remainder(60)}m",
                                                    style: TextStyle(
                                                        color: Colors.black12,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                  SizedBox(
                                                    height: 20,
                                                  ),
                                                  Text(
                                                    DateFormat(
                                                            'dd-MM-yyyy HH:mm')
                                                        .format(trajet
                                                            .arrivalDate!),
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontFamily:
                                                            "Montserrat",
                                                        fontWeight:
                                                            FontWeight.bold,
                                                        fontSize: 18),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(width: 20),
                                              Column(children: [
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black54,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                                Container(
                                                  height: 60,
                                                  width: 2,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black54),
                                                ),
                                                Container(
                                                  width: 10,
                                                  height: 10,
                                                  decoration: BoxDecoration(
                                                      color: Colors.black54,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5)),
                                                ),
                                              ]),
                                              SizedBox(width: 20),
                                              Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Row(children: [
                                                      Image(
                                                        image: AssetImage(
                                                            "assets/images/logo2.png"),
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        trajet.departureAddress!
                                                            .city!
                                                            .toString()
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ]),
                                                    SizedBox(
                                                      height: 30,
                                                    ),
                                                    Row(children: [
                                                      Image(
                                                        image: AssetImage(
                                                            "assets/images/livraison_de_colis_dest.png"),
                                                        width: 20,
                                                      ),
                                                      SizedBox(
                                                        width: 10,
                                                      ),
                                                      Text(
                                                        trajet.arrivalAddress!
                                                            .city!
                                                            .toString()
                                                            .toUpperCase(),
                                                        style: TextStyle(
                                                            color: Colors.black,
                                                            fontFamily:
                                                                "Montserrat",
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontSize: 16),
                                                      ),
                                                    ]),
                                                  ]),
                                            ]),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
            ),
          ),
        ),
      );
}
