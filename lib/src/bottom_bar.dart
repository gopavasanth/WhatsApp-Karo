import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:whatsapp_karo/consts.dart';
import 'package:whatsapp_karo/utils.dart';

class BottomBar extends StatelessWidget {
  const BottomBar({super.key});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Container(
        color: Colors.black,
        width: 500,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            RichText(
                text: TextSpan(children: [
              const TextSpan(text: Constants.footerMessage),
              TextSpan(
                text: Constants.author,
                style: const TextStyle(decoration: TextDecoration.underline),
                recognizer: TapGestureRecognizer()
                  ..onTap = UrlHelper.launchWebsite,
              ),
            ])),
          ],
        ),
      ),
    );
  }
}
