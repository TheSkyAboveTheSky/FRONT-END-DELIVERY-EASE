import 'package:animate_do/animate_do.dart';
import 'package:deliver_ease/Pages/Register/Phone.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/material.dart';
import 'package:deliver_ease/Services/shared_service.dart';

class RegisterPage extends StatefulWidget {
  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  var title = """
  Pour vous inscrire, choisissez entre livreur ou client. Cliquez sur la carte correspondante en bas de la page.
""";
  @override
  void initState() {
    super.initState();
    _checkAuthentication();
  }

  Future<void> _checkAuthentication() async {
    bool isAuthenticated = await SharedService.isLoggedIn();
    if (isAuthenticated) {
      Navigator.pushReplacementNamed(context, '/menu');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: SafeArea(
        child: Container(
          child: Column(
            children: [
              Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  FadeInDown(
                      child: Image(
                          image:
                              AssetImage("assets/images/image_register.png"))),
                  SizedBox(
                    height: 20,
                  ),
                  Center(
                    child: Container(
                        width: MediaQuery.of(context).size.width * 2.5 / 3,
                        decoration: BoxDecoration(),
                        child: Column(
                          children: [
                            Text(
                              title.toUpperCase(),
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                  fontFamily: "Cairo"),
                            ),
                          ],
                        )),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 2 / 3,
                    height: 2,
                    decoration:
                        BoxDecoration(color: MyAppColors.whiteCardColor),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      FadeInLeft(
                          child: GestureDetector(
                        onTap: () => {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => PhoneForm()),
                          )
                        },
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  child:
                                      Image.asset("assets/images/livreur.png"),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Livreur".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )),
                      SizedBox(
                        width: 5,
                      ),
                      FadeInRight(
                        child: Container(
                          width: 150,
                          height: 150,
                          decoration: BoxDecoration(
                              color: Colors.deepOrange,
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                              borderRadius: BorderRadius.circular(5)),
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 50,
                                  child:
                                      Image.asset("assets/images/client.png"),
                                ),
                                SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  "Client".toUpperCase(),
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  SizedBox(
                    height: 40,
                  ),
                  Container(
                    child: Center(
                        child: Image.asset(
                      "assets/images/livraison_rapide.png",
                      width: 50,
                    )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
