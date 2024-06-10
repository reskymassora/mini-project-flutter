import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {
  final String email;
  final String name;
  final String address;
  final String phoneNumber;
  final String password;
  final String confirmPassword;

  UserModel(
      {required this.email,
      required this.name,
      required this.address,
      required this.phoneNumber,
      required this.password,
      required this.confirmPassword});

  factory UserModel.fromFirestore(
    DocumentSnapshot<Map<String, dynamic>> snapshot,
  ) {
    final data = snapshot.data();
    return UserModel(
      email: data?['email'],
      name: data?['name'],
      address: data?['address'],
      phoneNumber: data?['phoneNumber'],
      password: data?['password'],
      confirmPassword: data?['confirmPassword'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      "email": email,
      "name": name,
      "address": address,
      "phoneNumber": phoneNumber,
      "password": password,
      "confirmPassword": confirmPassword,
    };
  }
  
}
