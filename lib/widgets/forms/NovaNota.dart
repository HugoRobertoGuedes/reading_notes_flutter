import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:lg_movel/controllers/NotaController.dart';
import 'package:lg_movel/helpers/styles/Colors.dart';
import 'package:lg_movel/models/nota.dart';
import 'package:provider/provider.dart';

import 'TextFieldCustom.dart';

class NovaNota extends StatefulWidget {
  @override
  _NovaNotaState createState() => _NovaNotaState();
}

class _NovaNotaState extends State<NovaNota> {
  int limite = 340;

  // * Controllers
  TextEditingController _textEditingControllerTitulo =
      new TextEditingController();
  TextEditingController _textEditingControllerConteudo =
      new TextEditingController();

  // * Functions
  limparCampos() {
    print('Limpar campos');
    _textEditingControllerConteudo.clear();
    _textEditingControllerTitulo.clear();
  }

  novaNota() {
    if (_textEditingControllerTitulo.text.isEmpty ||
        _textEditingControllerConteudo.text.isEmpty) {
      print('Valores Nulos');
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Alerta',
              style: TextStyle(color: primary),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Por favor preencha todos os campos.'),
                  Text('Não pode ser registrador valores em brancos.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else if (_textEditingControllerConteudo.text.length > 340) {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Alerta',
              style: TextStyle(color: primary),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Limite de caracteres atingido.'),
                  Text(
                      'O conteúdo da sua nota não pode ultrapassar o limite de 340 caracteres.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    } else {
      print(_textEditingControllerConteudo.text);
      NotaController notaController =
          Provider.of<NotaController>(context, listen: false);
      Nota novaNota = new Nota(
          titulo: _textEditingControllerTitulo.text,
          conteudo: _textEditingControllerConteudo.text,
          dtCriacao: DateTime.now());
      notaController.adicionarNovaNota(novaNota);
      limparCampos();
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              'Sucesso',
              style: TextStyle(color: sucsess),
            ),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  Text('Ótimo.'),
                  Text(
                      'Sua nota foi registrada, para voltar clique em voltar no topo, ou apenas clique em Nota novamente na barra de menus.'),
                ],
              ),
            ),
            actions: <Widget>[
              FlatButton(
                child: Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Padding(
            padding: EdgeInsets.all(30),
            child: Center(
              child: Text(
                "Criado em: ${DateFormat("dd/MM/yyyy").format(DateTime.now())}",
                style: TextStyle(
                    fontFamily: 'Schyler', fontSize: 20, color: Colors.black87),
              ),
            )),
        FlatButton.icon(
            shape: RoundedRectangleBorder(
                borderRadius: new BorderRadius.circular(10.0),
                side: BorderSide(color: Colors.black87)),
            onPressed: () {
              limparCampos();
            },
            icon: Icon(Icons.clear),
            label: Text("Limpar.")),
        Padding(
            padding: EdgeInsets.only(top: 30),
            child: BeautyTextfield(
              controller: _textEditingControllerTitulo,
              width: double.maxFinite,
              height: 60,
              backgroundColor: Colors.black87,
              accentColor: Colors.white,
              duration: Duration(milliseconds: 300),
              inputType: TextInputType.text,
              prefixIcon: Icon(
                Icons.title,
                color: Colors.black,
              ),
              placeholder: "Titulo",
              onTap: () {
                print('Click');
              },
              onChanged: (text) {
                print(text);
              },
              onSubmitted: (data) {
                print(data.length);
              },
            )),
        Padding(
          padding: EdgeInsets.all(15),
          child: Text("Limite de caracters: ${limite}/340"),
        ),
        BeautyTextfield(
          controller: _textEditingControllerConteudo,
          width: double.maxFinite,
          height: 360,
          maxLength: 340,
          backgroundColor: Colors.black87,
          accentColor: Colors.white,
          duration: Duration(milliseconds: 300),
          inputType: TextInputType.text,
          prefixIcon: Icon(Icons.library_books),
          placeholder: "Conteudo",
          onTap: () {
            print('Click');
          },
          onChanged: (text) {
            if (text.length <= 340) {
              setState(() {
                limite = text.length;
              });
            }
          },
          onSubmitted: (data) {
            print(data.length);
          },
        ),
        Padding(
          padding: EdgeInsets.only(top: 30),
          child: FlatButton.icon(
              shape: RoundedRectangleBorder(
                  borderRadius: new BorderRadius.circular(10.0),
                  side: BorderSide(color: Colors.black87)),
              onPressed: () {
                novaNota();
              },
              icon: Icon(Icons.save),
              label: Text(
                "Salvar",
                style: TextStyle(fontSize: 20),
              )),
        )
      ],
    );
  }
}
