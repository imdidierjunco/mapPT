import 'package:flutter/material.dart';

class InputFormWidget extends StatelessWidget {
  const InputFormWidget(
      {super.key,
      required this.controller,
      required this.text,
      required this.textInputType,
      required this.obscure,
      required this.icon});
  final TextEditingController controller;
  final String text;
  final TextInputType textInputType;
  final bool obscure;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 55,
        padding: const EdgeInsets.only(top: 4, left: 14),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.2), blurRadius: 8)
            ]),
        child: TextFormField(
          controller: controller,
          keyboardType: textInputType,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: text,
              icon: Icon(icon),
              contentPadding: const EdgeInsets.all(1)),
        ));
  }
}
