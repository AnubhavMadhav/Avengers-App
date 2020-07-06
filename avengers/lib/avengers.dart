class AvengersHub {
  List<Avengers> avengers;

  AvengersHub({this.avengers});

  AvengersHub.fromJson(Map<String, dynamic> json) {
    if (json['avengers'] != null) {
      avengers = new List<Avengers>();
      json['avengers'].forEach((v) {
        avengers.add(new Avengers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.avengers != null) {
      data['avengers'] = this.avengers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Avengers {
  int id;
  String num;
  String name;
  String img;
  String height;
  String weight;
  List<String> strength;
  List<String> weaknesses;

  Avengers(
      {this.id,
        this.num,
        this.name,
        this.img,
        this.height,
        this.weight,
        this.strength,
        this.weaknesses});

  Avengers.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    num = json['num'];
    name = json['name'];
    img = json['img'];
    height = json['height'];
    weight = json['weight'];
    strength = json['strength'].cast<String>();
    weaknesses = json['weaknesses'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['num'] = this.num;
    data['name'] = this.name;
    data['img'] = this.img;
    data['height'] = this.height;
    data['weight'] = this.weight;
    data['strength'] = this.strength;
    data['weaknesses'] = this.weaknesses;
    return data;
  }
}