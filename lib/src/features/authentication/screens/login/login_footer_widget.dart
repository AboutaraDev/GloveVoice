

import 'package:flutter/material.dart';
import 'package:glovevoice/src/constants/colors.dart';
import 'package:glovevoice/src/constants/image_strings.dart';
import 'package:glovevoice/src/constants/sizes.dart';
import 'package:glovevoice/src/constants/text_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text('OR'),
        const SizedBox(height: tFormWeight - 20,),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: Image(image: AssetImage(tGoogleLogoImage), width: 20.0),
            onPressed: () {}, 
            label: Text(tSignInWithGoogle),
            ),
        ),
    
        const SizedBox(
          height: tFormWeight - 20,
        ),
        TextButton(
          onPressed: () {},
          child: Text.rich(
            TextSpan(
              text: tDontHaveAnAccount,
              style: Theme.of(context).textTheme.bodyMedium,
              children: const [
                TextSpan(
                  text: tSignUp,
                  style: TextStyle(color: tPrimaryColor, fontSize: 15),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}