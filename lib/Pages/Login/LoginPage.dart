import 'package:animate_do/animate_do.dart';
import 'package:deliver_ease/Pages/Register/RegisterPage.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class LoginPage extends StatefulWidget {
  const LoginPage({super.key});


  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  @override
  Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: MyAppColors.backgroundColor ,
        body: SafeArea(
          child: ListView(
            children: [
              FadeInUp(child:Column(children: [
                const SizedBox(height: 50,),
                Center(
                    child: Column(children: [
                      Image.asset('assets/images/logo2.png',width: 150,),
                      const SizedBox(height: 10,),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("DELIVER " , style: TextStyle(fontFamily: 'Cairo',fontWeight: FontWeight.w700 , fontSize: 23),),
                          Text("EASE" , style: TextStyle(color: Colors.deepOrange,fontWeight: FontWeight.w700 , fontSize: 23 , fontFamily:"Cairo" ),)
                        ],),
                      const SizedBox(height: 10,),
                      Image.asset('assets/images/itineraire.png',width: 30,),
                    ],)  // Remplacez par votre image de connexion
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 30.0),
                  child: Row(children: [
                    Container(
                      width: 10, // Set the width of the container
                      height: 10, // Set the height of the container
                      decoration: BoxDecoration(
                        color: Colors.deepOrange, // Set the background color of the container
                        borderRadius: BorderRadius.circular(50), // Set the border radius to 50% of the width/height
                      ),
                    ),
                    Expanded(
                      child: Container(
                        width: double.infinity,
                        height: 1,
                        decoration: const BoxDecoration(
                            color: MyAppColors.orangeLight
                        ),
                      ),
                    ),
                    Container(
                      width: 10, // Set the width of the container
                      height: 10, // Set the height of the container
                      decoration: BoxDecoration(
                        color: Colors.deepOrange, // Set the background color of the container
                        borderRadius: BorderRadius.circular(50), // Set the border radius to 50% of the width/height
                      ),
                    ),
                  ],),
                ),
                const SizedBox(height: 20,),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
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
                              child:
                              const Image(image: AssetImage("assets/images/icon_gmail_3.png")),
                            ),
                            const SizedBox(width: 5,),
                            const Text("ADRESS EMAIL" , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      CupertinoTextField(
                        style: const TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                        placeholder: 'Ayoubseddiki132@gmail.com',
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
                      const SizedBox(height: 10,),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 5.0),
                        child: Row(
                          children: [
                            Container(
                              width: 20,
                              height:20,
                              child: const Image(image: AssetImage("assets/images/icon_password.png")),
                            ),
                            const SizedBox(width: 5,),
                            const Text("MOT DE PASSE" , textAlign: TextAlign.left , style: TextStyle(color: MyAppColors.blackColor , fontWeight: FontWeight.bold , fontFamily: "Cairo" , fontSize: 12),),
                          ],
                        ),
                      ),
                      const SizedBox(height: 10,),
                      CupertinoTextField(
                        style: const TextStyle(color: Colors.black , fontFamily: "Nunito" , fontSize: 13),
                        placeholder: '*******',
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
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  width: double.infinity,
                  child :   MaterialButton(
                    onPressed: (){},
                    height: 60,
                    color: Colors.deepOrange,
                    child: const Text("Login", style: TextStyle(color: Colors.white, fontSize: 16.0),),
                    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Vous n'avez encore creer un compte ?", style: TextStyle(fontWeight: FontWeight.w500,fontFamily: "Cairo"),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => RegisterPage()),
                        );
                      },
                      child: const Text(
                        "Cliquez ici",
                        style: TextStyle(
                            color: Colors.deepOrange,
                            decoration: TextDecoration.underline, fontWeight: FontWeight.w500,fontFamily: "Cairo"
                        ),
                      ),
                    ),
                  ],),
                Image.asset("assets/images/livraison_rapide.png", width: 40,)
              ],), )
            ]
          ),
        ),
      );
  }

}