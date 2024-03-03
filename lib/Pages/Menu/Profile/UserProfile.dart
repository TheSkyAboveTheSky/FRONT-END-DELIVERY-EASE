import 'package:deliver_ease/Models/avi_model.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Pages/Menu/Colies/ColieInformation.dart';
import 'package:deliver_ease/Services/parcel_service.dart';
import 'package:deliver_ease/Services/reviews_service.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserProfile extends StatefulWidget {
  final User user;
  const UserProfile({super.key, required this.user});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  var screenWidth;
  var popUpIsShowing = false;
  var width, height;
  List<Avi> avis = [];
  List<Colie> colies = [];
  var isSender = false;
  var isDeliveryPerson = false;
  String phoneNumber = "";

  @override
  void initState() {
    super.initState();
    _checkRoles();
  }

  void _checkRoles() async {
    bool sender = await SharedService.isSender();
    bool deliveryPerson = await SharedService.isDelivery_PERSON();

    setState(() {
      isSender = sender;
      isDeliveryPerson = deliveryPerson;
    });

    setAvis();
    setColies();
  }

  void setAvis() async {
    List<Avi>? avis;
    if (isDeliveryPerson) {
      avis = await ReviewService.getUserAvis(await SharedService.getId());
      phoneNumber = "0701020304";
    } else {
      avis = await ReviewService.getUserAvis(widget.user.id!);
      phoneNumber = "0660119273";
    }
    setState(() {
      this.avis = avis ?? [];
      this.phoneNumber = phoneNumber;
    });
  }

  void setColies() async {
    List<Colie>? colies;
    if (isDeliveryPerson) {
      colies = await ColieService.getUserColies(widget.user.id!);
    } else {
      colies = await ColieService.getUserColies(await SharedService.getId());
    }
    setState(() {
      this.colies = colies ?? [];
    });
  }

  @override
  Widget build(BuildContext context) {
    screenWidth = MediaQuery.of(context).size.width;
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    return Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        drawer: NavigationDrawerWidget(),
        body: Builder(
            builder: (context) => Stack(
                  children: [
                    SafeArea(
                      child: Column(children: [
                        SizedBox(
                          height: 10,
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
                                  height: 50,
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
                            Transform.translate(
                              offset: Offset(-2.0, 0.0),
                              child: GestureDetector(
                                onTap: () {},
                                child: Container(
                                  height: 70,
                                  width: 70,
                                  padding: EdgeInsets.all(2),
                                  decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Colors.deepOrange),
                                    borderRadius: BorderRadius.circular(40),
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(40),
                                    child: Image.asset(
                                        "assets/images/image_avatar.jpg"),
                                  ),
                                ),
                              ),
                            ),
                            Container(),
                          ],
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${widget.user.lastName} ${widget.user.firstName}"
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
                                "${phoneNumber}"),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        IntrinsicWidth(
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                popUpIsShowing = !popUpIsShowing;
                              });
                            },
                            child: Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    color: Colors.black,
                                    borderRadius: BorderRadius.circular(5),
                                    boxShadow: [
                                      MyAppBoxShadow.boxShadowSecond
                                    ]),
                                child: Row(children: [
                                  Image(
                                    image:
                                        AssetImage("assets/images/logo2.png"),
                                    width: 20,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Vous Avez ${colies.length} colies en commun"
                                        .toUpperCase(),
                                    style: TextStyle(
                                        color: MyAppColors.backgroundColor,
                                        fontSize: 9,
                                        fontFamily: "Montserrat",
                                        fontWeight: FontWeight.bold),
                                  )
                                ])),
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: avis.length,
                            itemBuilder: (context, index) {
                              Avi avi = avis[index];
                              return makeCardReview(avi);
                            },
                          ),
                        )
                      ]),
                    ),
                    AnimatedOpacity(
                      opacity: popUpIsShowing ? 1.0 : 0.0,
                      duration: const Duration(milliseconds: 500),
                      child: Visibility(
                        visible: popUpIsShowing,
                        child: SingleChildScrollView(
                          child: Container(
                            width: width,
                            height: height,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(194, 0, 0, 0),
                            ),
                            child: Expanded(
                              child: renderPopUp(),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                )));
  }

  Widget renderPopUp() {
    return Center(
      child: Container(
        width: width * 0.8,
        height: height * 0.5,
        decoration: BoxDecoration(
          color: Color.fromARGB(194, 0, 0, 0),
        ),
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            gradient: LinearGradient(
              colors: [
                Colors.white,
                Colors.white,
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Image(
                      image: AssetImage("assets/images/logo2.png"),
                      width: 25,
                    ),
                    SizedBox(width: 5),
                    Text(
                      "colies en communs".toUpperCase(),
                      style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Montserrat",
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    SizedBox(width: 5),
                    Expanded(
                      child: Container(
                        height: 1,
                        color: Colors.deepOrange,
                      ),
                    ),
                    GestureDetector(
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
                        child: Icon(
                          Icons.highlight_remove_outlined,
                          color: Colors.white,
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(height: 10),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: MyAppColors.backgroundColor,
                      boxShadow: [MyAppBoxShadow.boxShadowSecond],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Expanded(
                      child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.4,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: colies.length,
                          itemBuilder: (context, index) {
                            Colie colie = colies[index];
                            return makeCardColie(colie);
                          },
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
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

  Widget makeCardReview(Avi avi) {
    return Container(
        width: screenWidth * 0.9,
        padding: EdgeInsets.all(10),
        margin: EdgeInsets.only(top: 10, left: screenWidth * 0.05),
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(children: [
              Container(
                height: 50,
                width: 50,
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
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                Text(
                  "${avi.user?.lastName} ${avi.user?.firstName}".toUpperCase(),
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 11),
                ),
                Text(
                  DateFormat('dd-MM-yyyy HH:mm').format(avi.reviewDate!),
                  style: TextStyle(
                      color: Colors.black26,
                      fontWeight: FontWeight.bold,
                      fontFamily: "Montserrat",
                      fontSize: 11),
                )
              ]),
            ]),
            SizedBox(
              height: 10,
            ),
            Row(
              children: [
                for (int i = 0; i < avi.starRating!; i++)
                  Icon(Icons.star, color: Colors.amber),
                for (int i = avi.starRating! as int; i < 5; i++)
                  Icon(Icons.star_border, color: Colors.black45),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              avi.comment.toString().toUpperCase(),
              style: TextStyle(
                  fontFamily: "Montserrat",
                  fontSize: 11,
                  fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            )
          ],
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
