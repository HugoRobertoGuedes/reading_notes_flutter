import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:lg_movel/models/books.dart';
import 'package:lg_movel/services/HasuraService.dart';

class EbookController extends ChangeNotifier {
  List<Book> ebooks = [];

  favoritar(Book book) {
    book.favorite = !book.favorite;
    setFavoriteBook(1, book.id);
    notifyListeners();
  }

  Book getByFileName(String name) {
    print(name);
    Book item = ebooks.firstWhere((a) => a.nameFile == name);
    return item;
  }

  Future<List<FavoriteBook>> favoritesBooks(int userId) async{
    List<FavoriteBook> list = await getFavoritesUser(userId);
    return list;
  }

  Future<bool> getBooksHasura() async {
    if (ebooks.length <= 0) {
      List<Book> listAttBook = new List<Book>();
      List<Book> list = await getAllBooks();
      List<FavoriteBook> favorites = await getFavoritesUser(1);
      for (var i = 0; i < favorites.length; i++) {
        Book addElement = list.firstWhere((a) => a.id == favorites[i].idBook);
        listAttBook.add(addElement);
        print(favorites[i].id);
      }
      list.replaceRange(0, listAttBook.length, listAttBook);
      ebooks.addAll(list);
      return true;
    } else {
      print('Já Carregado');
      return true;
    }
  }
}
