class ShowWithCast {
  int id;
  String name;
  String status;
  String premiered;
  String ended;
  Rating rating;
  Image image;
  String summary;
  Embedded embedded;

  ShowWithCast(
      {this.id,
      this.name,
      this.status,
      this.premiered,
      this.ended,
      this.rating,
      this.image,
      this.summary,
      this.embedded});

  ShowWithCast.fromJson(Map<String, dynamic> json) {
    
   
      id = json['id'];
    name = json['name'];
    status = json['status'];
    premiered = json['premiered'];
    ended = json['ended'];
    rating =
        json['rating'] != null ? new Rating.fromJson(json['rating']) : null;
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    summary = json['summary'];
    embedded = json['_embedded'] != null
        ? new Embedded.fromJson(json['_embedded'])
        : null;
  
  }
}

class Rating {
  double average;

  Rating({this.average});

  Rating.fromJson(Map<String, dynamic> json) {
    average = (json['average'] is int) ? (json['average'] as int).toDouble(): json['average']  ;
  }

  
}

class Image {
  String medium;
  String original;

  Image({this.medium, this.original});

  Image.fromJson(Map<String, dynamic> json) {
    medium = json['medium'];
    original = json['original'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['medium'] = this.medium;
    data['original'] = this.original;
    return data;
  }
}

class Embedded {
  List<Cast> cast;

  Embedded({this.cast});

  Embedded.fromJson(Map<String, dynamic> json) {
    if (json['cast'] != null) {
      cast = [];
      json['cast'].forEach((v) {
        cast.add(new Cast.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.cast != null) {
      data['cast'] = this.cast.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Cast {
  Person person;
  Character character;
  

  Cast({this.person, this.character, });

  Cast.fromJson(Map<String, dynamic> json) {
    person =
        json['person'] != null ? new Person.fromJson(json['person']) : null;
    character = json['character'] != null
        ? new Character.fromJson(json['character'])
        : null;
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.person != null) {
      data['person'] = this.person.toJson();
    }
    if (this.character != null) {
      data['character'] = this.character.toJson();
    }
    
    return data;
  }
}

class Person {
  int id;
  String url;
  String name;
  String birthday;
 
  String gender;
  Image image;
  int updated;

  Person({
    this.id,
    this.url,
    this.name,
    this.birthday,
    this.gender,
    this.image,
    this.updated,
  });

  Person.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    birthday = json['birthday'];
    gender = json['gender'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
    updated = json['updated'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    data['birthday'] = this.birthday;
    data['gender'] = this.gender;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }
    data['updated'] = this.updated;

    return data;
  }
}

class Character {
  int id;
  String url;
  String name;
  Image image;

  Character({
    this.id,
    this.url,
    this.name,
    this.image,
  });

  Character.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    url = json['url'];
    name = json['name'];
    image = json['image'] != null ? new Image.fromJson(json['image']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['url'] = this.url;
    data['name'] = this.name;
    if (this.image != null) {
      data['image'] = this.image.toJson();
    }

    return data;
  }
}
