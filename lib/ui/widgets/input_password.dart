import 'package:flutter/material.dart';

class InputPassword extends StatelessWidget {
  const InputPassword({
    Key? key,
    required TextEditingController passwordController,
  })  : _passwordController = passwordController,
        super(key: key);

  final TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _passwordController,
      obscureText: true,
      decoration: const InputDecoration(
          hintText: 'Contraseña',
          prefixIcon: Icon(
            Icons.lock,
            color: Colors.blue,
          )),
    );
  }
}
