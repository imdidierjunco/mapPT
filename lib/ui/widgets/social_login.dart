import 'package:flutter/material.dart';

class SocialLoginWidget extends StatelessWidget {
  const SocialLoginWidget(
      {super.key,
      required this.text,
      required this.onPreseed,
      required this.onPreseed1});
  final String text;
  final Function onPreseed;
  final Function onPreseed1;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.center,
          child: Text(
            text,
            style: const TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w400),
          ),
        ),
        const SizedBox(
          height: 30,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
                iconSize: 45,
                onPressed: onPreseed1(),
                icon: Image.asset(
                  'assets/google.png',
                )),
            const SizedBox(
              width: 30,
            ),
            IconButton(
                iconSize: 45,
                onPressed: onPreseed(),
                icon: Image.asset('assets/facebook.png')),
          ],
        )
      ],
    );
  }
}
