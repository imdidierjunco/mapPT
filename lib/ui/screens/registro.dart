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

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
              onPreseed: () {},
            ),
            const SizedBox(
              height: 40,
            ),
            SocialLoginWidget(
              onPreseed: () {},
              //Registro con Google
              onPreseed1: () {
                final provider =
                    Provider.of<GoogleSignInProvider>(context, listen: false);
                provider.googleLogin();
                GoogleSignIn().signIn();
                //Get.to(InicioScreen());
              },
              text: 'O registrate con',
            ),
          ],
        ),
      ))),
    );
  }
}
