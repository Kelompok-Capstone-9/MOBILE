import 'dart:convert';
<<<<<<< Updated upstream
=======

class ArtikelData {
  final String image;
  final String title;
>>>>>>> Stashed changes

class NewsLetter {
  String? category;
  String? judulArtikel;
  String? descArtikel;
  String? imageUrl;
  String? id;

  NewsLetter({
    this.category,
    this.judulArtikel,
    this.descArtikel,
    this.imageUrl,
    this.id,
  });

  factory NewsLetter.fromRawJson(String str) =>
      NewsLetter.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory NewsLetter.fromJson(Map<String, dynamic> json) => NewsLetter(
        id: json["id"],
        category: json["category"],
        judulArtikel: json["judul_artikel"],
        descArtikel: json["desc_artikel"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "category": category,
        "judul_artikel": judulArtikel,
        "desc_artikel": descArtikel,
        "image_url": imageUrl,
      };
}

<<<<<<< Updated upstream

=======
class Artikel {
  String? judulArtikel;
  String? descArtikel;
  String? imageUrl;
  String? id;

  Artikel({
    this.judulArtikel,
    this.descArtikel,
    this.imageUrl,
    this.id,
  });

  factory Artikel.fromRawJson(String str) => Artikel.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Artikel.fromJson(Map<String, dynamic> json) => Artikel(
        id: json["id"],
        judulArtikel: json["judul_artikel"],
        descArtikel: json["desc_artikel"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul_artikel": judulArtikel,
        "desc_artikel": descArtikel,
        "image_url": imageUrl
      };
}
>>>>>>> Stashed changes

// List<ArtikelData> artikelData = [
//   ArtikelData(
//     image: 'assets/images/mobile.jpeg',
//     title: 'MOBILE',
//   ),
//   ArtikelData(
//     image: 'assets/images/Nurtrition.png',
//     title: 'NUTRITION',
//   ),
//   ArtikelData(
//     image: 'assets/images/Athletis.png',
//     title: 'ATHLESTIS',
//   ),
//   ArtikelData(
//     image: 'assets/images/Foods.png',
//     title: 'NUTRITION',
//   ),
//   ArtikelData(
//     image: 'assets/images/GettingStarted.png',
//     title: 'GETTING STARTED',
//   ),
//   ArtikelData(
//     image: 'assets/images/Fruits.png',
//     title: 'NUTRITION',
//   ),
// ];
