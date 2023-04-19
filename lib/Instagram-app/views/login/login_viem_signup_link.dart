import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:riverpod_project/Instagram-app/views/components/rich_text/base_text.dart';
import 'package:url_launcher/url_launcher.dart';

import '../components/rich_text/rich_text_widget.dart';
import '../constants/Strings.dart';

class LoginViewSignUpLink extends StatelessWidget {
  const LoginViewSignUpLink({super.key});

  @override
  Widget build(BuildContext context) {
    return RichTextWidget(
      styleForAll: const TextStyle(fontSize: 15),
      texts: [
        BaseText.plainText(text: Strings.dontHaveAnAccount),
        BaseText.plainText(text: Strings.signUpOn),
        BaseText.linkText(
            text: Strings.facebook,
            onTapped: () {
              launchUrl(Uri.parse(Strings.facebookSignupUrl));
            }),
        BaseText.plainText(text: Strings.orCreateAnAccountOn),
        BaseText.linkText(
            text: Strings.google,
            onTapped: () {
              launchUrl(Uri.parse(Strings.googleSignupUrl));
            })
      ],
    );
  }
}
