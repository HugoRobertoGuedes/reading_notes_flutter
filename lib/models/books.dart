class Book {
  String titulo;
  String escritor;

  Book({this.titulo, this.escritor});

  Book.fromJson(Map<String, dynamic> json) {
    titulo = json['titulo'];
    escritor = json['escritor'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['titulo'] = this.titulo;
    data['escritor'] = this.escritor;
    return data;
  }
}