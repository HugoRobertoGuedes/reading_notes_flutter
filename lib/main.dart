import 'package:flutter/material.dart';
import 'package:lg_movel/pages/favs.dart';
import 'package:lg_movel/pages/notes.dart';
import 'package:lg_movel/pages/home.dart';
import 'package:lg_movel/pages/perfil.dart';
import 'package:lg_movel/pages/search.dart';
import 'package:lg_movel/widgets/appbar.dart';
import 'package:lg_movel/widgets/menu.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() => runApp(MaterialApp(
    title: "LG Mobile School",
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      primaryColor: Colors.white,
    ),
    home: Example()));

class Example extends StatefulWidget {
  @override
  _ExampleState createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
  Widget _page = Home();
  String nameBar = 'Home';

  void alterPage(int value) {
    print(value);
    setState(() {
      switch (value) {
        case 0:
          _page = Home();
          nameBar = 'LG School Mobile';
          break;
        case 1:
          _page = Notas();
          nameBar = 'Anotações';
          break;
        case 2:
          _page = Buscar();
          nameBar = 'E-books';
          break;
        case 3:
          _page = Favoritos();
          nameBar = 'Favoritos';
          break;
        case 4:
          _page = Perfil();
          nameBar = 'Meu Perfil';
          break;
        default:
          _page = Home();
          nameBar = 'Home';
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomAppBar(
            nameBar: nameBar,
          ),
        ),
        body: Container(
          child: _page,
        ),
        bottomNavigationBar: Menu(
          func: alterPage,
        ));
  }
}
