import 'package:deliver_ease/Models/user_model.dart';
import 'package:deliver_ease/Pages/Admin/Users.dart';
import 'package:deliver_ease/Pages/Menu/ChoisirDestination.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/Pages/Menu/Colies/Colies.dart';
import 'package:deliver_ease/Pages/Menu/Profile/AjoutTrajet.dart';
import 'package:deliver_ease/Pages/Menu/Profile/DemandeLivreur.dart';
import 'package:deliver_ease/Pages/Menu/Profile/Profile.dart';
import 'package:deliver_ease/Services/shared_service.dart';
import 'package:deliver_ease/Services/user_service.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/material.dart';

class NavigationDrawerWidget extends StatefulWidget {
  @override
  _NavigationDrawerWidgetState createState() => _NavigationDrawerWidgetState();
}

class _NavigationDrawerWidgetState extends State<NavigationDrawerWidget> {
  final padding = EdgeInsets.symmetric(horizontal: 20);
  var user = User();
  var isAdmin;
  var isSender;
  var isDeliveryPerson;

  @override
  void initState() {
    super.initState();
    getUserInfo();
    _checkRole();
  }

  _checkRole() async {
    isAdmin = await SharedService.isAdmin();
    isSender = await SharedService.isSender();
    isDeliveryPerson = await SharedService.isDelivery_PERSON();
  }

  void getUserInfo() async {
    User? userModel = await UserService.getUserInfos();
    if (userModel != null) {
      setState(() {
        user = userModel;
      });
    }
  }

  final imageUrl = "assets/images/image_avatar.jpg";

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Material(
        color: MyAppColors.backgroundColor,
        child: ListView(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 12, right: 30),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Text(
                    "DELIVER ",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Cairo",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "EASE",
                    style: TextStyle(
                        color: Colors.deepOrange,
                        fontFamily: "Cairo",
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            buildHeader(
              urlImage: imageUrl,
              name: "${user.firstName} ${user.lastName}".toUpperCase(),
              email: user.email.toString(),
              onClicked: () => Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => LoginPage())),
            ),
            Container(
              padding: padding,
              child: Column(
                children: [
                  const SizedBox(height: 24),
                  buildMenuItem(
                    text: 'Mon Profile',
                    icon: "assets/images/nom_icon.png",
                    onClicked: () => selectedItem(context, 0),
                  ),
                  const SizedBox(height: 16),
                  if (isSender)
                    buildMenuItem(
                      text: 'Mes Colies',
                      icon: "assets/images/logo2.png",
                      onClicked: () => selectedItem(context, 1),
                    ),
                  if (isSender) const SizedBox(height: 16),
                  if (isSender)
                    buildMenuItem(
                      text: 'Chercher Un Trajet',
                      icon: "assets/images/icon_search.png",
                      onClicked: () => selectedItem(context, 2),
                    ),
                  if (isSender) const SizedBox(height: 16),
                  if (isAdmin)
                    buildMenuItem(
                      text: 'Gérer Les Utilisateurs',
                      icon: "assets/images/users_icon.png",
                      onClicked: () => selectedItem(context, 3),
                    ),
                  if (isAdmin) const SizedBox(height: 16),
                  if (isDeliveryPerson)
                    buildMenuItem(
                      text: 'Gérer Mes Demandes',
                      icon: "assets/images/icon_req.png",
                      onClicked: () => selectedItem(context, 4),
                    ),
                  if (isDeliveryPerson) const SizedBox(height: 16),
                  if (isDeliveryPerson)
                    buildMenuItem(
                      text: 'Ajout Un Trajet',
                      icon: "assets/images/itineraire.png",
                      onClicked: () => selectedItem(context, 5),
                    ),
                  if (isDeliveryPerson) const SizedBox(height: 16),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildHeader({
    required String urlImage,
    required String name,
    required String email,
    required VoidCallback onClicked,
  }) =>
      InkWell(
        onTap: onClicked,
        child: Center(
          child: Container(
            padding: padding.add(EdgeInsets.symmetric(vertical: 30)),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage(urlImage.toString()),
                ),
                SizedBox(height: 20),
                Text(
                  name.toUpperCase(),
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                  ),
                ),
                const SizedBox(height: 4),
                Text(
                  email.toUpperCase(),
                  style: TextStyle(
                    fontSize: 11,
                    color: Colors.black54,
                    fontWeight: FontWeight.bold,
                    fontFamily: "Cairo",
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget buildMenuItem({
    required String text,
    required String icon,
    VoidCallback? onClicked,
  }) {
    final color = Colors.black;
    final hoverColor = Colors.black;

    return ListTile(
      leading: Image.asset(
        icon.toString(),
        width: 25,
      ),
      title: Text(text.toUpperCase(),
          style: TextStyle(
              color: Colors.black,
              fontFamily: "Cairo",
              fontWeight: FontWeight.bold,
              fontSize: 12)),
      hoverColor: hoverColor,
      onTap: onClicked,
    );
  }

  void selectedItem(BuildContext context, int index) {
    Navigator.of(context).pop();

    switch (index) {
      case 0:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Profile(),
        ));
        break;
      case 1:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Colies(),
        ));
        break;
      case 2:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => ChoisirDestination(),
        ));
        break;
      case 3:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => Users(),
        ));
        break;
      case 4:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => DemandeLivreur(),
        ));
        break;
      case 5:
        Navigator.of(context).push(MaterialPageRoute(
          builder: (context) => AjouterTrajet(),
        ));
        break;
    }
  }
}
