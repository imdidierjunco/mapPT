import 'package:flutter/material.dart';

class InputEmail extends StatelessWidget {
  const InputEmail({
    Key? key,
    required TextEditingController emailController,
  })  : _emailController = emailController,
        super(key: key);

  final TextEditingController _emailController;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: _emailController,
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
          hintText: 'Correo electrónico',
          prefixIcon: Icon(
            Icons.email,
            color: Colors.blue,
          )),
    );
  }
}
