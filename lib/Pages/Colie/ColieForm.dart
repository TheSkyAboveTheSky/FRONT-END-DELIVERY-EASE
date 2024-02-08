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
      SnackBar(content: Text('Colie enregistré avec succès !')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Enregistrement d\'un colie')),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          children: [
            TextField(
              controller: _nomCtrl,
              decoration: InputDecoration(labelText: 'Nom du colie'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: _poidsCtrl,
              decoration: InputDecoration(labelText: 'Poids du colie'),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 10),
            TextField(
              controller: _destinationCtrl,
              decoration: InputDecoration(labelText: 'Destination du colie'),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _envoyer,
              child: Text('Envoyer'),
            ),
          ],
        ),
      ),
    );
  }
}
