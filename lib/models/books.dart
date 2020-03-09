class Book {
  int id;
  String titulo;
  String escritor;
  bool favorite;
  String nameFile;

  Book({this.titulo, this.escritor, this.favorite = false, this.nameFile, this.id});

  Book.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    escritor = json['escritor'];
    favorite = json['favorite'];
    nameFile = json['namefile'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['escritor'] = this.escritor;
    data['favorite'] = this.favorite;
    data['namefile'] = this.nameFile;
    data['id'] = this.id;
    return data;
  }
}

class FavoriteBook {
  int id;
  int idBook;
  int idUser;

  FavoriteBook({this.id, this.idBook, this.idUser});

  FavoriteBook.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    idBook = json['id_book'];
    idUser = json['id_user'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['id_book'] = this.idBook;
    data['id_user'] = this.idUser;
    return data;
  }
}