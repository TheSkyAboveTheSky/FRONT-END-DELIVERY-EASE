import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Colies/ColieForm.dart';
import 'package:deliver_ease/Pages/Menu/Colies/ColieInformation.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Pages/Menu/Profile/Profile.dart';
import 'package:deliver_ease/Services/parcel_service.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Colies extends StatefulWidget {
  @override
  State<Colies> createState() => _ColiesState();
}

class _ColiesState extends State<Colies> {
  List<Colie> colies = [];

  @override
  void initState() {
    super.initState();
    setColies();
    _checkAuthentication();
    _checkSender();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (!isAuthenticated) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future<void> _checkSender() async {
    bool isSender = await SharedService.isSender();
    if (!isSender) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => Profile()));
    }
  }

  void setColies() async {
    List<Colie>? colies = await ColieService.getAllColie();
    setState(() {
      this.colies = colies ?? [];
    });
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        drawer: NavigationDrawerWidget(),
        body: Builder(
          builder: (context) => SafeArea(
            child: Padding(
              padding: EdgeInsets.all(10),
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
                          SizedBox(width: 5),
                          Text(
                            "DELIVER ",
                            style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Cairo",
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            "EASE",
                            style: TextStyle(
                              color: Colors.deepOrange,
                              fontFamily: "Cairo",
                              fontSize: 21,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
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
                  SizedBox(height: 10),
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: MyAppColors.orangeLight2,
                  ),
                  SizedBox(height: 20),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => ColieForm()),
                      );
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Image(
                              image: AssetImage("assets/images/icon_flash.png"),
                              width: 20,
                            ),
                            SizedBox(width: 10),
                            Text(
                              "mes colies".toUpperCase(),
                              style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: "Montserrat",
                              ),
                            ),
                          ],
                        ),
                        Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Row(
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/livraison_rapide.png"),
                                width: 20,
                              ),
                              SizedBox(width: 5),
                              Text(
                                "Saisir une colie".toUpperCase(),
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Cairo",
                                  fontSize: 11,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10),
                  Expanded(
                    child: ListView.builder(
                      itemCount: colies.length,
                      itemBuilder: (context, index) {
                        Colie colie = colies[index];
                        return makeCardColie(colie);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );

  Widget makeCardColie(colie) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => ColieInformation(colie: colie)),
        );
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          padding: EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: Colors.white,
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
                  color: Colors.deepOrange,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond],
                ),
                child: Image(
                  image: AssetImage("assets/images/logo2.png"),
                  width: 20,
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
                colie.identifier.toString().toUpperCase(),
                style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

}
