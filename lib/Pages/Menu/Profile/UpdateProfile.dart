import 'dart:io';
import 'dart:ui';
import 'package:deliver_ease/Models/Enums/role.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Profile/Profile.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:deliver_ease/Services/user_service.dart';
import 'package:deliver_ease/Models/user_model.dart';

class UpdateProfile extends StatefulWidget {
  const UpdateProfile({Key? key}) : super(key: key);

  @override
  State<UpdateProfile> createState() => _UpdateProfileState();
}

class _UpdateProfileState extends State<UpdateProfile>
    with SingleTickerProviderStateMixin {
  var user = User();
  late TabController _tabController = TabController(length: 2, vsync: this);
  final ImagePicker _picker = ImagePicker();
  bool isApiCallProcess = false;
  String phoneNumber = "0600000000";
  var screenWidth;
  XFile? _imageFile;

  @override
  void initState() {
    super.initState();
    _checkAuthentication();
    setUserInfos();
    _tabController = TabController(length: 2, vsync: this);
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (!isAuthenticated) {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => LoginPage()),
      );
    }
  }

  Future<void> setUserInfos() async {
    User? user = await UserService.getUserInfos();
    if(user?.role == Role.SENDER)
    {
      setState(() {
        phoneNumber = "0660119273";
      });
    }else if (user?.role == Role.DELIVERY_PERSON)
    {
      setState(() {
        phoneNumber = "0660119273";
      });
    }
    setState(() {
      this.user = user!;
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

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
        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.deepOrange,
          unselectedLabelColor: Colors.black,
          labelColor: Colors.deepOrange,
          tabs: [
            Tab(text: 'Mise à jour de la photo'),
            Tab(text: 'Mes informations'),
          ],
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          Container(
            alignment: Alignment.center,
            child: updatePhoto(),
          ),
          Container(
              alignment: Alignment.center,
              child: Container(
                  width: screenWidth * 0.8, child: updateInformations())),
        ],
      ),
    );
  }

  Widget updatePhoto() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      GestureDetector(
        onTap: () async {
          _imageFile = await _picker.pickImage(source: ImageSource.gallery);
          setState(() {});
        },
        child: Center(
          child: Stack(children: [
            Container(
              height: 120,
              width: 120,
              padding: EdgeInsets.all(2),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.deepOrange),
                borderRadius: BorderRadius.circular(60),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(60),
                child: _imageFile != null
                    ? Image.file(
                        File(_imageFile!.path),
                        fit: BoxFit.cover,
                      )
                    : Image.asset("assets/images/select_image.jpg"),
              ),
            ),
            Positioned(
                top: 80,
                left: 80,
                child: Container(
                  width: 36,
                  height: 36,
                  padding: EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      color: MyAppColors.backgroundColor,
                      borderRadius: BorderRadius.circular(18),
                      border: Border.all(
                          color: MyAppColors.backgroundColor, width: 2)),
                  child: Container(
                      width: 36,
                      height: 36,
                      padding: EdgeInsets.all(2),
                      decoration: BoxDecoration(
                          color: Colors.deepOrange,
                          borderRadius: BorderRadius.circular(14),
                          border:
                              Border.all(color: Colors.deepOrange, width: 2)),
                      child: Image.asset("assets/images/icon_flash.png")),
                ))
          ]),
        ),
      ),
      const SizedBox(
        height: 50,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {},
          height: 60,
          color: Colors.deepOrange,
          child: Text(
            "Update".toUpperCase(),
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
    ]);
  }

  Widget updateInformations() {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage("assets/images/nom_icon.png")),
            ),
            Text(
              "Nom".toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: MyAppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  fontSize: 12),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 5,
      ),
      CupertinoTextField(
        style:
            TextStyle(color: Colors.black, fontFamily: "Nunito", fontSize: 13),
        placeholder: '${user.lastName}',
        placeholderStyle: TextStyle(
            color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
            fontSize: 13),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
        ),
        onChanged: (value) {
          user.lastName = value;
        },
      ),
      const SizedBox(
        height: 10,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage("assets/images/nom_icon.png")),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Prenom".toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: MyAppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  fontSize: 12),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      CupertinoTextField(
        style:
            TextStyle(color: Colors.black, fontFamily: "Nunito", fontSize: 13),
        placeholder: '${user.firstName}',
        placeholderStyle: TextStyle(
            color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
            fontSize: 13),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
        ),
        onChanged: (value) {
          user.firstName = value;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child:
                  Image(image: AssetImage("assets/images/icon_telephone.png")),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              "Numéro de Télephone".toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: MyAppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  fontSize: 12),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 20,
      ),
      CupertinoTextField(
        style:
            TextStyle(color: Colors.black, fontFamily: "Nunito", fontSize: 13),
        placeholder: '${phoneNumber}',
        placeholderStyle: TextStyle(
            color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
            fontSize: 13),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
        ),
        onChanged: (value) {
          user.phoneNumber = value;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage("assets/images/icon_gmail_3.png")),
            ),
            const SizedBox(
              width: 5,
            ),
            const Text(
              "Votre EMAIL",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: MyAppColors.blackColor,
                  fontWeight: FontWeight.bold,
                  fontFamily: "Cairo",
                  fontSize: 12),
            ),
          ],
        ),
      ),
      const SizedBox(
        height: 10,
      ),
      CupertinoTextField(
        style:
            TextStyle(color: Colors.black, fontFamily: "Nunito", fontSize: 13),
        placeholder: '${user.email}',
        placeholderStyle: TextStyle(
            color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
            fontSize: 13),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
        decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
        ),
        onChanged: (value) {
          user.email = value;
        },
      ),
      const SizedBox(
        height: 20,
      ),
      Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        width: double.infinity,
        child: MaterialButton(
          onPressed: () {
            setState(() {
              isApiCallProcess = true;
            });

            UserService.updateUser(user).then((response) {
              setState(() {
                isApiCallProcess = false;
              });

              if (response != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()),
                );
              }
              setState(() {
                isApiCallProcess = false;
              });
            });
          },
          height: 60,
          color: Colors.deepOrange,
          child: Text(
            "update".toUpperCase(),
            style: TextStyle(
                color: MyAppColors.backgroundColor,
                fontSize: 16.0,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo"),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
        ),
      ),
    ]);
  }
}
