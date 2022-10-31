import 'package:flutter/material.dart';

class RememberPassword extends StatelessWidget {
  const RememberPassword({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Text(
      '¿Olvidate tu contraseña?',
      style: TextStyle(color: Colors.blueAccent),
    );
  }
}
