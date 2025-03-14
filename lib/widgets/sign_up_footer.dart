import 'package:flutter/material.dart';
import 'package:quillhub/widgets/clickable_text.dart';

class SignUpFooter extends StatelessWidget {
  const SignUpFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          'Already have an account?',
          style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
        ),
        SizedBox(width: 5,),
        Clickable_Text(
          linkName: 'login',
          child: const Text(
            'SIGN IN',
            style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
