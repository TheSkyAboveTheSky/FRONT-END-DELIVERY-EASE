import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Pages/Menu/Colies/ColieInformation.dart';
import 'package:deliver_ease/Services/parcel_service.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class UsersColies extends StatefulWidget {
  final User user;
  UsersColies({super.key, required this.user});
  @override
  State<UsersColies> createState() => _UsersColiesState();
}

class _UsersColiesState extends State<UsersColies> {
  List<Colie> colies = [];
  var screenWidth;

  @override
  void initState() {
    super.initState();
    setColies();
  }

  void setColies() async {
    List<Colie>? colies = await ColieService.getUserColies(widget.user!.id!);
    setState(() {
      this.colies = colies ?? [];
    });
    print(this.colies);
  }

  @override
  Widget build(BuildContext context) {
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
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 25,
              ),
              Row(children: [
                Image(
                  image: AssetImage("assets/images/icon_flash.png"),
                  width: 25,
                ),
                SizedBox(
                  width: 5,
                ),
                Text("Les colies de l'utilisateur".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Cairo",
                        fontSize: 12)),
                SizedBox(
                  width: 5,
                ),
                Expanded(
                    child: Container(
                  color: Color.fromRGBO(236, 72, 14, 0.2980392156862745),
                  height: 1,
                ))
              ]),
              SizedBox(
                height: 10,
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                child: ListView.builder(
                  itemCount: colies.length,
                  itemBuilder: (context, index) {
                    Colie colie = colies[index];
                    return makeCardColie(colie);
                  },
                ),
              )
            ],
          ),
        ));
  }

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
              borderRadius: BorderRadius.circular(10)),
          child: Row(children: [
            Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                child: Image(
                  image: AssetImage("assets/images/logo2.png"),
                  width: 20,
                )),
            SizedBox(width: 10),
            Container(width: 1, height: 20, color: Colors.deepOrange),
            SizedBox(width: 10),
            Text(
              colie.identifier.toString().toUpperCase(),
              style: TextStyle(
                  color: Colors.black,
                  fontFamily: "Montserrat",
                  fontWeight: FontWeight.bold,
                  fontSize: 13),
            ),
          ]),
        ),
      ),
    );
  }
}
