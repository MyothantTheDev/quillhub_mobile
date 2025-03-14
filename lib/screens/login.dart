import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/theme_mode_provider.dart';
import 'package:quillhub/widgets/custom_elevated_btn.dart';
import 'package:quillhub/widgets/email_input_field.dart';
import 'package:quillhub/widgets/password_input_field.dart';
import 'package:quillhub/widgets/sign_in_background.dart';
import 'package:quillhub/widgets/sign_in_footer.dart';

class LoginScreen extends ConsumerWidget {

  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  BoxDecoration _boxShadow(ThemeMode themeData) {

    return BoxDecoration(
      boxShadow: [
        BoxShadow(
          blurRadius: 10,
          color: themeData == ThemeMode.dark ? Colors.white38 : Colors.black12,
          offset: Offset(1, 1),
          blurStyle: BlurStyle.outer
        )
      ]
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final double width = MediaQuery.sizeOf(context).width;
    final double height = MediaQuery.sizeOf(context).height;

    final themeData = ref.watch(themeProvider);

    return Scaffold(
      body: Stack(
        children: [
          SignInBackground(),
          Positioned(
            top: 200,
            child: Container(
              color: themeData == ThemeMode.dark ? Colors.white10 : Colors.white70,
              width: width * 0.9,
              height: height * 0.6,
              child: Form(
               key: formKey,
               child: Container(
                 decoration: _boxShadow(themeData),
                 child: ListView(
                   padding: const EdgeInsets.all(32),
                   children: [
                     Text(
                       'SIGN IN',
                       style: TextStyle(
                         fontSize: 32,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Pacifico'
                       ),
                     ),
                     SizedBox(height: height * 0.05,),
                     EmailInputField(controller: textEmail, decoration: _boxShadow(themeData)),
                     SizedBox(height: height * 0.035,),
                     PasswordInputField(controller: textPassword, decoration: _boxShadow(themeData), value: 'Password'),
                     SizedBox(height: height * 0.035,),
                     SignInButton(onPressed: () {}),
                     SizedBox(height: height * 0.035),
                     SignInFooter()
                   ],
                 ),
               ),
             ),
            )
           )
        ]
      ),
    );
  }
}