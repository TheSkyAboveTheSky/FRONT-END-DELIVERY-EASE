import 'package:deliver_ease/Models/avi_model.dart';
import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Services/reviews_service.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class UserReviews extends StatefulWidget {
  final User user;

  const UserReviews({super.key, required this.user});

  @override
  State<UserReviews> createState() => _UserReviewsState();
}

class _UserReviewsState extends State<UserReviews> {
  List<Avi> avis = [];
  var screenWidth;

  @override
  void initState() {
    super.initState();
    setAvis();
  }

  void setAvis() async {
    List<Avi>? avis = await ReviewService.getUserAvis(widget.user!.id!);
    setState(() {
      this.avis = avis ?? [];
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
        body: Column(children: [
          SizedBox(
            height: 10,
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
        ]));
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

}
