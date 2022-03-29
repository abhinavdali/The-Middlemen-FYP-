// To parse this JSON data, do
//
//     final shipment = shipmentFromJson(jsonString);

import 'dart:convert';

Shipment shipmentFromJson(String str) => Shipment.fromJson(json.decode(str));

String shipmentToJson(Shipment data) => json.encode(data.toJson());

class Shipment {
  Shipment({
    this.id,
    this.ofType,
    this.weight,
    this.size,
    this.price,
    this.receiver,
    this.phoneNumber,
    this.packageType,
    this.start,
    this.destination,
    this.status,
    this.email,
    this.paymentType,
    this.trackingNumber,
  });

  int? id;
  String? ofType;
  String? weight;
  String? size;
  String? price;
  String? receiver;
  String? phoneNumber;
  String? packageType;
  String? start;
  String? destination;
  String? status;
  String? email;
  String? paymentType;
  String? trackingNumber;

  factory Shipment.fromJson(Map<String, dynamic> json) => Shipment(
    id: json["id"],
    ofType: json["of_type"],
    weight: json["weight"],
    size: json["size"],
    price: json["price"],
    receiver: json["receiver"],
    phoneNumber: json["phone_number"],
    packageType: json["package_type"],
    start: json["start"],
    destination: json["destination"],
    status: json["status"],
    email: json["email"],
    paymentType: json["payment_type"],
    trackingNumber: json["tracking_number"],
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "of_type": ofType,
    "weight": weight,
    "size": size,
    "price": price,
    "receiver": receiver,
    "phone_number": phoneNumber,
    "package_type": packageType,
    "start": start,
    "destination": destination,
    "status": status,
    "email": email,
    "payment_type": paymentType,
    "tracking_number": trackingNumber,
  };
}
