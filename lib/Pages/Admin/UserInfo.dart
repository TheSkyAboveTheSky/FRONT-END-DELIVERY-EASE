import 'package:deliver_ease/Models/Enums/role.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Pages/Admin/TrajetsLivreur.dart';
import 'package:deliver_ease/Pages/Admin/UserColies.dart';
import 'package:deliver_ease/Pages/Admin/UserReviews.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliver_ease/Services/user_service.dart';

class UserInfo extends StatefulWidget {
  final User user;

  const UserInfo({super.key, required this.user});

  @override
  State<UserInfo> createState() => _UserInfoState();
}

class _UserInfoState extends State<UserInfo> {
  var isAdmin = false;
  var isSender = false;
  var isDeliveryPerson = false;
  var screenWidth;
  var popUpIsShowing = false;
  var width, height;
  var isBanned = false;

  @override
  void initState() {
    super.initState();
    _checkRole();
    setState(() {
      isBanned = widget.user.accountStatus == "DEACTIVATED";
    });
  }

  void _checkRole() {
    Role? role = widget.user.role;
    if (role == Role.ADMIN) {
      isAdmin = true;
    } else if (role == Role.SENDER) {
      isSender = true;
    } else if (role == Role.DELIVERY_PERSON) {
      isDeliveryPerson = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        drawer: NavigationDrawerWidget(),
        body: Builder(
            builder: (context) => SafeArea(
                  child: Column(
                    children: [
                      Expanded(
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
                              Container(
                                height: 70,
                                width: 70,
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
                              GestureDetector(
                                onTap: () {
                                  Scaffold.of(context).openDrawer();
                                },
                                child: Container(
                                    width: 40,
                                    height: 40,
                                    margin: EdgeInsets.only(right: 20),
                                    decoration: BoxDecoration(
                                      color: Colors.black,
                                      borderRadius: BorderRadius.circular(20),
                                    ),
                                    child: Icon(
                                      Icons.menu,
                                      color: Colors.white,
                                      size: 25,
                                    )),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            "${widget.user.firstName} ${widget.user.lastName}"
                                .toUpperCase(),
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
                            spacing: 10,
                            runSpacing: 10,
                            children: [
                              makeCardInformation(
                                  "assets/images/icon_gmail_3.png",
                                  "${widget.user.email}"),
                              makeCardInformation(
                                  "assets/images/icon_telephone.png",
                                  "${widget.user.phoneNumber}"),
                              if (isDeliveryPerson)
                                makeCardInformation(
                                    "assets/images/icon_livreur.png",
                                    "Livreur"),
                              if (isSender)
                                makeCardInformation(
                                    "assets/images/nom_icon.png",
                                    "Expéditeur"),
                            ],
                          ),
                          SizedBox(
                            height: 50,
                          ),
                          SizedBox(
                            width: screenWidth * 0.9,
                            child: Wrap(
                              runSpacing: 15,
                              children: [
                                if (isSender)
                                  makeCardSettings("assets/images/nom_icon.png",
                                      "Voire les colies de l'utilisateur", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UsersColies(user: widget.user)),
                                    );
                                  }),
                                if (isDeliveryPerson)
                                  makeCardSettings(
                                      "assets/images/icon_rating.png",
                                      "Voire les avis sur l'utilisateur", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              UserReviews(user: widget.user)),
                                    );
                                  }),
                                if (isDeliveryPerson)
                                  makeCardSettings(
                                      "assets/images/itineraire.png",
                                      "Voire les trajets de l'Utilisateur", () {
                                    Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) =>
                                              TrajetLivreur(user: widget.user)),
                                    );
                                  }),
                              ],
                            ),
                          ),
                        ]),
                      ),
                      Row(children: [
                        GestureDetector(
                          onTap: () {
                            isBanned ? activerleCompte() : banneCompte();
                          },
                          child: Container(
                            width: screenWidth * 0.8,
                            margin: EdgeInsets.only(
                                left: screenWidth * 0.1,
                                bottom: screenWidth * 0.025),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            decoration: BoxDecoration(
                                color: isBanned ? Colors.green : Colors.black,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Image(
                                  image: isBanned
                                      ? AssetImage(
                                          "assets/images/icon_activer.png")
                                      : AssetImage(
                                          "assets/images/icon_banne.png"),
                                  width: 23,
                                ),
                                SizedBox(
                                  width: 10,
                                ),
                                Text(
                                  (isBanned
                                          ? "Activer le compte"
                                          : "Banner le compte")
                                      .toUpperCase(),
                                  style: TextStyle(
                                      color: MyAppColors.backgroundColor,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "Montserrat",
                                      fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                        )
                      ])
                    ],
                  ),
                )));
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

  Widget makeCardSettings(String iconPath, String value, Function() onClick) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: screenWidth * 0.025),
      height: 60,
      decoration: BoxDecoration(
        color: MyAppColors.whiteCardColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [MyAppBoxShadow.boxShadowSecond],
      ),
      child: InkWell(
        onTap: onClick,
        child: Row(
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Colors.white.withOpacity(0.7),
                boxShadow: [MyAppBoxShadow.boxShadowSecond],
              ),
              child: Center(
                child: Image.asset(
                  iconPath,
                  height: 25,
                  width: 25,
                ),
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: Text(
                value.toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Row(
              children: [
                Icon(Icons.chevron_right,
                    size: 12, color: Colors.black.withOpacity(0.2)),
                Icon(Icons.chevron_right,
                    size: 15, color: Colors.black.withOpacity(0.5)),
                Icon(Icons.chevron_right,
                    size: 18, color: Colors.black.withOpacity(1)),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void activerleCompte() async {
    await UserService.activerUserAccount(widget.user.id!);
    setState(() {
      isBanned = false;
    });
  }

  void banneCompte() async {
    await UserService.deactiverUserAccount(widget.user.id!);
    setState(() {
      isBanned = true;
    });
  }
}
