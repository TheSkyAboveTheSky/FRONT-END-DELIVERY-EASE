import 'dart:io';

import 'package:animate_do/animate_do.dart';
import 'package:deliver_ease/Pages/Login/LoginPage.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class RegisterForm extends StatefulWidget {
  const RegisterForm({Key? key}) : super(key: key);

  @override
  State<RegisterForm> createState() => _RegisterFormState();
}

class _RegisterFormState extends State<RegisterForm> {
  // Image picker
  final ImagePicker _picker = ImagePicker();

  XFile? _imageFile;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: MyAppColors.backgroundColor,
        body: ListView(
         children: [
           Column(
             children: [
               const SizedBox(height: 20),
               FadeInUp(child: Column(children : [
                 GestureDetector(
                   onTap: () async {
                     _imageFile = await _picker.pickImage(source: ImageSource.gallery);
                     setState(() {});
                   },
                   child: Center(
                     child:Stack(
                         children: [
                           Container(
                             height: 120,
                             width: 120,
                             padding: EdgeInsets.all(2),
                             decoration: BoxDecoration(
                               border: Border.all(color: Colors.deepOrange),
                               borderRadius: BorderRadius.circular(60),
                             ),
                             child: ClipRRect(
                               borderRadius: BorderRadius.circular(60),
                               child: _imageFile != null
                                   ? Image.file(
                                 File(_imageFile!.path),
                                 fit: BoxFit.cover,
                               )
                                   : Image.asset("assets/images/select_image.jpg"),
                             ),
                           ),
                           Positioned(
                               top: 80,
                               left: 80,
                               child: Container(
                                 width: 36,
                                 height: 36,
                                 padding: EdgeInsets.all(2),
                                 decoration: BoxDecoration(
                                     color: MyAppColors.backgroundColor,
                                     borderRadius: BorderRadius.circular(18),
                                     border: Border.all(
                                         color: MyAppColors.backgroundColor,
                                         width: 2)),
                                 child: Container(
                                     width: 36,
                                     height: 36,
                                     padding: EdgeInsets.all(2),
                                     decoration: BoxDecoration(
                                         color: Colors.deepOrange,
                                         borderRadius: BorderRadius.circular(14),
                                         border: Border.all(
                                             color: Colors.deepOrange,
                                             width: 2)),
                                     child:Image.asset("assets/images/icon_flash.png")
                                 ),
                               )
                           )
                         ]
                     ),
                   ),
                 ),
                 const SizedBox(height: 20),
                 Text(
                   "Choisir une photo de profile".toUpperCase(),
                   style: TextStyle(color: Colors.black54, fontWeight: FontWeight.w700, fontFamily: "Cairo"),
                 ),
               ]),),
               FadeInUp(child: Column(children : [
                 const SizedBox(height: 10),
                 Container(
                   width: MediaQuery.of(context).size.width*1/3,
                   height: 1,
                   color: Colors.deepOrange,
                 ),
                 const SizedBox(height: 40,),
                 Container(
                   width: double.infinity,
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                         child: Row(
                           children: [
                             Container(
                               width: 20,
                               height:20,
                               child: Image(image: AssetImage("assets/images/nom_icon.png")),
                             ),
                             const SizedBox(width: 5,),
                             Text("Nom et Prenom".toUpperCase() , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                           ],
                         ),
                       ),
                       const SizedBox(height: 10,),
                       CupertinoTextField(
                         style: TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                         placeholder: 'Votre nom complet',
                         placeholderStyle: TextStyle(color: Color.fromRGBO(
                             103, 103, 103, 0.7333333333333333) , fontSize: 13),
                         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                         decoration: BoxDecoration(
                           color: MyAppColors.whiteCardColor,
                           borderRadius: BorderRadius.circular(8),
                           boxShadow: [
                             MyAppBoxShadow.boxShadowSecond
                           ],
                         ),
                       ),
                       const SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                         child: Row(
                           children: [
                             Container(
                               width: 20,
                               height:20,
                               child: Image(image: AssetImage("assets/images/icon_gmail_3.png")),
                             ),
                             const SizedBox(width: 5,),
                             const Text("YOUR EMAIL" , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                           ],
                         ),
                       ),
                       const SizedBox(height: 10,),
                       CupertinoTextField(
                         style: TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                         placeholder: 'Ayoubseddiki132@gmail.com',
                         placeholderStyle: TextStyle(color: Color.fromRGBO(
                             103, 103, 103, 0.7333333333333333) , fontSize: 13),
                         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                         decoration: BoxDecoration(
                           color: MyAppColors.whiteCardColor,
                           borderRadius: BorderRadius.circular(8),
                           boxShadow: [
                             MyAppBoxShadow.boxShadowSecond
                           ],
                         ),
                       ),
                       const SizedBox(height: 10,),
                       Padding(
                         padding: const EdgeInsets.symmetric(horizontal: 5.0),
                         child: Row(
                           children: [
                             Container(
                               width: 20,
                               height:20,
                               child: Image(image: AssetImage("assets/images/icon_password.png")),
                             ),
                             const SizedBox(width: 5,),
                             const Text("YOUR PASSWORD" , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                           ],
                         ),
                       ),
                       const SizedBox(height: 10,),
                       CupertinoTextField(
                         style: TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                         placeholder: '*******',
                         placeholderStyle: TextStyle(color: Color.fromRGBO(
                             103, 103, 103, 0.7333333333333333) , fontSize: 13),
                         padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                         decoration: BoxDecoration(
                           color: MyAppColors.whiteCardColor,
                           borderRadius: BorderRadius.circular(8),
                           boxShadow: [
                             MyAppBoxShadow.boxShadowSecond
                           ],
                         ),
                       ),
                     ],
                   ),
                 ),
                 const SizedBox(height: 20,),
                 Container(
                   padding: EdgeInsets.symmetric(horizontal: 10),
                   width: double.infinity,
                   child :   MaterialButton(
                     onPressed: (){},
                     height: 60,
                     color: Colors.deepOrange,
                     child: Text("Register".toUpperCase(), style: TextStyle(color: Colors.white, fontSize: 13.0,fontWeight: FontWeight.bold, fontFamily: "Cairo"),),
                     padding: EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                     shape: RoundedRectangleBorder(
                       borderRadius: BorderRadius.circular(10.0),
                     ),
                   ),
                 ),
               ]),),
               FadeInUp(child: Column(children:[
                 Row(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Text(
                       "Vous avez déjà un compte ?", style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Cairo"),
                     ),
                     TextButton(
                       onPressed: () {
                         Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => LoginPage()),
                         );
                       },
                       child: Text(
                         "Cliquez ici",
                         style: TextStyle(
                             color: Colors.deepOrange,
                             decoration: TextDecoration.underline, fontWeight: FontWeight.w500,fontFamily: "Cairo"
                         ),
                       ),
                     ),
                   ],),
                 Image.asset("assets/images/livraison_rapide.png", width: 40,)
               ])),
             ],
           ),
         ],
        ),
      ),
    );
  }

  // Fonction d'envoi de la photo (à implémenter selon votre logique)
  void _uploadPhoto() {
    
  }
}
