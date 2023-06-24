class MembershipModel {
  Metadata metadata;
  TransactionInfo transactionInfo;
  MembershipData data;

  MembershipModel({
    required this.metadata,
    required this.transactionInfo,
    required this.data,
  });

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      MembershipModel(
        metadata: Metadata.fromJson(json['metadata']),
        transactionInfo: TransactionInfo.fromJson(json['transaction_info']),
        data: MembershipData.fromJson(json['data']),
      );
}

class Metadata {
  int statusCode;
  String message;
  String errorReason;

  Metadata({
    required this.statusCode,
    required this.message,
    required this.errorReason,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) => Metadata(
        statusCode: json['status_code'],
        message: json['message'],
        errorReason: json['error_reason'],
      );
}

class TransactionInfo {
  String transactionCode;
  String message;
  String transactionLink;

  TransactionInfo({
    required this.transactionCode,
    required this.message,
    required this.transactionLink,
  });

  factory TransactionInfo.fromJson(Map<String, dynamic> json) =>
      TransactionInfo(
        transactionCode: json['transaction_code'],
        message: json['message'],
        transactionLink: json['transaction_link'],
      );
}

class MembershipData {
  int id;
  User user;
  Plan plan;
  String startDate;
  String endDate;
  bool isActive;
  Metadata metadata;

  MembershipData({
    required this.id,
    required this.user,
    required this.plan,
    required this.startDate,
    required this.endDate,
    required this.isActive,
    required this.metadata,
  });

  factory MembershipData.fromJson(Map<String, dynamic> json) => MembershipData(
        id: json['id'],
        user: User.fromJson(json['user']),
        plan: Plan.fromJson(json['plan']),
        startDate: json['start_date'],
        endDate: json['end_date'],
        isActive: json['is_active'],
        metadata: Metadata.fromJson(json['metadata']),
      );
}

class User {
  int id;
  String name;
  String email;
  String password;
  String gender;
  int height;
  int goalHeight;
  int weight;
  int goalWeight;
  String trainingLevel;
  String profilePicture;
  Metadata metadata;

  User({
    required this.id,
    required this.name,
    required this.email,
    required this.password,
    required this.gender,
    required this.height,
    required this.goalHeight,
    required this.weight,
    required this.goalWeight,
    required this.trainingLevel,
    required this.profilePicture,
    required this.metadata,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
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

class Plan {
  int id;
  String name;
  int duration;
  int price;
  String description;
  Metadata metadata;

  Plan({
    required this.id,
    required this.name,
    required this.duration,
    required this.price,
    required this.description,
    required this.metadata,
  });

  factory Plan.fromJson(Map<String, dynamic> json) => Plan(
        id: json['id'],
        name: json['name'],
        duration: json['duration'],
        price: json['price'],
        description: json['description'],
        metadata: Metadata.fromJson(json['metadata']),
      );
}
