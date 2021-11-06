// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    this.id,
    this.name,
    this.username,
    this.email,
    this.emailVerifiedAt,
    this.phone,
    this.image,
    this.dob,
    this.height,
    this.weight,
    this.hip,
    this.waist,
    this.bvi,
    this.experience,
    this.certificate,
    this.status,
    this.role,
    this.deviceType,
    this.token,
    this.firebaseId,
    this.categoryId,
    this.description,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  String name;
  String username;
  String email;
  dynamic emailVerifiedAt;
  String phone;
  String image;
  String dob;
  dynamic height;
  dynamic weight;
  dynamic hip;
  dynamic waist;
  dynamic bvi;
  String experience;
  String certificate;
  String status;
  int role;
  String deviceType;
  String token;
  dynamic firebaseId;
  String categoryId;
  dynamic description;
  String price;
  DateTime createdAt;
  DateTime updatedAt;

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json["id"],
    name: json["name"],
    username: json["username"],
    email: json["email"],
    emailVerifiedAt: json["email_verified_at"],
    phone: json["phone"],
    image: json["image"],
    dob: json["dob"],
    height: json["height"],
    weight: json["weight"],
    hip: json["hip"],
    waist: json["waist"],
    bvi: json["bvi"],
    experience: json["experience"],
    certificate: json["certificate"],
    status: json["status"],
    role: json["role"],
    deviceType: json["device_type"],
    token: json["token"],
    firebaseId: json["firebaseID"],
    categoryId: json["category_id"].toString(),
    description: json["description"],
    price: json["price"].toString(),
    createdAt: json["created_at"]!=null?DateTime.parse(json["created_at"]):new DateTime(2021),
    updatedAt: json["updated_at"]!=null?DateTime.parse(json["updated_at"]):new DateTime(2021),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "username": username,
    "email": email,
    "email_verified_at": emailVerifiedAt,
    "phone": phone,
    "image": image,
    "dob": dob,
    "height": height,
    "weight": weight,
    "hip": hip,
    "waist": waist,
    "bvi": bvi,
    "experience": experience,
    "certificate": certificate,
    "status": status,
    "role": role,
    "device_type": deviceType,
    "token": token,
    "firebaseID": firebaseId,
    "category_id": categoryId,
    "description": description,
    "price": price,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
