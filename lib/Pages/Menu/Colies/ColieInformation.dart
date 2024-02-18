import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class ColieInformation extends StatefulWidget {
  final Colie colie;

  ColieInformation({required this.colie});
  @override
  State<ColieInformation> createState() => _ColieInformationState();
}

class _ColieInformationState extends State<ColieInformation> {
  var popUpIsShowing = false;
  var width, height;
  double rating = 0;
  final _avisController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        drawer: NavigationDrawerWidget(),
        body: Builder(
          builder: (context) => Stack(children: [
            SafeArea(
              child: Padding(
                padding: EdgeInsets.all(10),
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      makeHeader(),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/icon_flash.png",
                                ),
                                width: 30,
                              ),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                "Informations".toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Cairo",
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          GestureDetector(
                            onTap: () {
                              setState(() {
                                popUpIsShowing = !popUpIsShowing;
                              });
                            },
                            child: Container(
                              padding: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.black,
                                  borderRadius: BorderRadius.circular(10)),
                              child: Row(children: [
                                Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 14,
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  "Saisir un avis".toUpperCase(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Cairo",
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold),
                                )
                              ]),
                            ),
                          )
                        ],
                      ),
                      SizedBox(height: 10),
                      Container(
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(10)),
                        child: IntrinsicWidth(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                    "assets/images/livraison_rapide.png"),
                                width: 35,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "Colie - ${widget.colie.identifier!.toUpperCase()}",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Montserrat",
                                    fontWeight: FontWeight.bold),
                              )
                            ],
                          ),
                        ),
                      ),
                      Column(children: [
                        SizedBox(height: 10),
                        buildInformationSection(),
                        buildInformationLivreur(),
                        buildInformationsStatus(),
                      ]),
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
                  width: width,
                  height: height,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(194, 0, 0, 0),
                  ),
                  child: renderPopUp(controller: _avisController),
                ),
              ),
            )
          ]),
        ));
  }

  Widget makeHeader() {
    return Column(
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
                  child: Image.asset("assets/images/image_avatar.jpg"),
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
        SizedBox(height: 20),
      ],
    );
  }

  Widget buildInformationSection() {
    return Column(children: [
      Row(children: [
        Container(
          width: 20,
          color: Colors.deepOrange,
          height: 1,
        ),
        SizedBox(width: 5),
        Image(
          image: AssetImage("assets/images/icon_addresse_destination.png"),
          width: 22,
        ),
        SizedBox(width: 10),
        Text("Informations".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Cairo",
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.deepOrange,
            height: 1,
          ),
        ),
      ]),
      SizedBox(
        height: 10,
      ),
      Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    child: Text(
                      widget.colie.shippingAddress!.city!.toString().toUpperCase(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    // ou Expanded
                    child: Text(
                      widget.colie.destinationAddress!.city!.toString().toUpperCase(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                      child: Text(
                    widget.colie.description!.toUpperCase(),
                    style: TextStyle(
                      color: Colors.black,
                      fontFamily: "Montserrat",
                      fontSize: 11,
                      fontWeight: FontWeight.w600,
                    ),
                    textAlign: TextAlign.justify,
                  )),
                ],
              ),
            ],
          ))
    ]);
  }

  Widget buildInformationLivreur() {
    return Column(children: [
      Row(children: [
        Container(
          width: 20,
          color: Colors.deepOrange,
          height: 1,
        ),
        SizedBox(width: 5),
        Image(
          image: AssetImage("assets/images/livreur.png"),
          width: 22,
        ),
        SizedBox(width: 10),
        Text("Livreur".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Cairo",
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.deepOrange,
            height: 1,
          ),
        ),
      ]),
      SizedBox(
        height: 10,
      ),
      Padding(
        padding: EdgeInsets.all(10),
        child: Row(children: [
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
              child: Image.asset("assets/images/image_avatar.jpg"),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          /*
          Column(children: [
            Text(colie.livreurData.nom + " " + colie.livreurData.prenom,
                style: TextStyle(
                    color: Colors.black,
                    fontFamily: "Montserrat",
                    fontWeight: FontWeight.bold)),
            SizedBox(
              height: 15,
            ),
          ],),
          */
        ]),
      )
    ]);
  }

  Widget buildInformationsStatus() {
    return Column(children: [
      Row(children: [
        Container(
          width: 20,
          color: Colors.deepOrange,
          height: 1,
        ),
        SizedBox(width: 5),
        Image(
          image: AssetImage("assets/images/icon_statut.png"),
          width: 22,
        ),
        SizedBox(width: 10),
        Text("Status".toUpperCase(),
            style: TextStyle(
                color: Colors.black,
                fontFamily: "Cairo",
                fontSize: 12,
                fontWeight: FontWeight.bold)),
        SizedBox(width: 5),
        Expanded(
          child: Container(
            width: double.infinity,
            color: Colors.deepOrange,
            height: 1,
          ),
        ),
      ]),
      Padding(
          padding: EdgeInsets.all(10),
          child: Column(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 5,
                    height: 5,
                    margin: EdgeInsets.only(top: 5),
                    decoration: BoxDecoration(
                      color: Colors.deepOrange,
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Flexible(
                    // ou Expanded
                    child: Text(
                      widget.colie.status.toString().toUpperCase(),
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 11,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ))
    ]);
  }

  Widget renderPopUp({required TextEditingController controller}) {
    final double popupWidth = width * 0.8;
    final double popupHeight = height * 0.5;

    void sendReview() {
      print("Avis envoyé :" + controller.text);
      print("Note : $rating");
    }

    return Center(
      child: Container(
        width: popupWidth,
        height: popupHeight,
        decoration: BoxDecoration(
          color: Color.fromARGB(194, 0, 0, 0),
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
              // Header Section
              buildHeader(),

              // Body Section
              Expanded(
                child: buildBody(controller: controller),
              ),

              // Footer Section
              buildFooter(sendReview),
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

  Widget buildBody({required TextEditingController controller}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Text Fields
        buildTextField(
            imagePath: "assets/images/icon_description.png",
            labelText: "Avis",
            placeholder: "Votre Avis Ici .",
            controller: controller),
        SizedBox(height: 20),
        // Rating Bar
        buildRatingBar(),
      ],
    );
  }

  Widget buildFooter(Function() onClick) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(bottom: 10),
      child: MaterialButton(
        onPressed: onClick,
        height: 55,
        color: Colors.deepOrange,
        child: Text(
          "Envoyer".toUpperCase(),
          style: TextStyle(
              color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.bold),
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }

  Widget buildHeaderIcon() {
    return Container(
      width: 25,
      height: 25,
      child: Image(image: AssetImage("assets/images/icon_rating.png")),
    );
  }

  Widget buildHeaderText() {
    return Text(
      "Saisir un avis".toUpperCase(),
      style: TextStyle(
        color: Colors.black,
        fontFamily: "Montserrat",
        fontSize: 12,
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

  Widget buildTextField(
      {required String imagePath,
      required String labelText,
      required String placeholder,
      required TextEditingController controller}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [
            Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage(imagePath)),
            ),
            SizedBox(width: 5),
            Text(
              labelText.toUpperCase(),
              textAlign: TextAlign.left,
              style: TextStyle(
                color: MyAppColors.blackColor,
                fontWeight: FontWeight.bold,
                fontFamily: "Cairo",
                fontSize: 12,
              ),
            ),
          ]),
          SizedBox(height: 10),
          CupertinoTextField(
            controller: controller,
            style: TextStyle(
                color: Colors.black, fontFamily: "Nunito", fontSize: 13),
            placeholder: placeholder,
            placeholderStyle: TextStyle(
                color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
                fontSize: 13),
            padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: MyAppColors.whiteCardColor,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [MyAppBoxShadow.boxShadowSecond],
            ),
          ),
        ],
      ),
    );
  }

  Widget buildRatingBar() {
    return RatingBar.builder(
      initialRating: rating,
      minRating: 1,
      direction: Axis.horizontal,
      allowHalfRating: true,
      itemCount: 5,
      itemSize: 20,
      itemBuilder: (context, _) => Icon(
        Icons.star,
        color: Colors.amber,
        size: 12,
      ),
      onRatingUpdate: (value) {
        setState(() {
          rating = value;
        });
      },
    );
  }
}
