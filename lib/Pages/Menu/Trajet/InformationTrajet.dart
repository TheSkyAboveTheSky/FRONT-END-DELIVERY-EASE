import 'package:animate_do/animate_do.dart';
import 'package:deliver_ease/Models/Enums/status.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/delivery_model.dart';
import 'package:deliver_ease/Models/demande_model.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Profile/UserProfile.dart';
import 'package:deliver_ease/Services/delivery_service.dart';
import 'package:deliver_ease/Services/parcel_service.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Services/user_service.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class InformationTrajet extends StatefulWidget {
  final Trajet trajet;
  InformationTrajet({required this.trajet});
  @override
  State<InformationTrajet> createState() => _InformationTrajetState();
}

class _InformationTrajetState extends State<InformationTrajet> {
  var user = User();
  List<Colie> colies = [];
  List<Demande> demandes = [];
  bool _isSwiping = false;
  int selectedColieId = 0;
  double _dragPosition = 0.0;
  bool popUpIsShowing = false;
  var screenWidth;
  var screenHeight;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
    setUserInfos();
    setColies();
    setDemandes();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (!isAuthenticated) {
      Navigator.push(context,
          MaterialPageRoute(builder: (BuildContext context) => LoginPage()));
    }
  }

  Future<void> setUserInfos() async {
    User? user = await UserService.getUserInfos();
    setState(() {
      this.user = user!;
    });
  }

  void setColies() async {
    List<Colie>? colies = await ColieService.getAllColie();
    setState(() {
      this.colies = colies ?? [];
    });
  }

  void setDemandes() async {
    List<Demande>? demandes =
        await DeliveryService.getDemands(widget.trajet.id!);
    setState(() {
      this.demandes = demandes ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      drawer: NavigationDrawerWidget(),
      body: Builder(
        builder: (context) => Stack(
          children: [
            SafeArea(
              child: FadeInUp(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
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
                                child: Image.asset(
                                    "assets/images/image_avatar.jpg"),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Column(children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 1,
                              color: MyAppColors.orangeLight2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "LIVREUR",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              width: double.infinity,
                              height: 1,
                              color: MyAppColors.orangeLight2,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.push(context,
                                    MaterialPageRoute(builder: (context) {
                                  return UserProfile(
                                      user: widget.trajet.user!);
                                }));
                              },
                              child: Container(
                                height: 80,
                                width: 80,
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
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  (widget.trajet.user!.firstName! +
                                          " " +
                                          widget.trajet.user!.lastName!)
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat"),
                                ),
                                Row(
                                  children: [
                                    Icon(Icons.star, color: Colors.black45),
                                    Text(widget.trajet.user!.rating!.toString(),
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontFamily: "Montserrat",
                                            fontWeight: FontWeight.bold,
                                            fontSize: 19)),
                                  ],
                                ),
                              ],
                            )
                          ],
                        ),
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Column(children: [
                        Row(
                          children: [
                            Container(
                              width: 10,
                              height: 1,
                              color: MyAppColors.orangeLight2,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Trajet".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat"),
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Expanded(
                                child: Container(
                              width: double.infinity,
                              height: 1,
                              color: MyAppColors.orangeLight2,
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.deepOrange),
                                ),
                                Container(
                                  width: 1,
                                  height: 48,
                                  color: Colors.black45,
                                ),
                                Container(
                                  width: 10,
                                  height: 10,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.deepOrange),
                                ),
                              ],
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  widget.trajet.departureAddress!.city!
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                  ),
                                  softWrap: true,
                                ),
                                SizedBox(height: 30.0),
                                Text(
                                  widget.trajet.arrivalAddress!.city!
                                      .toString()
                                      .toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.w700,
                                    fontFamily: "Montserrat",
                                    fontSize: 16,
                                  ),
                                  softWrap: true,
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 15,
                        ),
                        Row(children: [
                          Image(
                            image: AssetImage("assets/images/icon_date.png"),
                            width: 25,
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                              DateFormat('dd-MM-yyyy HH:mm')
                                  .format(widget.trajet.departureDate!),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat")),
                          Icon(Icons.arrow_right_alt),
                          Text(
                              DateFormat('dd-MM-yyyy HH:mm')
                                  .format(widget.trajet.arrivalDate!),
                              style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "Montserrat")),
                        ])
                      ]),
                      SizedBox(
                        height: 10,
                      ),
                      Expanded(
                        child: Column(children: [
                          Row(
                            children: [
                              Container(
                                width: 10,
                                height: 1,
                                color: MyAppColors.orangeLight2,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Mes Colies".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "Montserrat"),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Expanded(
                                  child: Container(
                                width: double.infinity,
                                height: 1,
                                color: MyAppColors.orangeLight2,
                              ))
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          ListView.builder(
                            shrinkWrap: true,
                            physics: NeverScrollableScrollPhysics(),
                            itemCount: demandes.length,
                            itemBuilder: (context, index) {
                              final demande = demandes[index];
                              return makeCardColie(infoColie: demande);
                            },
                          ),
                        ]),
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      GestureDetector(
                        onHorizontalDragUpdate: (details) {
                          _isSwiping = true;
                          setState(() {
                            _dragPosition = (details.globalPosition.dx - 50) /
                                (MediaQuery.of(context).size.width - 100);
                            _dragPosition = _dragPosition.clamp(0.0, 1.0);
                          });
                        },
                        onHorizontalDragEnd: (details) {
                          _isSwiping = false;
                          if (_dragPosition >= 1.0) {
                            popUpIsShowing = !popUpIsShowing;
                            Future.delayed(Duration(seconds: 1), () {
                              setState(() {
                                _dragPosition = 0.0;
                              });
                            });
                          } else {
                            setState(() {
                              _dragPosition = 0.0;
                            });
                          }
                        },
                        child: Stack(
                          children: [
                            Container(
                                height: 60,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: Color.fromRGBO(
                                      224, 224, 224, 0.8117647058823529),
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(color: Colors.deepOrange),
                                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                                ),
                                child: Center(
                                    child: Text(
                                        "Envoyer une colie - Swipe Right "
                                            .toUpperCase(),
                                        style: TextStyle(
                                            color: Color.fromRGBO(
                                                1, 1, 1, 0.3803921568627451),
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "Cairo")))),
                            AnimatedPositioned(
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeInOut,
                              left: _dragPosition *
                                  (MediaQuery.of(context).size.width - 100),
                              top: 5,
                              child: Container(
                                height: 50,
                                width: 70,
                                decoration: BoxDecoration(
                                    color: Color.fromRGBO(11, 11, 11, 1),
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      MyAppBoxShadow.boxShadowSecond
                                    ]),
                                child: Center(
                                    child: Icon(
                                  Icons.arrow_right_alt,
                                  color: Colors.white,
                                )),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            AnimatedOpacity(
              opacity: popUpIsShowing ? 1.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: Visibility(
                visible: popUpIsShowing,
                child: Container(
                  width: screenWidth,
                  height: screenHeight,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(194, 0, 0, 0),
                  ),
                  child: renderPopUp(context),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget renderPopUp(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;
    final double popupWidth = screenWidth * 0.8;
    final double popupHeight = 500;

    Widget makeCardColie(Colie item) {
      Color backgroundColor = MyAppColors.backgroundColor;
      Color textColor = Colors.black;

      if (item.id == selectedColieId) {
        backgroundColor = Colors.deepOrange;
        textColor = Colors.white;
      }

      return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(5),
          decoration: BoxDecoration(
            color: backgroundColor,
            boxShadow: [MyAppBoxShadow.boxShadowSecond],
            borderRadius: BorderRadius.circular(10),
          ),
          child: Row(
            children: [
              Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                ),
                child: Image(
                  image: AssetImage("assets/images/logo2.png"),
                  width: 10,
                ),
              ),
              SizedBox(width: 10),
              Container(
                width: 1,
                height: 20,
                color: Colors.deepOrange,
              ),
              SizedBox(width: 10),
              Text(
                "${item.id.toString().toUpperCase()} ${item.identifier}",
                style: TextStyle(
                  color: textColor,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 11,
                ),
              ),
            ],
          ),
        ),
      );
    }

    void _toggleSelection(int id) {
      setState(() {
        selectedColieId = id;
      });
    }

    return Center(
      child: Container(
        width: popupWidth,
        height: popupHeight,
        decoration: BoxDecoration(
          color: Color.fromARGB(194, 0, 0, 0),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [Colors.white, Colors.white],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildHeader(),
              Expanded(
                child: ListView.builder(
                  itemCount: colies.length,
                  itemBuilder: (context, index) {
                    final item = colies[index];
                    if (item.status == Status.UNSELECTED) {
                      return GestureDetector(
                        onTap: () {
                          _toggleSelection(item.id!);
                        },
                        child: makeCardColie(item),
                      );
                    } else {
                      return Container();
                    }
                  },
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                width: double.infinity,
                child: MaterialButton(
                  onPressed: () {
                    envoyerDemande();
                    Navigator.pop(context);
                  },
                  height: 40,
                  color: Colors.deepOrange,
                  child: Text(
                    "Envoyer".toUpperCase(),
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 13.0,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo"),
                  ),
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildHeader() {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          buildHeaderIcon(),
          SizedBox(width: 5),
          buildHeaderText(),
          SizedBox(width: 5),
          Expanded(
            child: buildHeaderDivider(),
          ),
          buildCloseButton(),
        ],
      ),
    );
  }

  Widget buildHeaderIcon() {
    return Container(
      width: 25,
      height: 25,
      child: Image(image: AssetImage("assets/images/logo2.png")),
    );
  }

  Widget buildHeaderText() {
    return Text(
      "choisir une colie a envoyer".toUpperCase(),
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Montserrat",
        fontSize: 10,
        fontWeight: FontWeight.bold,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget buildHeaderDivider() {
    return Container(
      height: 1,
      color: Colors.deepOrange,
      width: double.infinity,
    );
  }

  Widget buildCloseButton() {
    return GestureDetector(
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
          color: Colors.black,
        ),
        child: Icon(Icons.highlight_remove_outlined, color: Colors.white),
      ),
    );
  }

  Widget makeCardColie({Demande? infoColie}) {
    return Column(
      children: [
        Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(children: [
            Image(
              image: AssetImage("assets/images/logo2.png"),
              width: 30,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              infoColie!.identifier!.toString(),
              style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo"),
            )
          ]),
          Row(children: [makeCardStatus(status: infoColie.status)])
        ]),
        SizedBox(
          height: 10,
        )
      ],
    );
  }

  Widget makeCardStatus({Status? status}) {
    Color color;

    switch (status) {
      case Status.UNCONFIRMED:
        color = Color.fromRGBO(255, 100, 11, 1.0);
        break;
      case Status.ACCEPTED:
        color = Colors.green;
        break;
      case Status.IN_TRANSIT:
        color = Colors.yellow;
        break;
      case Status.DELIVERED:
        color = Color.fromRGBO(101, 224, 2, 1.0);
        break;
      default:
        color = Colors.grey;
    }

    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [MyAppBoxShadow.boxShadowSecond]),
      child: Text(
        status.toString().split('.').last.toUpperCase(),
        style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontFamily: "Montserrat",
            fontSize: 11),
      ),
    );
  }

  void _validate() {
    showDialog(
      context: context,
      builder: (context) => Container(
        width: screenWidth * 0.8,
        height: 300,
        decoration: BoxDecoration(
          color: MyAppColors.backgroundColor,
        ),
        child: Column(children: []),
      ),
    );
  }

  void envoyerDemande() async {
    if (selectedColieId != 0) {
      Colie? selectedColie;
      for (var colie in colies) {
        if (colie.id == selectedColieId) {
          selectedColie = colie;
          break;
        }
      }
      DeliveryService.addDelivery(DeliveryDemandeRequest(
          parcel: selectedColie!,
          user: widget.trajet.user!,
          trajet: widget.trajet));
    }
  }
}
