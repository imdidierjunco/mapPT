import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mappt/provider/google_sign_in.dart';
import 'package:mappt/ui/screens/inicio.dart';
import 'package:provider/provider.dart';

import '../../utils/gobal_colors.dart';
import '../widgets/button.dart';
import '../widgets/input_form.dart';
import '../widgets/social_login.dart';

class RegistroScreen extends StatefulWidget {
  const RegistroScreen({super.key});

  @override
  State<RegistroScreen> createState() => _RegistroScreenState();
}

GoogleSignIn _googleSignIn = GoogleSignIn(
  scopes: [
    'email',
    'https://www.googleapis.com/auth/contacts.readonly',
  ],
);

class _RegistroScreenState extends State<RegistroScreen> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  void add() {
    if (_formKey.currentState!.validate()) {
      final String name = nameController.text;
      final String email = emailController.text;
      final String password = passwordController.text;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: SafeArea(
              child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Form(
          key: _formKey,
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
                'Crear Cuenta',
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
                controller: nameController,
                text: 'Nombre',
                textInputType: TextInputType.text,
                obscure: false,
                icon: Icons.person,
              ),
              const SizedBox(
                height: 20,
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
                  text: 'Crear Cuenta',
                  onPreseed: () async {
                    if (_formKey.currentState!.validate()) {
                      const Center(child: CircularProgressIndicator());
                      FirebaseFirestore.instance
                          .collection('mappt')
                          .add({
                            'name': nameController.text,
                            'email': emailController.text,
                            'password': passwordController.text
                          })
                          .then((value) => Get.to(() => const InicioScreen()))
                          .catchError((error) =>
                              // ignore: invalid_return_type_for_catch_error
                              print('No se pudo crear el usuario $error'));
                    }
                    const Center(
                        child: Text(
                      'Llene los campos faltantes',
                      style: TextStyle(fontWeight: FontWeight.w400),
                    ));
                  }),
              const SizedBox(
                height: 40,
              ),
              SocialLoginWidget(
                onPreseed: () {},
                //Registro con Google
                onPreseed1: () {
                  // final provider =
                  //     Provider.of<GoogleSignInProvider>(context, listen: false);
                  // provider.googleLogin();
                  // GoogleSignIn().signIn();
                  //Get.to(InicioScreen());
                },
                text: 'O registrate con',
              ),
            ],
          ),
        ),
      ))),
    );
  }
}
