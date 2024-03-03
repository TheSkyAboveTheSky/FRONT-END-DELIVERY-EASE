import 'package:deliver_ease/Pages/Menu/Profile/ListColiesTrajet.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Services/trip_service.dart';
import 'package:intl/intl.dart';

class DemandeLivreur extends StatefulWidget {
  const DemandeLivreur({Key? key}) : super(key: key);

  @override
  State<DemandeLivreur> createState() => _DemandeLivreurState();
}

class _DemandeLivreurState extends State<DemandeLivreur> {
  List<Trajet> trajets = [];
  @override
  void initState() {
    super.initState();
    setTrajets();
  }

  void setTrajets() async {
    List<Trajet>? trajets = await TrajetService.getAllTrajet();
    setState(() {
      this.trajets = trajets ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
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
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(children: [
            Container(
              height: 1,
              width: double.infinity,
              color: MyAppColors.orangeLight2,
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              children: [
                Image(
                  image: AssetImage("assets/images/icon_flash.png"),
                  width: 20,
                ),
                SizedBox(width: 5),
                Text(
                  "List de vos trajets".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 11),
                ),
                SizedBox(width: 5),
                Expanded(
                  child: Container(
                    height: 1,
                    width: double.infinity,
                    color: Colors.deepOrange,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemCount: trajets.length,
                itemBuilder: (context, index) {
                  Trajet trajet = trajets[index];
                  return Column(
                    children: [
                      SizedBox(height: 10),
                      MakeCardTrajet(
                        trajet.departureAddress!.city,
                        trajet.arrivalAddress!.city,
                        DateFormat('dd-MM-yyyy HH:mm')
                            .format(trajet.departureDate!),
                        DateFormat('dd-MM-yyyy HH:mm')
                            .format(trajet.arrivalDate!),
                        trajet.id,
                      ),
                    ],
                  );
                },
              ),
            ),
          ]),
        )));
  }

  Widget MakeCardTrajet(villeExp, villeDest, dateDepart, dateArrive, id) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => ListColiesTrajet(trajetId: id)),
        );
      },
      child: Container(
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [MyAppBoxShadow.boxShadowSecond],
            borderRadius: BorderRadius.circular(10)),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          Row(
            children: [
              Container(
                  width: 40,
                  height: 40,
                  padding: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(20),
                      boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                  child: Image(
                    image: AssetImage("assets/images/itineraire.png"),
                    width: 20,
                  )),
              SizedBox(width: 10),
              Container(width: 1, height: 20, color: Colors.deepOrange),
              SizedBox(width: 10),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  (villeExp + " -> " + villeDest).toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontWeight: FontWeight.bold,
                      fontSize: 11),
                ),
                Text(
                  (dateDepart + " -> " + dateArrive).toUpperCase(),
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
