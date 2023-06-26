// To parse this JSON data, do
//
//     final bookingClass = bookingClassFromJson(jsonString);

import 'dart:convert';

class Ticket {
  Metadata? metadata;
  TransactionInfo? transactionInfo;
  BookingData? data;

  Ticket({this.metadata, this.transactionInfo, this.data});

  factory Ticket.fromJson(Map<String, dynamic> json) {
    return Ticket(
      metadata: Metadata.fromJson(json['metadata']),
      transactionInfo: TransactionInfo.fromJson(json['transaction_info']),
      data: BookingData.fromJson(json['data']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'metadata': metadata?.toJson(),
      'transaction_info': transactionInfo?.toJson(),
      'data': data?.toJson(),
    };
  }
}

class Metadata {
  int? statusCode;
  String? message;
  String? errorReason;

  Metadata({this.statusCode, this.message, this.errorReason});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      statusCode: json['status_code'],
      message: json['message'],
      errorReason: json['error_reason'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status_code': statusCode,
      'message': message,
      'error_reason': errorReason,
    };
  }
}

class TransactionInfo {
  String? transactionCode;
  String? message;
  String? transactionLink;

  TransactionInfo({this.transactionCode, this.message, this.transactionLink});

  factory TransactionInfo.fromJson(Map<String, dynamic> json) {
    return TransactionInfo(
      transactionCode: json['transaction_code'],
      message: json['message'],
      transactionLink: json['transaction_link'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'transaction_code': transactionCode,
      'message': message,
      'transaction_link': transactionLink,
    };
  }
}

class BookingData {
  int? id;
  User? user;
  ClassPackageBooking? classPackage;

  BookingData({this.id, this.user, this.classPackage});

  factory BookingData.fromJson(Map<String, dynamic> json) {
    return BookingData(
      id: json['id'],
      user: User.fromJson(json['user'] ?? {}),
      classPackage: ClassPackageBooking.fromJson(json['class_package'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user?.toJson(),
      'class_package': classPackage?.toJson(),
    };
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? password;
  String? gender;
  int? height;
  int? goalHeight;
  int? weight;
  int? goalWeight;
  String? trainingLevel;
  String? profilePicture;
  Metadata? metadata;

  User({
    this.id,
    this.name,
    this.email,
    this.password,
    this.gender,
    this.height,
    this.goalHeight,
    this.weight,
    this.goalWeight,
    this.trainingLevel,
    this.profilePicture,
    this.metadata,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      password: json['password'],
      gender: json['gender'],
      height: json['height'],
      goalHeight: json['goal_height'],
      weight: json['weight'],
      goalWeight: json['goal_weight'],
      trainingLevel: json['training_level'],
      profilePicture: json['profile_picture'],
      metadata: Metadata.fromJson(json['metadata'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'password': password,
      'gender': gender,
      'height': height,
      'goal_height': goalHeight,
      'weight': weight,
      'goal_weight': goalWeight,
      'training_level': trainingLevel,
      'profile_picture': profilePicture,
      'metadata': metadata?.toJson(),
    };
  }
}

class ClassPackageBooking {
  int? id;
  String? period;
  int? price;
  ClassInfo? classInfo;

  ClassPackageBooking({this.id, this.period, this.price, this.classInfo});

  factory ClassPackageBooking.fromJson(Map<String, dynamic> json) {
    return ClassPackageBooking(
      id: json['id'],
      period: json['period'],
      price: json['price'],
      classInfo: ClassInfo.fromJson(json['class'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'period': period,
      'price': price,
      'class': classInfo!.toJson(),
    };
  }
}

class ClassInfo {
  int? id;
  String? name;
  String? description;
  String? classType;
  String? link;
  String? startedAt;
  Location? location;

  ClassInfo({
    this.id,
    this.name,
    this.description,
    this.classType,
    this.link,
    this.startedAt,
    this.location,
  });

  factory ClassInfo.fromJson(Map<String, dynamic> json) {
    return ClassInfo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      classType: json['class_type'],
      link: json['link'],
      startedAt: json['started_at'],
      location: Location.fromJson(json['location'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'class_type': classType,
      'link': link,
      'started_at': startedAt,
      'location': location!.toJson(),
    };
  }
}

class Location {
  int? id;
  String? name;
  String? address;
  String? city;
  double? latitude;
  double? longitude;
  Metadata? metadata;

  Location({
    this.id,
    this.name,
    this.address,
    this.city,
    this.latitude,
    this.longitude,
    this.metadata,
  });

  factory Location.fromJson(Map<String, dynamic> json) {
    return Location(
      id: json['id'],
      name: json['name'],
      address: json['address'],
      city: json['city'],
      latitude: json['latitude'] != null
          ? double.tryParse(json['latitude'].toString())
          : null,
      longitude: json['longitude'] != null
          ? double.tryParse(json['longitude'].toString())
          : null,
      metadata: Metadata.fromJson(json['metadata'] ?? {}),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'address': address,
      'city': city,
      'latitude': latitude,
      'longitude': longitude,
      'metadata': metadata!.toJson(),
    };
  }
}
