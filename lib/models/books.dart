class Book {
  String titulo;
  String escritor;
  bool favorite;

  Book({this.titulo, this.escritor, this.favorite = false});

  Book.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    escritor = json['escritor'];
    favorite = json['favorite'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['escritor'] = this.escritor;
    data['favorite'] = this.favorite;
    return data;
  }
}