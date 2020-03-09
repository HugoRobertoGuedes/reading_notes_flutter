class Statement {
  Actor actor;
  Verb verb;
  Object object;

  Statement({this.actor, this.verb, this.object});

  Statement.fromJson(Map<String, dynamic> json) {
    actor = json['actor'] != null ? new Actor.fromJson(json['actor']) : null;
    verb = json['verb'] != null ? new Verb.fromJson(json['verb']) : null;
    object = json['object'] != null ? new Object.fromJson(json['object']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.actor != null) {
      data['actor'] = this.actor.toJson();
    }
    if (this.verb != null) {
      data['verb'] = this.verb.toJson();
    }
    if (this.object != null) {
      data['object'] = this.object.toJson();
    }
    return data;
  }
}

class Actor {
  String objectType;
  String name;
  String mbox;

  Actor({this.objectType, this.name, this.mbox});

  Actor.fromJson(Map<String, dynamic> json) {
    objectType = json['objectType'];
    name = json['name'];
    mbox = json['mbox'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectType'] = this.objectType;
    data['name'] = this.name;
    data['mbox'] = this.mbox;
    return data;
  }
}

class Verb {
  String id;
  Display display;

  Verb({this.id, this.display});

  Verb.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    display =
    json['display'] != null ? new Display.fromJson(json['display']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    if (this.display != null) {
      data['display'] = this.display.toJson();
    }
    return data;
  }
}

class Display {
  String ptBr;

  Display({this.ptBr});

  Display.fromJson(Map<String, dynamic> json) {
    ptBr = json['pt_br'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['pt_br'] = this.ptBr;
    return data;
  }
}

class Object {
  String objectType;
  String id;
  Definition definition;

  Object({this.objectType, this.id, this.definition});

  Object.fromJson(Map<String, dynamic> json) {
    objectType = json['objectType'];
    id = json['id'];
    definition = json['definition'] != null
        ? new Definition.fromJson(json['definition'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['objectType'] = this.objectType;
    data['id'] = this.id;
    if (this.definition != null) {
      data['definition'] = this.definition.toJson();
    }
    return data;
  }
}

class Definition {
  Display name;

  Definition({this.name});

  Definition.fromJson(Map<String, dynamic> json) {
    name = json['name'] != null ? new Display.fromJson(json['name']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.name != null) {
      data['name'] = this.name.toJson();
    }
    return data;
  }
}