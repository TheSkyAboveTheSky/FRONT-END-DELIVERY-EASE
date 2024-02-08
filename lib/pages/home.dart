import 'package:flutter/material.dart';
import 'package:deliver_ease/pages/signin.dart';
import 'package:deliver_ease/pages/signup.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        elevation: 0,
        backgroundColor: Colors.grey.withOpacity(0.5),
      ),
      backgroundColor: Colors.grey.withOpacity(0.5),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.3,
              child:
                  const Image(image: AssetImage("../assets/images/logo.png")),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              child: const Column(
                children: [
                  Text(
                    "DELIVER ",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 255, 165, 0),
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "EASE",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                      color: Color.fromARGB(255, 10, 110, 192),
                    ),
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
            Column(
              children: [
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.white,
                      boxShadow: <BoxShadow>[
                        BoxShadow(
                          color: Colors.white.withOpacity(0.1),
                          blurRadius: 1,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SIGN IN',
                          style: TextStyle(
                            color: const Color.fromARGB(255, 255, 165, 0),
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.login,
                            color: const Color.fromARGB(255, 255, 165, 0))
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignUp()),
                    );
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: const Color.fromARGB(255, 255, 165, 0),
                      boxShadow: const <BoxShadow>[
                        BoxShadow(
                          color: const Color.fromARGB(255, 255, 165, 0),
                          blurRadius: 1,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                      vertical: 14,
                      horizontal: 16,
                    ),
                    width: MediaQuery.of(context).size.width * 0.8,
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'SIGN UP',
                          style: TextStyle(
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(
                          width: 10,
                        ),
                        Icon(Icons.person_add, color: Colors.white)
                      ],
                    ),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
