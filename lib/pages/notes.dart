import 'package:flutter/material.dart';

class Notas extends StatefulWidget {
  @override
  NotasState createState() => NotasState();
}

class NotasState extends State<Notas> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Card(
          child: TextFormField(
            keyboardType: TextInputType.text,
            style: TextStyle(
                color: Colors.black,
                fontSize: 24,
                fontFamily: 'Schyler',
                fontWeight: FontWeight.w800),
            decoration: InputDecoration(
                labelText: "Tomar nota",
                labelStyle: TextStyle(
                    color: Colors.black,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w800)),
          ),
        )
      ],
    );
  }
}
