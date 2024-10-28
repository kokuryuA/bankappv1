import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'adressmodel.dart';

class usermodel {
  final String? id;
  final String accountbalance;
  final String oldbalance;

  final String fullname;
  final String age;
  final String email;
  final String password;
  final String phonenumber;

  usermodel({
    this.id,
    required this.accountbalance,
    required this.oldbalance,
    required this.fullname,
    required this.age,
    required this.email,
    required this.password,
    required this.phonenumber,
  });

  toJson() {
    return {
      "fullname": fullname,
      "age": age,
      "accountbalance": accountbalance,
      "oldbalance": oldbalance,
      "email": email,
      "password": password,
      "phonenumber": phonenumber,
    };
  }

  factory usermodel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return usermodel(
      id: document.id,
      accountbalance: data["accountbalance"],
      oldbalance: data["oldbalance"],
      fullname: data["fullname"],
      age: data["age"],
      email: data["email"],
      password: data["password"],
      phonenumber: data["phonenumber"],
    );
  }
}
