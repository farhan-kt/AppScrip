import 'package:users_app/model/address_model.dart';

class UserModel {
  int? id;
  String? name;
  String? userName;
  String? email;
  Address? address;
  String? phone;
  String? website;

  UserModel({
    this.id,
    this.name,
    this.userName,
    this.email,
    this.address,
    this.phone,
    this.website,
  });

  UserModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    userName = json['username'];
    email = json['email'];
    address =
        json['address'] != null ? Address.fromJson(json['address']) : null;
    phone = json['phone'];
    website = json['website'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      'id': id,
      'name': name,
      'username': userName,
      'email': email,
      'address': address?.toJson(),
      'phone': phone,
      'website': website,
    };
    return data;
  }
}
