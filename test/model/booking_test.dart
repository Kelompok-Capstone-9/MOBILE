import 'package:flutter_test/flutter_test.dart';
import 'package:gofit_apps/model/booking.dart';

void main() {
  group('DataClass', () {
    test('Test DataClass Json return to Object', () {
      // Test data
      final jsonData = {
        'id': 1,
        'name': 'Test Class',
        'description': 'This is a test class',
        'class_type': 'Type A',
        'link': 'https://example.com',
        'started_at': '2022-01-01T00:00:00Z',
        'class_packages': [
          {
            'id': 1,
            'period': '30 days',
            'price': 50,
            'class_id': 1,
            'status': 'active',
            'metadata': {
              'created_at': '2022-01-01T00:00:00Z',
              'updated_at': '2022-01-01T00:00:00Z',
            },
          },
        ],
        'location': {
          'id': 1,
          'name': 'Test Location',
          'address': '123 Test St',
          'city': 'Test City',
          'latitude': '123.456',
          'longitude': '789.012',
          'distance': 10.5,
          'metadata': {
            'created_at': '2022-01-01T00:00:00Z',
            'updated_at': '2022-01-01T00:00:00Z',
          },
        },
        'metadata': {
          'created_at': '2022-01-01T00:00:00Z',
          'updated_at': '2022-01-01T00:00:00Z',
        },
        'is_waktu': 'yes',
        'priceRange': 100,
        'image_banner': 'https://example.com/banner.jpg',
      };

      // Convert JSON to DataClass object
      final dataClass = DataClass.fromJson(jsonData);

      // Perform assertions to verify the object properties
      expect(dataClass.id, 1);
      expect(dataClass.name, 'Test Class');
      expect(dataClass.description, 'This is a test class');
      expect(dataClass.classType, 'Type A');
      expect(dataClass.link, 'https://example.com');
      expect(dataClass.startedAt.toIso8601String(), '2022-01-01T00:00:00.000Z');
      expect(dataClass.classPackages.length, 1);
      expect(dataClass.location.id, 1);
      expect(dataClass.metadata.createdAt.toIso8601String(),
          '2022-01-01T00:00:00.000Z');
      expect(dataClass.isWaktu, 'yes');
      expect(dataClass.priceRange, 100);
      expect(dataClass.imageBanner, 'https://example.com/banner.jpg');
    });
  });

  // group('ClassPackages', () {
  //   test('Test parsing Json ClassPackage.fromJson()', () {
  //     // Test data
  //     final json = {
  //       "id": 1,
  //       "period": "2023-06-26",
  //       "price": 100000,
  //       "class_id": 2,
  //       "status": "true",
  //       "metadata": {
  //         "created_at": "2023-06-25T10:30:00Z",
  //         "updated_at": "2023-06-26T08:45:00Z"
  //       }
  //     };

  //     // Expected result
  //     final expectedPackage = ClassPackage(
  //       id: 1,
  //       period: "2023-06-26",
  //       price: 100000,
  //       classId: 2,
  //       status: "true",
  //       metadata: ClassPackageMetadata(
  //         createdAt: DateTime.parse("2023-06-25T10:30:00Z"),
  //         updatedAt: DateTime.parse("2023-06-26T08:45:00Z"),
  //       ),
  //     );

  //     // Test assertion
  //     expect(ClassPackage.fromJson(json), equals(expectedPackage));
  //   });
  // });

  group('Pagination', () {
    test('Test Pagination Json Data', () {
      final json = {
        "page": 1,
        "data_shown": 10,
        "total_data": 100,
      };

      final pagination = Pagination.fromJson(json);

      expect(pagination.page, 1);
      expect(pagination.dataShown, 10);
      expect(pagination.totalData, 100);
    });

    test('Test Pagination Object to Json', () {
      final pagination = Pagination(
        page: 2,
        dataShown: 20,
        totalData: 200,
      );

      final json = pagination.toJson();

      expect(json["page"], 2);
      expect(json["data_shown"], 20);
      expect(json["total_data"], 200);
    });
  });
}
