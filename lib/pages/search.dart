import 'package:flutter/material.dart';
import 'package:lg_movel/models/books.dart';
import 'package:lg_movel/widgets/Ebook.dart';

class Buscar extends StatefulWidget {
  List<Book> ebooks = new List<Book>();

  Future<void> loaderbooks() async {
    ebooks.add(Book(escritor: 'Alan Bernades Rocha', titulo: 'Secret Gym'));
    ebooks.add(Book(escritor: 'Juliana Ribeiro Santos', titulo: 'Mistery the Cristals'));
    ebooks.add(Book(escritor: 'Tainah Comini Motta', titulo: 'I Love my Cats'));
    ebooks.add(Book(escritor: 'Erica Ramos Lorena',titulo: 'Manager time on large projects'));
    ebooks.add(Book(escritor: 'Marcelo Oliveira Leite',titulo: 'Trading on the stock exchange'));
    ebooks.add(Book(escritor: 'Priscila Taynara', titulo: 'UX Design for Mobile Apps'));
  }

  Buscar() {
    loaderbooks();
  }
  @override
  _BuscarState createState() => _BuscarState();
}

class _BuscarState extends State<Buscar> {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemBuilder: (ctx, index) {
        final item = widget.ebooks[index];
        return Ebooks(
          info: item,
        );
      },
      itemCount: widget.ebooks.length,
    );
  }
}
