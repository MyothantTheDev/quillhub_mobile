import 'package:flutter/material.dart';

class _CustomElevatedBtn extends StatelessWidget {
  final VoidCallback onPressed;
  final String btnValue;

  const _CustomElevatedBtn({super.key, required this.onPressed, required this.btnValue});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
        shape: const RoundedRectangleBorder(),
        elevation: 5,
      ),
      onPressed: onPressed,
      child: Text(btnValue),
    );
  }
}

class SignInButton extends StatelessWidget {
  final VoidCallback onPressed;
  const SignInButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _CustomElevatedBtn(
        onPressed: onPressed,
        btnValue: 'SIGN IN'
    );
  }
}

class RegisterButton extends StatelessWidget {
  final VoidCallback onPressed;

  const RegisterButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return _CustomElevatedBtn(
        onPressed: onPressed,
        btnValue: 'SIGN UP');
  }
}
