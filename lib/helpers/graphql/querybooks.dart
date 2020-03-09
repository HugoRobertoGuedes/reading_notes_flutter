class QuerysBooks {
  String all() {
    return """
    query {
      books {
        id
        titulo
        escritor
        favorito
        namefile
      }
    }
  """;
  }

  String insertFavoriteBook(int userId, int bookId) {
    return """ 
    mutation {
      insert_favorite_book(objects: {id_book: $bookId, id_user: $userId}) {
        affected_rows
      }
    }
    """;
  }

  String userFavoritesBooks(int userId) {
    return """
    query {
      favorite_book(where: {id_user: {_eq: $userId}}) {
        id
        id_book
        id_user
      }
    }
    """;
  }
}
