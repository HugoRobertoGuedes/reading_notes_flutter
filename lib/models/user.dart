class User {
  String nome;
  String email;
  String senha;

  User({this.nome, this.email, this.senha});

  User.fromJson(Map<String, dynamic> json) {
    nome = json['nome'];
    email = json['email'];
    senha = json['senha'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['nome'] = this.nome;
    data['email'] = this.email;
    data['senha'] = this.senha;
    return data;
  }
}