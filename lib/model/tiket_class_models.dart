class Response {
  Metadata? metadata;
  DataClassBooking? data;

  Response({this.metadata, this.data});

  factory Response.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return Response();
    }
    return Response(
      metadata: Metadata.fromJson(json['metadata']),
      data: DataClassBooking.fromJson(json['data']),
    );
  }
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

  factory Metadata.fromJson(Map<String, dynamic>? json) {
    if (json == null || json['status_code'] == null) {
      return Metadata(
        statusCode: 0,
        message: '',
        errorReason: '',
      );
    }
    return Metadata(
      statusCode: json['status_code'],
      message: json['message'] ?? '',
      errorReason: json['error_reason'] ?? '',
    );
  }
}

class DataClassBooking {
  int id;
  String product;
  int productId;
  int amount;
  String transactionCode;
  PaymentMethod? paymentMethod;
  String status;
  Metadata? metadata;

  DataClassBooking({
    required this.id,
    required this.product,
    required this.productId,
    required this.amount,
    required this.transactionCode,
    this.paymentMethod,
    required this.status,
    this.metadata,
  });

  factory DataClassBooking.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return DataClassBooking(
        id: 0,
        product: '',
        productId: 0,
        amount: 0,
        transactionCode: '',
        status: '',
      );
    }
    return DataClassBooking(
      id: json['id'],
      product: json['product'],
      productId: json['product_id'],
      amount: json['amount'],
      transactionCode: json['transaction_code'],
      paymentMethod: PaymentMethod.fromJson(json['payment_method']),
      status: json['status'],
      metadata: Metadata.fromJson(json['metadata']),
    );
  }
}

class PaymentMethod {
  int id;
  String name;
  Metadata? metadata;

  PaymentMethod({
    required this.id,
    required this.name,
    this.metadata,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic>? json) {
    if (json == null) {
      return PaymentMethod(id: 0, name: '');
    }
    return PaymentMethod(
      id: json['id'],
      name: json['name'],
      metadata: Metadata.fromJson(json['metadata']),
    );
  }
}
