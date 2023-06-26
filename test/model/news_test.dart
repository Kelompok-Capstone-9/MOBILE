import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/model/news_letter.dart';

void main() {
  group('NewsLetter', () {
    final json = {
      "id": "1",
      "category": "Technology",
      "judul_artikel": "Sample Article",
      "desc_artikel": "This is a sample article",
      "image_url": "https://example.com/image.jpg",
    };

    test('Test fromJson() return to NewsLetter Object', () {
      final newsLetter = NewsLetter.fromJson(json);

      expect(newsLetter.id, '1');
      expect(newsLetter.category, 'Technology');
      expect(newsLetter.judulArtikel, 'Sample Article');
      expect(newsLetter.descArtikel, 'This is a sample article');
      expect(newsLetter.imageUrl, 'https://example.com/image.jpg');
    });

    test('Test toJson() return to JSON Map', () {
      final newsLetter = NewsLetter(
        id: '1',
        category: 'Technology',
        judulArtikel: 'Sample Article',
        descArtikel: 'This is a sample article',
        imageUrl: 'https://example.com/image.jpg',
      );

      final result = newsLetter.toJson();

      expect(result['id'], '1');
      expect(result['category'], 'Technology');
      expect(result['judul_artikel'], 'Sample Article');
      expect(result['desc_artikel'], 'This is a sample article');
      expect(result['image_url'], 'https://example.com/image.jpg');
    });
  });
}
