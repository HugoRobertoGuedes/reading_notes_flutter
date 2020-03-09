import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lg_movel/controllers/NotaController.dart';
import 'package:lg_movel/models/nota.dart';
import 'package:provider/provider.dart';
import 'package:slimy_card/slimy_card.dart';

class Notas extends StatefulWidget {
  @override
  NotasState createState() => NotasState();
}

class NotasState extends State<Notas> {
  _buildList(NotaController notaController) {
    return ListView.builder(
      itemCount: notaController.notas.length,
      itemBuilder: (ctx, index) {
        return _builditem(notaController.notas[index], notaController);
      },
    );
  }

  _builditem(Nota nota, NotaController notaController) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: SlimyCard(
        color: Colors.indigo,
        width: 350,
        topCardHeight: 150,
        bottomCardHeight: 310,
        borderRadius: 10,
        topCardWidget: Column(
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(top: 30),
              child: Text(
                nota.titulo,
                style: TextStyle(
                    fontFamily: 'Schyler', fontSize: 30, color: Colors.white),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text(
                "Criado em: ${DateFormat("dd/MM/yyyy").format(nota.dtCriacao)}",
                style: TextStyle(color: Colors.white24),
              ),
            )
          ],
        ),
        bottomCardWidget: Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(left: 25),
                  child: FlatButton.icon(
                      onPressed: () {
                        notaController.removerNota(nota);
                      },
                      icon: Icon(Icons.delete, color: Colors.white),
                      label: Text(
                        "Deletar",
                        style: TextStyle(
                            fontFamily: 'Schyler',
                            fontSize: 20,
                            color: Colors.white),
                      )),
                ),
                FlatButton.icon(
                    onPressed: () {
                      print("Modificar");
                    },
                    icon: Icon(
                      Icons.update,
                      color: Colors.white,
                    ),
                    label: Text(
                      "Modificar",
                      style: TextStyle(
                          fontFamily: 'Schyler',
                          fontSize: 20,
                          color: Colors.white),
                    ))
              ],
            ),
            new Divider(
              color: Colors.white,
            ),
            Text(
              nota.conteudo,
              style: TextStyle(
                  fontFamily: 'Schyler', fontSize: 20, color: Colors.white),
              textAlign: TextAlign.justify,
            ),
          ],
        ),
        slimeEnabled: false,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<NotaController>(
      builder: (ctx, notaController, widget) {
        return _buildList(notaController);
      },
    );
  }
}
