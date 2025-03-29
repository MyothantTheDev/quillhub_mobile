import 'package:flutter/material.dart';
import 'package:quillhub/widgets/buttons/clickable_text.dart';

class SignInFooter extends StatelessWidget {
  const SignInFooter({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Clickable_Text(
          linkName: '',
          child: const Text(
            'Forgot Password?',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
          ),
        ),
        const SizedBox(height: 20),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Don\'t have an account?',
              style: TextStyle(fontSize: 14, color: Colors.grey, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 10,),
            Clickable_Text(
              linkName: 'register_route',
              child: const Text(
                'SIGN UP',
                style: TextStyle(color: Colors.indigo, fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ],
    );
  }
}
