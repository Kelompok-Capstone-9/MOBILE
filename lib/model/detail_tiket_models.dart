class ClassTicketDetail {
  Metadata metadata;
  DataDetailBooking data;

  ClassTicketDetail({required this.metadata, required this.data});

  factory ClassTicketDetail.fromJson(Map<String, dynamic> json) {
    return ClassTicketDetail(
      metadata: Metadata.fromJson(json['metadata']),
      data: DataDetailBooking.fromJson(json['data']),
    );
  }
}

class Metadata {
  int statusCode;
  String message;
  String errorReason;

  Metadata(
      {required this.statusCode,
      required this.message,
      required this.errorReason});

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      statusCode: json['status_code'] ?? 0,
      message: json['message'] ?? "",
      errorReason: json['error_reason'] ?? "",
    );
  }
}

class DataDetailBooking {
  int? id;
  User? user;
  ClassPackageDetail? classPackage;
  String? status;
  Metadata? metadata;

  DataDetailBooking(
      {this.id, this.user, this.classPackage, this.status, this.metadata});

  factory DataDetailBooking.fromJson(Map<String, dynamic> json) {
    return DataDetailBooking(
      id: json['id'],
      user: User.fromJson(json['user']),
      classPackage: ClassPackageDetail.fromJson(json['class_package']),
      status: json['status'],
      metadata: Metadata.fromJson(json['metadata']),
    );
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
      metadata: Metadata.fromJson(json['metadata']),
    );
  }
}

class ClassPackageDetail {
  int? id;
  String? period;
  int? price;
  ClassInfo? classInfo;
  Metadata? metadata;

  ClassPackageDetail({
    this.id,
    this.period,
    this.price,
    this.classInfo,
    this.metadata,
  });

  factory ClassPackageDetail.fromJson(Map<String, dynamic> json) {
    return ClassPackageDetail(
      id: json['id'],
      period: json['period'],
      price: json['price'],
      classInfo: ClassInfo.fromJson(json['class']),
      metadata: Metadata.fromJson(json['metadata']),
    );
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
  String? imageBanner;
  Metadata? metadata;

  ClassInfo({
    this.id,
    this.name,
    this.description,
    this.classType,
    this.link,
    this.startedAt,
    this.location,
    this.imageBanner,
    this.metadata,
  });

  factory ClassInfo.fromJson(Map<String, dynamic> json) {
    return ClassInfo(
      id: json['id'],
      name: json['name'],
      description: json['description'],
      classType: json['class_type'],
      link: json['link'],
      startedAt: json['started_at'],
      location: Location.fromJson(json['location']),
      imageBanner: json['image_banner'],
      metadata: Metadata.fromJson(json['metadata']),
    );
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
      metadata: Metadata.fromJson(json['metadata']),
    );
  }
}
