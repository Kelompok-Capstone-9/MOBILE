import 'dart:convert';

import 'dart:convert';

class NewsLetter {
  String? judulArtikel;
  String? descArtikel;
  String? imageUrl;
  String? id;

  NewsLetter({
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
        judulArtikel: json["judul_artikel"],
        descArtikel: json["desc_artikel"],
        imageUrl: json["image_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "judul_artikel": judulArtikel,
        "desc_artikel": descArtikel,
        "image_url": imageUrl,
      };
}



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
