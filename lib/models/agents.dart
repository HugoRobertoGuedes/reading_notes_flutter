class Agents {
  String name;
  String mail;

  Agents({this.name, this.mail});

  Agents.fromJson(Map<String, dynamic> json) {
    name = json['Name'];
    mail = json['Mail'];
  }

  Map<String,dynamic> toJson(){
    final Map<String,dynamic> data = new Map<String,dynamic>();
    data['Name'] = this.name;
    data['Mail'] = this.mail;
    return data;
  }
}
