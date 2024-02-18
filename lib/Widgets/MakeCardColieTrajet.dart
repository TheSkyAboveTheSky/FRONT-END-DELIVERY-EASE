import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Models/Enums/status.dart';
import 'package:deliver_ease/Pages/Menu/Profile/UserProfile.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MakeCardColieTrajet extends StatefulWidget {
  final Colie colieData;

  MakeCardColieTrajet({required this.colieData});

  @override
  _MakeCardColieState createState() => _MakeCardColieState();
}

class _MakeCardColieState extends State<MakeCardColieTrajet> {
  bool _isSwiping = false;
  double _dragPosition = 0.0;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 20),
        padding: EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [MyAppBoxShadow.boxShadowSecond]),
        child: Column(children: [
          Row(children: [
            Container(
                width: 40,
                height: 40,
                padding: EdgeInsets.all(5),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [MyAppBoxShadow.boxShadowSecond]),
                child: Image(
                  image: AssetImage("assets/images/logo2.png"),
                  width: 20,
                )),
            SizedBox(
              width: 10,
            ),
            TextButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => UserProfile()),
                  );
                },
                child: Row(
                  children: [
                    Text(
                      "Colie de ".toUpperCase(),
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                          fontSize: 11),
                    ),
                    Text(
                      ("${widget.colieData.identifier} + "
                              " +${widget.colieData.identifier}")
                          .toUpperCase(),
                      style: TextStyle(
                          color: Colors.deepOrange,
                          fontWeight: FontWeight.bold,
                          fontFamily: "Montserrat",
                          fontSize: 11),
                    ),
                  ],
                ))
          ]),
          SizedBox(
            height: 5,
          ),
          Container(
            width: double.infinity,
            height: 1,
            color: Colors.deepOrange,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            (widget.colieData.description ?? '').toUpperCase(),
            style: const TextStyle(
              color: Colors.black,
              fontFamily: "Montserrat",
              fontSize: 10,
              fontWeight: FontWeight.w600,
            ),
            textAlign: TextAlign.justify,
          ),
          SizedBox(
            height: 10,
          ),
          buildStatusSpecificWidget(widget.colieData.status!),
        ]));
  }

  Widget buildStatusSpecificWidget(Status status) {
    switch (status) {
      case Status.UNSELECTED:
        return Row(
          children: [
            makeButton(
                label: "Accepter",
                onPressed: () {
                  // Action lorsque le bouton Accepter est pressé
                }),
            SizedBox(width: 5),
            makeButton(
                label: "Refuser",
                onPressed: () {
                  // Action lorsque le bouton Refuser est pressé
                }),
          ],
        );
      case Status.ACCEPTED:
        return makeSwipeRight(status: Status.ACCEPTED);
      case Status.IN_TRANSIT:
        return makeSwipeRight(status: Status.IN_TRANSIT);
      default:
        return Container();
    }
  }

  Widget makeSwipeRight({required Status status}) {
    return GestureDetector(
      onHorizontalDragUpdate: (details) {
        _isSwiping = true;
        setState(() {
          _dragPosition = (details.globalPosition.dx - 50) /
              (MediaQuery.of(context).size.width - 100);
          _dragPosition = _dragPosition.clamp(0.0, 1.0);
        });
      },
      onHorizontalDragEnd: (details) {
        _isSwiping = false;
        if (_dragPosition >= 1.0) {
          _validate();
          Future.delayed(Duration(seconds: 1), () {
            setState(() {
              _dragPosition = 0.0;
            });
          });
        } else {
          setState(() {
            _dragPosition = 0.0;
          });
        }
      },
      child: Stack(
        children: [
          Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Color.fromRGBO(224, 224, 224, 0.8117647058823529),
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.deepOrange),
                boxShadow: [MyAppBoxShadow.boxShadowSecond],
              ),
              child: Center(
                  child: Text(
                      (status == Status.ACCEPTED
                              ? "Confirmer la reception  de colie"
                              : "Confirmer l'envoie de colie")
                          .toUpperCase(),
                      style: TextStyle(
                          color: Color.fromRGBO(1, 1, 1, 0.3803921568627451),
                          fontWeight: FontWeight.bold,
                          fontFamily: "Cairo")))),
          AnimatedPositioned(
            duration: Duration(milliseconds: 200),
            curve: Curves.easeInOut,
            left: _dragPosition * (MediaQuery.of(context).size.width - 100),
            top: 5,
            child: Container(
              height: 50,
              width: 70,
              decoration: BoxDecoration(
                  color: Color.fromRGBO(11, 11, 11, 1),
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [MyAppBoxShadow.boxShadowSecond]),
              child: Center(
                  child: Icon(
                Icons.arrow_right_alt,
                color: Colors.white,
              )),
            ),
          ),
        ],
      ),
    );
  }

  Widget makeButton({
    required String label,
    required VoidCallback onPressed,
  }) {
    return IntrinsicWidth(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            color: label == "Accepter" ? Colors.green : Colors.red,
          ),
          padding: EdgeInsets.all(10),
          child: Text(
            label.toUpperCase(),
            style: TextStyle(
              color: Colors.white,
              fontFamily: "Montserrat",
              fontWeight: FontWeight.bold,
              fontSize: 11,
            ),
          ),
        ),
      ),
    );
  }

  void _validate() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Validation"),
        content: Text("L'élément a été validé avec succès."),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("OK"),
          ),
        ],
      ),
    );
  }
}
