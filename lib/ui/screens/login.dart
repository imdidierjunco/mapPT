import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../widgets/input_email.dart';
import '../widgets/input_password.dart';
import '../widgets/remenber_password.dart';
import 'inicio.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  static Future<User?> loginUsingPasswordEmail(
      {required String email,
      required String password,
      required BuildContext context}) async {
    FirebaseAuth auth = FirebaseAuth.instance;
    User? user;
    try {
      UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email, password: password);
      user = userCredential.user;
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-no-found') {
        print('Usuario existe un usuario registrado con ese correo');
      }
    }
    return user;
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _emailController = TextEditingController();
    TextEditingController _passwordController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SizedBox(
            height: 300,
          ),
          const Text('Mi App de mapas',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 30,
                  fontWeight: FontWeight.bold)),
          const Text('Ingresa a tu app',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 45,
                  fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 45,
          ),
          InputEmail(emailController: _emailController),
          const SizedBox(
            height: 15,
          ),
          InputPassword(passwordController: _passwordController),
          const SizedBox(
            height: 12,
          ),
          const RememberPassword(),
          const Expanded(
            child: SizedBox(
              height: 20,
            ),
          ),
          SizedBox(
              width: double.infinity,
              child: RawMaterialButton(
                fillColor: Colors.blueAccent,
                padding: const EdgeInsets.all(22),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () async {
                  User? user = await loginUsingPasswordEmail(
                      email: _emailController.text,
                      password: _passwordController.text,
                      context: context);
                  print(user);
                  if (user != null) {
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const InicioScreen()));
                  }
                },
                child: const Text(
                  'Ingresar',
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ))
        ],
      ),
    );
  }
}
