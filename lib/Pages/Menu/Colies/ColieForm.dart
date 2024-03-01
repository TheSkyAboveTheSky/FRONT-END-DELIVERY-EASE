import 'package:animate_do/animate_do.dart';
import 'package:deliver_ease/Models/address_model.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Colies/Colies.dart';
import 'package:deliver_ease/Pages/Menu/Profile/Profile.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Widgets/navigation_drawer_menu.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:deliver_ease/Models/colie_model.dart';
import 'package:deliver_ease/Services/parcel_service.dart';

class ColieForm extends StatefulWidget {
  const ColieForm({Key? key}) : super(key: key);

  @override
  State<ColieForm> createState() => _ColieFormState();
}

class _ColieFormState extends State<ColieForm> {
  final _formKey = GlobalKey<FormState>();

  final _expeditionController = TextEditingController();
  final _destinationController = TextEditingController();
  final _descriptionController = TextEditingController();

    @override
  void initState() {
    super.initState();
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
          context, MaterialPageRoute(builder: (context) => Colies()));
    }
  }

  void _envoyer() {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Colie enregistré avec succès !')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      drawer: NavigationDrawerWidget(),
      body: Builder(
          builder: (context) => SafeArea(
                child: FadeInUp(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: ListView(
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
                                  child: Image.asset(
                                      "assets/images/image_avatar.jpg"),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 10),
                        Row(
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 20, vertical: 8),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(20),
                                      color: Colors.black,
                                      boxShadow: [
                                        MyAppBoxShadow.boxShadowSecond
                                      ]),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Icon(
                                        Icons.chevron_left,
                                        color: Colors.white,
                                      ),
                                      SizedBox(
                                        width: 2,
                                      ),
                                      Text(
                                        "BACK",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: "Cairo",
                                            fontWeight: FontWeight.bold),
                                      )
                                    ],
                                  )),
                            )
                          ],
                        ),
                        SizedBox(height: 20),
                        Container(
                          color: MyAppColors.orangeLight2,
                          height: 1,
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: [
                              _buildInputRow(
                                icon:
                                    'assets/images/icon_addresse_expedition.png',
                                label: 'Adresse d\'expédition',
                                controller: _expeditionController,
                              ),
                              const SizedBox(height: 10),
                              _buildInputRow(
                                icon:
                                    'assets/images/icon_addresse_destination.png',
                                label: 'Adresse de destination',
                                controller: _destinationController,
                              ),
                              const SizedBox(height: 10),
                              _buildInputRow(
                                icon: 'assets/images/icon_description.png',
                                label: 'Description',
                                controller: _descriptionController,
                              ),
                              const SizedBox(height: 10),
                              /*
                        _buildInputRow(
                          icon: 'assets/images/livraison_de_colis_dest.png',
                          label: 'Identifiant destinataire',
                          controller: _identifiantDestinataireController,
                        )
                        const SizedBox(height: 20),
                        */
                              Container(
                                width: double.infinity,
                                child: MaterialButton(
                                  onPressed: () async {
                                    if (_formKey.currentState!.validate()) {
                                      print('Informations valides :');
                                      print(
                                          'Expédition : ${_expeditionController.text}');
                                      print(
                                          'Destination : ${_destinationController.text}');
                                      print(
                                          'Description : ${_descriptionController.text}');
                                      await ColieService.addColie(Colie(
                                        shippingAddress: Address(
                                            city: _expeditionController.text),
                                        destinationAddress: Address(
                                            city: _destinationController.text),
                                        description:
                                            _descriptionController.text,
                                      ));

                                      //print('Identifiant destinataire : ${_identifiantDestinataireController.text}');
                                    }
                                  },
                                  height: 50,
                                  color: Colors.deepOrange,
                                  child: Text(
                                    "Save".toUpperCase(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 13.0,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "Cairo"),
                                  ),
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 50),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              )),
    );
  }
}

Widget _buildInputRow({
  required String icon,
  required String label,
  required TextEditingController controller,
}) {
  return Column(
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0.0),
        child: Row(
          children: [
            Container(
              width: 20,
              height: 20,
              child: Image(image: AssetImage(icon)),
            ),
            const SizedBox(
              width: 5,
            ),
            Text(
              label.toUpperCase(),
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
        controller: controller,
        style:
            TextStyle(color: Colors.black, fontFamily: "Nunito", fontSize: 13),
        placeholder: label,
        placeholderStyle: TextStyle(
            color: Color.fromRGBO(103, 103, 103, 0.7333333333333333),
            fontSize: 13),
        padding: EdgeInsets.symmetric(horizontal: 16, vertical: 20),
        decoration: BoxDecoration(
          color: MyAppColors.whiteCardColor,
          borderRadius: BorderRadius.circular(8),
          boxShadow: [MyAppBoxShadow.boxShadowSecond],
        ),
      ),
    ],
  );
}

class MyCustomButton extends StatelessWidget {
  final String buttonText;
  final Function()? onPressed;

  MyCustomButton({required this.buttonText, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: MaterialButton(
        onPressed: onPressed,
        height: 50,
        color: Colors.deepOrange,
        child: Text(
          buttonText.toUpperCase(),
          style: TextStyle(
            color: Colors.white,
            fontSize: 13.0,
            fontWeight: FontWeight.bold,
            fontFamily: "Cairo",
          ),
        ),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
      ),
    );
  }
}
