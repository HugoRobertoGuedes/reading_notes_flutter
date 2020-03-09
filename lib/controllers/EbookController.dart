import 'package:flutter/material.dart';
import 'package:lg_movel/models/books.dart';

class EbookController extends ChangeNotifier {
  List<Book> ebooks = [
    Book(escritor: 'Alan Bernades Rocha', titulo: 'Secret Gym'),
    Book(escritor: 'Juliana Ribeiro Santos', titulo: 'Mistery the Cristals'),
    Book(escritor: 'Tainah Comini Motta', titulo: 'I Love my Cats'),
    Book(escritor: 'Erica Ramos Lorena',titulo: 'Manager time on large projects'),
    Book(escritor: 'Marcelo Oliveira Leite',titulo: 'Trading on the stock exchange'),
    Book(escritor: 'Priscila Taynara', titulo: 'UX Design for Mobile Apps'),
  ];

  favoritar(Book book){
    book.favorite = !book.favorite;
    notifyListeners();
  }
}
