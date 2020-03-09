import 'package:flutter/material.dart';
import 'package:lg_movel/controllers/EbookController.dart';
import 'package:lg_movel/models/books.dart';
import 'package:line_icons/line_icons.dart';
import 'package:provider/provider.dart';

class Ebooks extends StatefulWidget {
  var info = new Book();

  Ebooks({this.info});

  @override
  _EbooksState createState() => _EbooksState();
}

class _EbooksState extends State<Ebooks> {
  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          ListTile(
            leading: Icon(
              Icons.picture_as_pdf,
              color: Colors.purpleAccent[100],
            ),
            title: Text(
              widget.info.titulo,
              style:
                  TextStyle(fontFamily: 'Schyler', fontWeight: FontWeight.w900),
            ),
            subtitle: Text(widget.info.escritor),
          ),
          ButtonBar(
            children: <Widget>[
              FlatButton.icon(
                icon: Icon(
                  LineIcons.bookmark,
                ),
                label: const Text(
                  'Leitura',
                  style: TextStyle(color: Colors.purple),
                ),
                onPressed: () {/* ... */},
              ),
              FlatButton.icon(
                icon: widget.info.favorite
                    ? Icon(LineIcons.heart)
                    : Icon(LineIcons.heart_o),
                label: const Text(
                  'Favoritar',
                  style: TextStyle(
                    color: Colors.cyan,
                  ),
                ),
                onPressed: () {
                    EbookController ebookController = Provider.of<EbookController>(context, listen: false);
                    ebookController.favoritar(widget.info);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
