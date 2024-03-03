import 'package:deliver_ease/Models/address_model.dart';
import 'package:deliver_ease/Models/trajet_model.dart';
import 'package:deliver_ease/Services/trip_service.dart';
import 'package:deliver_ease/utils/MyAppBoxShadow.dart';
import 'package:deliver_ease/utils/MyAppColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AjouterTrajet extends StatefulWidget {
  const AjouterTrajet({Key? key}) : super(key: key);

  @override
  State<AjouterTrajet> createState() => _AjouterTrajetState();
}

class _AjouterTrajetState extends State<AjouterTrajet> {
  final _formKey = GlobalKey<FormState>();

  final _destinationController = TextEditingController();
  final _expeditionController = TextEditingController();
  final _dateDebutController = TextEditingController();
  final _dateFinController = TextEditingController();
  final _coutController = TextEditingController();
  final _descriptionController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    String? validateDateTime(String? value) {
      RegExp regExp = RegExp(r'^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$');
      if (value == null || value.isEmpty) {
        return 'Please enter a date and time';
      }
      if (!regExp.hasMatch(value)) {
        return 'Please enter a valid date and time in the format YYYY-MM-DD HH:MM';
      }
      return null;
    }

    DateTime? selectedDate1 = DateTime.now();
    DateTime? selectedDate2 = DateTime.now();

    Future<void> _selectDate(
        {required BuildContext context,
        required TextEditingController controller,
        required DateTime date}) async {
      final DateTime? pickedDate = await showDatePicker(
        context: context,
        initialDate: date ?? DateTime.now(),
        firstDate: DateTime(2023),
        lastDate: DateTime(2025),
      );
      if (pickedDate != null && pickedDate != date) {
        final TimeOfDay? pickedTime = await showTimePicker(
          context: context,
          initialTime: TimeOfDay.fromDateTime(date ?? DateTime.now()),
        );
        if (pickedTime != null) {
          setState(() {
            date = DateTime(
              pickedDate.year,
              pickedDate.month,
              pickedDate.day,
              pickedTime.hour,
              pickedTime.minute,
            );
            controller.text = DateFormat('yyyy-MM-dd – HH:mm').format(date!);
          });
        }
      }
    }

    Future<bool?> sendTrajet() async {
      if (_expeditionController.text != "" &&
          _destinationController.text != "" &&
          _coutController.text != "" &&
          _descriptionController.text != "" &&
          _dateDebutController.text != "" &&
          _dateFinController.text != "") {
        Trajet trajet = Trajet(
            departureAddress: Address(city: _expeditionController.text),
            arrivalAddress: Address(city: _destinationController.text),
            departureDate: selectedDate1 ?? DateTime.now(),
            arrivalDate: selectedDate2 ?? DateTime.now(),
            cost: double.parse(_coutController.text),
            description: _descriptionController.text);
        _expeditionController.text = "";
        _destinationController.text = "";
        _coutController.text = "";
        _descriptionController.text = "";
        _dateDebutController.text = "";
        _dateFinController.text = "";
        return await TrajetService.addTrajet(trajet);
      }
      return false;
    }

    return Scaffold(
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
          ),
        ),
        body: SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(children: [
              Container(
                height: 1,
                width: double.infinity,
                color: MyAppColors.orangeLight2,
              ),
              SizedBox(
                height: 20,
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 1,
                      width: double.infinity,
                      color: Colors.deepOrange,
                    ),
                  ),
                  Image(
                    image: AssetImage("assets/images/itineraire.png"),
                    width: 20,
                  ),
                  SizedBox(width: 5),
                  Text(
                    "Ajouter un trajet".toUpperCase(),
                    style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Montserrat",
                        fontSize: 11),
                  ),
                  SizedBox(width: 5),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: [
                    _buildInputRow(
                      icon: 'assets/images/icon_addresse_expedition.png',
                      label: 'Adresse d\'expédition',
                      controller: _expeditionController,
                    ),
                    const SizedBox(height: 10),
                    _buildInputRow(
                      icon: 'assets/images/icon_addresse_destination.png',
                      label: 'Adresse de destination',
                      controller: _destinationController,
                    ),
                    const SizedBox(height: 10),
                    _buildInputRow(
                        icon: 'assets/images/icon_euro.png',
                        label: 'Cout de trajet',
                        controller: _coutController,
                        inputType: TextInputType.number),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () => _selectDate(
                            context: context,
                            controller: _dateDebutController,
                            date: selectedDate1),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                              color: MyAppColors.whiteCardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                            ),
                            child: Row(children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/icon_start.png",
                                ),
                                width: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _dateDebutController.text.toString() != ""
                                    ? _dateDebutController.text.toString()
                                    : "Choisir date debut du trajet"
                                        .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]))),
                    const SizedBox(height: 20),
                    GestureDetector(
                        onTap: () => _selectDate(
                            context: context,
                            controller: _dateFinController,
                            date: selectedDate2),
                        child: Container(
                            padding: EdgeInsets.symmetric(
                                vertical: 20, horizontal: 10),
                            decoration: BoxDecoration(
                              color: MyAppColors.whiteCardColor,
                              borderRadius: BorderRadius.circular(8),
                              boxShadow: [MyAppBoxShadow.boxShadowSecond],
                            ),
                            child: Row(children: [
                              Image(
                                image: AssetImage(
                                  "assets/images/icon_start.png",
                                ),
                                width: 20,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                _dateFinController.text.toString() != ""
                                    ? _dateFinController.text.toString()
                                    : "Choisir date fin du trajet"
                                        .toUpperCase(),
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Montserrat",
                                    fontSize: 10,
                                    fontWeight: FontWeight.bold),
                              ),
                            ]))),
                    const SizedBox(height: 20),
                    _buildInputRow(
                      icon: 'assets/images/icon_description.png',
                      label: 'Description',
                      controller: _descriptionController,
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: double.infinity,
                      child: MaterialButton(
                        onPressed: () async {
                          await sendTrajet();
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
                        padding:
                            EdgeInsets.symmetric(vertical: 10, horizontal: 50),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ]),
          ),
        )));
  }

  Widget _buildInputRow({
    required String icon,
    required String label,
    required TextEditingController controller,
    TextInputType inputType = TextInputType.text,
    String? Function(String)? validator,
    String? hint,
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
          keyboardType: inputType,
          controller: controller,
          style: TextStyle(
              color: Colors.black, fontFamily: "Nunito", fontSize: 13),
          placeholder: hint ?? label,
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
}
