import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(10.0),
            child: Center(
              child: Text(
                "Estatísticas",
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontFamily: 'Schyler',
                    fontWeight: FontWeight.w800),
              ),
            )),
        Card(
            margin: EdgeInsets.only(top: 10, left: 60, bottom: 10, right: 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Total de leituras",
                      style: TextStyle(
                          fontFamily: 'Schyler', fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "28",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 43,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "E-books",
                      style: TextStyle(
                          fontFamily: 'Schyler', fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            )),
        Card(
            margin: EdgeInsets.only(top: 10, left: 60, bottom: 10, right: 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Posição no Ranking de Leitura",
                      style: TextStyle(
                          fontFamily: 'Schyler', fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "18 º",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 43,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Entre os melhores leitores",
                      style: TextStyle(
                          fontFamily: 'Schyler', fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            )),
        Card(
            margin: EdgeInsets.only(top: 10, left: 60, bottom: 10, right: 60),
            child: Column(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Taxa de aproveitamento",
                      style: TextStyle(
                          fontFamily: 'Schyler', fontWeight: FontWeight.w800),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "45%",
                      style: TextStyle(
                          color: Colors.teal,
                          fontSize: 43,
                          fontFamily: 'Schyler',
                          fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(
                      "Baixo aproveitamento",
                      style: TextStyle(
                          fontFamily: 'Schyler', fontWeight: FontWeight.w800),
                    ),
                  ),
                )
              ],
            ))
      ],
    );
  }
}
