import 'package:flutter/material.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/controllers/NotaController.dart';
import 'package:lg_movel/pages/favs.dart';
import 'package:lg_movel/pages/notes.dart';
import 'package:lg_movel/pages/home.dart';
import 'package:lg_movel/pages/perfil.dart';
import 'package:lg_movel/pages/search.dart';
import 'package:lg_movel/pages/viewpdf.dart';
import 'package:lg_movel/widgets/forms/NovaNota.dart';
import 'package:lg_movel/widgets/layout/appbar.dart';
import 'package:lg_movel/widgets/layout/menu.dart';
import 'package:provider/provider.dart';

void main() => runApp(MultiProvider(
        providers: [
          ChangeNotifierProvider<NotaController>.value(value: NotaController()),
          ChangeNotifierProvider<EbookController>.value(value: EbookController())
        ],
        child: MaterialApp(
            title: "LG Mobile School",
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primaryColor: Colors.white,
            ),
            home: MainPage())));

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  // Globals
  Widget _page = Home();
  String nameBar = 'Home';

  // Pages
  var home = Home();
  var notas = Notas();
  var buscar = Buscar();
  var favoritos = Favoritos();
  var perfil = Perfil();
  var viwerpdf = ViewPdf();

  // Widgets
  // * Forms
  var novaNotaForm = NovaNota();

  // App Icon
  bool visibleButton = false;
  int lastpgage = 0;

  // Functions
  Widget appIcoButton() {
    Widget button;
    switch (lastpgage) {
      case 5:
        button = FlatButton.icon(
            onPressed: () {
              alterPage(1);
            },
            icon: Icon(Icons.first_page),
            label: Text("Voltar"));
        break;
      case 0:
        button = IconButton(
            icon: Icon(
              Icons.help,
              color: Colors.blue,
            ),
            onPressed: () {
              print("Abrir pop-up Ajuda.");
            });
        break;
      case 1:
        button = FlatButton.icon(
            onPressed: () {
              alterPage(6);
            },
            icon: Icon(Icons.add),
            label: Text("Adicionar nota"));
        break;
      default:
    }
    return button;
  }

  void alterPage(int value) {
    print(value);
    setState(() {
      switch (value) {
        case 0:
          _page = home;
          lastpgage = 0;
          nameBar = 'LG School Mobile';
          visibleButton = false;
          break;
        case 1:
          _page = notas;
          lastpgage = 1;
          nameBar = 'Anotações';
          visibleButton = true;
          break;
        case 2:
          _page = buscar;
          lastpgage = 0;
          nameBar = 'E-books';
          visibleButton = false;
          break;
        case 3:
          _page = favoritos;
          lastpgage = 0;
          nameBar = 'Favoritos';
          visibleButton = false;
          break;
        case 4:
          _page = perfil;
          lastpgage = 0;
          nameBar = 'Meu Perfil';
          visibleButton = false;
          break;
        case 6:
          _page = novaNotaForm;
          lastpgage = 5;
          nameBar = 'Adicionar nova nota';
          visibleButton = false;
          break;
        case 5:
          _page = viwerpdf;
          lastpgage = 0;
          nameBar = 'PDF';
          visibleButton = false;
          break;
        default:
          _page = home;
          lastpgage = 0;
          nameBar = 'Home';
          visibleButton = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomPadding: false,
        appBar: AppBar(
          backgroundColor: Colors.white,
          title: CustomAppBar(
            nameBar: nameBar,
          ),
          actions: <Widget>[appIcoButton()],
        ),
        body: Container(
          child: _page,
        ),
        bottomNavigationBar: Menu(
          func: alterPage,
        ));
  }
}
