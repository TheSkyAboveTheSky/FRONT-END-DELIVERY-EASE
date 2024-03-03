import 'package:deliver_ease/Models/Enums/role.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Pages/Admin/UserInfo.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Services/user_service.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Users extends StatefulWidget {
  @override
  State<Users> createState() => _UsersState();
}

class _UsersState extends State<Users> {
  List<User> users = [];
  var screenWidth;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
    setUserInfos();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (!isAuthenticated) {
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => LoginPage()));
    }
  }

  Future<void> setUserInfos() async {
    List<User>? users = await UserService.getAllUsers();
    setState(() {
      this.users = users!;
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
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
        )),
        body: Builder(
            builder: (context) => SafeArea(
                  child: Container(
                    width: screenWidth * 0.9,
                    margin: EdgeInsets.only(
                        top: 10, bottom: 10, left: screenWidth * 0.05),
                    child: Column(
                      children: [
                        SizedBox(height: 10),
                        CupertinoTextField(
                          style: TextStyle(
                              color: Colors.black,
                              fontFamily: "Nunito",
                              fontSize: 13),
                          placeholder: 'Chercher un utilisateur',
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
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: users.length,
                            itemBuilder: (context, index) {
                              User user = users[index];
                              return MakeCardUser(user);
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                )));
  }

  Widget MakeCardUser(User user) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => UserInfo(user: user)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [MyAppBoxShadow.boxShadowSecond],
            borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
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
              SizedBox(width: 10),
              Container(width: 1, height: 20, color: Colors.deepOrange),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "${user.firstName} ${user.lastName}".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
                Text(
                user.role == Role.SENDER ? "Expéditeur" : "Livreur",
                  style: TextStyle(
                      color: Colors.black45,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
              ]),
            ],
          ),
          Container(
              width: 30,
              height: 30,
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(15),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]),
              child: Icon(
                Icons.chevron_right,
                size: 23,
                color: Colors.white,
              ))
        ]),
      ),
    );
  }
}
