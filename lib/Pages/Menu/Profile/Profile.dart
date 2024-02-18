import 'package:deliver_ease/Pages/Menu/Profile/DemandeLivreur.dart';
import 'package:deliver_ease/Pages/Menu/Profile/UpdateProfile.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliver_ease/Services/shared_service.dart';

class Profile extends StatefulWidget {
  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  var screenWidth;
  var popUpIsShowing = false;
  var width, height;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (!isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/login');
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
                            child:
                                Image.asset("assets/images/image_avatar.jpg"),
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
                      "Said Mounji".toUpperCase(),
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
                        makeCardInformation("assets/images/icon_gmail_3.png",
                            "saidmounjisam@gmail.com"),
                        makeCardInformation(
                            "assets/images/icon_telephone.png", "0643559539"),
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
                          makeCardSettings(
                              "assets/images/nom_icon.png", "Gerer mon profile",
                              () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProfile()),
                            );
                          }),
                          makeCardSettings("assets/images/icon_req.png",
                              "Gerer mes demandes", () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => DemandeLivreur()),
                            );
                          }),
                          makeCardSettings("assets/images/icon_chance.png",
                              "Offers management", () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => UpdateProfile()),
                            );
                          }),
                        ],
                      ),
                    ),
                  ]),
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
}
