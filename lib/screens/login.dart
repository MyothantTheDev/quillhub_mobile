import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {

  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController textEmail = TextEditingController();
  TextEditingController textPassword = TextEditingController();

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
        centerTitle: true,
      ),
      body: Form(
        key: formKey,
        child: ListView(
          padding: EdgeInsets.all(32),
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              controller: textEmail,
              autocorrect: false,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            SizedBox(height: 25),
            TextFormField(
              controller: textPassword,
              autocorrect: false,
              decoration: InputDecoration(labelText: 'Password'),
            )
          ],
        ),
      ),
    );
  }
}