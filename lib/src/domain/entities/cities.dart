class Cities {
  String name;
  String image;
  CitiesClass cities;
  CitiesClass famousPlaces;
  int traveled;

  Cities({
    required this.name,
    required this.image,
    required this.cities,
    required this.famousPlaces,
    required this.traveled,
  });

  factory Cities.fromJson(Map<String, dynamic> json) => Cities(
        name: json["name"],
        image: json["image"],
        cities: CitiesClass.fromJson(json["cities"]),
        famousPlaces: CitiesClass.fromJson(json["famous_places"]),
        traveled: json["traveled"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "image": image,
        "cities": cities.toJson(),
        "famous_places": famousPlaces.toJson(),
        "traveled": traveled,
      };
}

class CitiesClass {
  int available;
  int completed;

  CitiesClass({
    required this.available,
    required this.completed,
  });

  factory CitiesClass.fromJson(Map<String, dynamic> json) => CitiesClass(
        available: json["available"],
        completed: json["completed"],
      );

  Map<String, dynamic> toJson() => {
        "available": available,
        "completed": completed,
      };
}
