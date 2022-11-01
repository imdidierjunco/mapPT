import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mappt/ui/screens/registro.dart';
import 'package:mappt/ui/widgets/button.dart';
import 'package:mappt/ui/widgets/input_form.dart';
import 'package:mappt/ui/widgets/social_login.dart';
import 'package:mappt/utils/gobal_colors.dart';

import 'inicio.dart';

class IngresarScreen extends StatefulWidget {
  const IngresarScreen({super.key});

  @override
  State<IngresarScreen> createState() => _IngresarScreenState();
}

class _IngresarScreenState extends State<IngresarScreen> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Center(
              child: Image.asset(
                'assets/Logo Didier NB.png',
                width: 250,
                height: 250,
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Text(
              'Ingrese a su cuenta',
              textAlign: TextAlign.start,
              style: TextStyle(
                  color: GlobalColors.textColor,
                  fontSize: 22,
                  fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 30,
            ),
            InputFormWidget(
              controller: emailController,
              text: 'E-mail',
              textInputType: TextInputType.emailAddress,
              obscure: false,
              icon: Icons.email,
            ),
            const SizedBox(
              height: 20,
            ),
            InputFormWidget(
              controller: passwordController,
              text: 'Contraseña',
              textInputType: TextInputType.text,
              obscure: true,
              icon: Icons.password,
            ),
            const SizedBox(
              height: 30,
            ),
            ButtonWidget(
              text: 'Ingresar',
              onPreseed: () async {
                User? user = await loginUsingPasswordEmail(
                    email: emailController.text,
                    password: passwordController.text,
                    context: context);
                if (user != null) {
                  Get.to(const InicioScreen());
                }
              },
            ),
            const SizedBox(
              height: 40,
            ),
            SocialLoginWidget(
              onPreseed: () {},
              onPreseed1: () {},
              text: 'O ingresa con',
            ),
          ],
        ),
      ))),
      bottomNavigationBar: Container(
        alignment: Alignment.center,
        color: Colors.white,
        height: 45,
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          const Text('¿No estás registrado?'),
          const SizedBox(
            width: 15,
          ),
          TextButton(
            onPressed: (() {
              Get.to(const RegistroScreen());
            }),
            child: const Text(
              '¡Registrate aquí!',
              style: TextStyle(color: Colors.blueAccent),
            ),
          )
        ]),
      ),
    );
  }
}
