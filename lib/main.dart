import 'package:flutter/material.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/controllers/NotaController.dart';
import 'package:lg_movel/models/books.dart';
import 'package:lg_movel/models/statement.dart';
import 'package:lg_movel/pages/favs.dart';
import 'package:lg_movel/pages/notes.dart';
import 'package:lg_movel/pages/home.dart';
import 'package:lg_movel/pages/perfil.dart';
import 'package:lg_movel/pages/search.dart';
import 'package:lg_movel/pages/viewpdf.dart';
import 'package:lg_movel/services/StatementService.dart';
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
  String file;
  int selectMenuIndex = 0;
  // Pages
  var home = Home();
  var notas = Notas();
  var perfil = Perfil();

  // Widgets
  // * Forms
  var novaNotaForm = NovaNota();

  // App Icon
  bool visibleButton = false;
  int lastpage = 0;
  int optionPage = 0;

  // Functions
  Widget appIcoButton() {
    Widget button;
    switch (optionPage) {
      case 5:
        button = FlatButton.icon(
            onPressed: () {
              alterPage(lastpage);
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
    setState(() {
      switch (value) {
        case 0:
          _page = home;
          optionPage = 0;
          nameBar = 'LG School Mobile';
          visibleButton = false;
          selectMenuIndex = 0;
          break;
        case 1:
          _page = notas;
          optionPage = 1;
          lastpage = 1;
          nameBar = 'Anotações';
          visibleButton = true;
          selectMenuIndex = 0;
          break;
        case 2:
          _page = Buscar(openPdf: openPdfViewer);
          optionPage = 0;
          nameBar = 'E-books';
          visibleButton = false;
          selectMenuIndex = 0;
          break;
        case 3:
          _page = Favoritos(openPdf: openPdfViewer);
          optionPage = 0;
          nameBar = 'Favoritos';
          visibleButton = false;
          selectMenuIndex = 0;
          break;
        case 4:
          _page = perfil;
          optionPage = 0;
          nameBar = 'Meu Perfil';
          visibleButton = false;
          selectMenuIndex = 0;
          break;
        case 6:
          _page = novaNotaForm;
          optionPage = 5;
          lastpage = 1;
          nameBar = 'Adicionar nova nota';
          visibleButton = false;
          selectMenuIndex = 0;
          break;
        case 5:
          _page = ViewPdf(
            namefile: file,
          );
          optionPage = 5;
          lastpage = 2;
          visibleButton = false;
          break;
        default:
          _page = home;
          lastpage = 0;
          nameBar = 'Home';
          visibleButton = false;
      }
    });
  }

  void openPdfViewer(String nameFile) async {
    EbookController ebookController = Provider.of<EbookController>(context, listen: false);
    Book ebook = ebookController.getByFileName(nameFile);
    nameBar = ebook.titulo;
    file = nameFile;
    selectMenuIndex = 2;
    alterPage(5);
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
          customSelectedindex: selectMenuIndex,
          setCustomIndex: (selectMenuIndex != 0),
        ));
  }
}
