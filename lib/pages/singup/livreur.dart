import 'package:flutter/material.dart';
import 'package:deliver_ease/pages/signin.dart';

class SignUpAsLivreur extends StatefulWidget {
  const SignUpAsLivreur({Key? key});

  @override
  _SignUpAsLivreurState createState() => _SignUpAsLivreurState();
}

class _SignUpAsLivreurState extends State<SignUpAsLivreur> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffe8ebed),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.fromLTRB(30, 30, 30, 70),
          alignment: Alignment.topCenter,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Form(
                child: Column(
                  children: [
                    Stack(
                      children: <Widget>[
                        Positioned(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(50),
                            child: Image.asset(
                              "../assets/images/livreur.png",
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 20),
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: const Color(0xffe1e2e3),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 5,
                            blurRadius: 7,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Nom", border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Prenom", border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Email", border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Adresse", border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Numero Telephone", border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Sexe", border: InputBorder.none),
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(
                                horizontal: 20, vertical: 5),
                            decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                            ),
                            child: TextFormField(
                              decoration: const InputDecoration(
                                  hintText: "Numero CIN", border: InputBorder.none),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 30),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        elevation: 13,
                        padding: const EdgeInsets.symmetric(
                            vertical: 15, horizontal: 55),
                        primary: const Color.fromARGB(255, 255, 165, 0),
                        shape: const RoundedRectangleBorder(
                            side: BorderSide(color: Colors.white70),
                            borderRadius: BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text(
                        "Sign Up",
                        style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                  const SizedBox(width: 5),
                  Expanded(
                    child: GestureDetector(
                      onTap: () {},
                      child: Container(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                          decoration: const BoxDecoration(
                              color: Color(0xfff5f8fd),
                              borderRadius: BorderRadius.all(Radius.circular(20)),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, 18.0),
                                    blurRadius: 15.0),
                                BoxShadow(
                                    color: Colors.black12,
                                    offset: Offset(0.0, -04.0),
                                    blurRadius: 10.0),
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              const Text(
                                "Sign Up With",
                                style: TextStyle(
                                    fontSize: 16,
                                    color: const Color.fromARGB(255, 255, 165, 0),
                                    fontWeight: FontWeight.w700),
                              ),
                              Image.asset(
                                "../assets/images/google.png",
                                height: 33,
                              )
                            ],
                          )),
                    ),
                  )
                ],
              ),
              const SizedBox(height: 25),
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text("Already have an account?"),
                const SizedBox(width: 10),
                GestureDetector(
                  onTap: () {
                    // Navigate to the sign-in screen
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => SignIn()),
                    );
                  },
                  child: const Text("Sign In",
                      style: TextStyle(
                          fontWeight: FontWeight.w900,
                          color: const Color.fromARGB(255, 255, 165, 0),
                          fontSize: 18)),
                )
              ]),
            ],
          ),
        ),
      ),
    );
  }
}
