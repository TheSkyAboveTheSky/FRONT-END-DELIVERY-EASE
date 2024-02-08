import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ColieForm extends StatefulWidget {
  const ColieForm({Key? key}) : super(key: key);

  @override
  State<ColieForm> createState() => _ColieFormState();
}

class _ColieFormState extends State<ColieForm> {
  // Contrôleurs de saisie
  final TextEditingController _nomCtrl = TextEditingController();
  final TextEditingController _poidsCtrl = TextEditingController();
  final TextEditingController _destinationCtrl = TextEditingController();

  // Envoi des données
  void _envoyer() {
    // Préparer les données à envoyer
    final Map<String, String> data = {
      'nom': _nomCtrl.text,
      'poids': _poidsCtrl.text,
      'destination': _destinationCtrl.text,
    };

    // Envoyer la requête vers le backend (implémentez votre logique)
    // ...

    // Afficher un message de confirmation
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Colie enregistré avec succès !')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MyAppColors.backgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Row(children: [
                Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: const [MyAppBoxShadow.boxShadowSecond]
                  ),
                  child: const Row( mainAxisAlignment : MainAxisAlignment.center , crossAxisAlignment:CrossAxisAlignment.center ,
                    children: [
                    Image(image: AssetImage("assets/images/icon_back_2.png"),width: 15,),
                    SizedBox(width: 4,),
                    Text("BACK" , style: TextStyle(color: Colors.black, fontFamily: "Cairo", fontWeight: FontWeight.bold ),)
                  ],)
                )
              ],),
              const SizedBox(height: 20),
              Container(
                color: MyAppColors.orangeLight2,
                height: 1,
              ),
              const SizedBox(height: 20,),
              Row(children: [
                const Image(image: AssetImage("assets/images/icon_flash.png"),width: 25,),
                Text("Merci de saisir les informations de la colie".toUpperCase(),
                  style: const TextStyle(color: Colors.black,fontWeight: FontWeight.bold, fontFamily: "Cairo",fontSize: 13),)
              ],),
              const SizedBox(height: 20,),

              // INPUTS  INSIDE CUPERTINO  AND LABELS INSIDE PADDING !
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height:20,
                      child: const Image(image: AssetImage("assets/images/icon_addresse_expedition.png")),
                    ),
                    const SizedBox(width: 5,),
                    Text("Address d'\expedition".toUpperCase() , textAlign: TextAlign.left , style: const TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              CupertinoTextField(
                style: const TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                placeholder: 'Address d expedition de la colie',
                placeholderStyle: const TextStyle(color: Color.fromRGBO(
                    103, 103, 103, 0.7333333333333333) , fontSize: 13),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: MyAppColors.whiteCardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    MyAppBoxShadow.boxShadowSecond
                  ],
                ),
              ),
              const SizedBox(height: 20,),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height:20,
                      child: const Image(image: AssetImage("assets/images/icon_addresse_destination.png")),
                    ),
                    const SizedBox(width: 5,),
                    Text("Address de destination".toUpperCase(), textAlign: TextAlign.left , style: const TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              CupertinoTextField(
                style: const TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                placeholder: 'Address d expedition de la colie',
                placeholderStyle: const TextStyle(color: Color.fromRGBO(
                    103, 103, 103, 0.7333333333333333) , fontSize: 13),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: MyAppColors.whiteCardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    MyAppBoxShadow.boxShadowSecond
                  ],
                ),
              ),
              const SizedBox(height: 20),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 5.0),
                child: Row(
                  children: [
                    Container(
                      width: 20,
                      height:20,
                      child: const Image(image: AssetImage("assets/images/icon_addresse_destination.png")),
                    ),
                    const SizedBox(width: 5,),
                    Text("Address de destination".toUpperCase(), textAlign: TextAlign.left , style: const TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              CupertinoTextField(
                style: const TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                placeholder: 'Address d expedition de la colie',
                placeholderStyle: const TextStyle(color: Color.fromRGBO(
                    103, 103, 103, 0.7333333333333333) , fontSize: 13),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 20),
                decoration: BoxDecoration(
                  color: MyAppColors.whiteCardColor,
                  borderRadius: BorderRadius.circular(8),
                  boxShadow: const [
                    MyAppBoxShadow.boxShadowSecond
                  ],
                ),
              ),
              ElevatedButton(
                onPressed: _envoyer,
                child: const Text('Envoyer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
