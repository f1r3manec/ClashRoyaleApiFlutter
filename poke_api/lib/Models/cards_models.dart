import 'dart:convert';

CardsList? cardsListFromJson(String str) =>
    CardsList.fromJson(json.decode(str));

String cardsListToJson(CardsList? data) => json.encode(data!.toJson());

class CardsList {
  CardsList({
    this.items,
  });

  List<Item?>? items;

  factory CardsList.fromJson(Map<String, dynamic> json) => CardsList(
        items: json["items"] == null
            ? []
            : List<Item?>.from(json["items"]!.map((x) => Item.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "items": items == null
            ? []
            : List<dynamic>.from(items!.map((x) => x!.toJson())),
      };
}

class Item {
  Item({
    this.name,
    this.id,
    this.maxLevel,
    this.iconUrls,
    this.favorito = false,
  });

  String? name;
  int? id;
  int? maxLevel;
  IconUrls? iconUrls;
  bool favorito;
  factory Item.fromJson(Map<String, dynamic> json) => Item(
      name: json["name"],
      id: json["id"],
      maxLevel: json["maxLevel"],
      iconUrls: IconUrls.fromJson(json["iconUrls"]),
      favorito: false);

  Map<String, dynamic> toJson() => {
        "name": name,
        "id": id,
        "maxLevel": maxLevel,
        "iconUrls": iconUrls!.toJson(),
      };

  void setFavorito(bool estadoFavorito) {
    favorito = estadoFavorito;
  }
}

class IconUrls {
  IconUrls({
    this.medium,
  });

  String? medium;

  factory IconUrls.fromJson(Map<String, dynamic> json) => IconUrls(
        medium: json["medium"],
      );

  Map<String, dynamic> toJson() => {
        "medium": medium,
      };
}
