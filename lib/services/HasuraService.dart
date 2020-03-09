import 'dart:convert';

import 'package:lg_movel/helpers/graphql/querybooks.dart';
import 'package:lg_movel/models/books.dart';
import 'package:lg_movel/services/ClienteService.dart';

/* *
 * * Buscar Todos os lívros Cadastrado
 */
Future<List<Book>> getAllBooks() async {
  String query = QuerysBooks().all();
  List<Book> listAdd = new List<Book>();
  var response = await hasura(query);
  if (response.length > 0) {
    response["books"].forEach((item) => {
          listAdd.add(Book(
              id: item['id'],
              titulo: item['titulo'],
              escritor: item['escritor'],
              nameFile: item['namefile']))
        });
  }
  return listAdd;
}

Future<List<FavoriteBook>> getFavoritesUser(int userId) async {
  String query = QuerysBooks().userFavoritesBooks(userId);
  List<FavoriteBook> listAdd = new List<FavoriteBook>();
  var response = await hasura(query);
  if (response.length > 0) {
    response["favorite_book"].forEach((item) => {
      listAdd.add(FavoriteBook(id: item['id'], idBook: item['id_book'], idUser: item['id_user']))
    });
  }
  return listAdd;
}

/* *
 * * Setar Livro como favorito
 */
Future<bool> setFavoriteBook(int userId, int bookId) async {
  String query = QuerysBooks().insertFavoriteBook(userId, bookId);
  List<dynamic> response = await hasura(query);
  print(response);
  return true;
}
