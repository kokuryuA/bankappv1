import 'package:flutter/material.dart';
class textfield extends StatelessWidget {
  const textfield({
    super.key,
    required this.texthint,
    required this.controler,
    required this.textInputType,
    this.icon = null,
    this.obscure = false,
  });

  final String texthint;
  final TextInputType textInputType;
  final icon;
  final bool obscure;
  final controler;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controler,
      obscureText: obscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(),
        hintText: texthint,
        prefixIcon: Icon(icon),
      ),
      keyboardType: textInputType,
    );
  }
}