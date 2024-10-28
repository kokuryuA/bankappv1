import 'package:flutter/material.dart';
class adressmodel {
  final String? id;
  final int acountbalance;
  final String country;
  final String adress;
  final String codepostal;

  adressmodel(this.acountbalance, {
    this.id,
    required this.country,
    required this.adress,
    required this.codepostal,
  });
  toJson(){
    return{
      "fullname": country,
      "age": adress,
      "email": codepostal,
    };
  }

}