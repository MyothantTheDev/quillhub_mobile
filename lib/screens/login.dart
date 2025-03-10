import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:quillhub/providers/theme_mode_provider.dart';
import 'package:quillhub/widgets/circle_paint.dart';
import 'package:quillhub/widgets/passwordInputField.dart';

class LoginScreen extends ConsumerWidget {

  LoginScreen({super.key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController textEmail = TextEditingController();
  final TextEditingController textPassword = TextEditingController();

  Widget _buildCircle({required double widthFactor, required double heightFactor,
    required Color color, required double left, required double top})
  {
    return Positioned(
      left: left,
      top: top,
      child: SizedBox(
        width: widthFactor,
        height: heightFactor,
        child: CustomPaint(
          painter: CirclePainter(circleColor: color),
        ),
      ),
    );
  }

  BoxDecoration _boxShadow(themeData) {

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
          _buildCircle(widthFactor: width * 0.55, heightFactor: width * 0.55, color: Colors.indigo.shade100, left: width * 0.55, top: -50),
          _buildCircle(widthFactor: width * 0.48, heightFactor: width * 0.48, color: Colors.indigo, left: width * 0.63, top: -50),
          _buildCircle(widthFactor: width * 0.58, heightFactor: width * 0.58, color: Colors.indigo.shade100, left: 40, top: height * 0.88),
          _buildCircle(widthFactor: width * 0.5, heightFactor: width * 0.5, color: Colors.indigo, left: 40, top: height * 0.9),
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
                   padding: EdgeInsets.all(32),
                   children: [
                     Text(
                       'Sign In'.toUpperCase(),
                       style: TextStyle(
                         fontSize: 32,
                         fontWeight: FontWeight.bold,
                         fontFamily: 'Pacifico'
                       ),
                     ),
                     SizedBox(height: height * 0.05,),
                     Container(
                       decoration: _boxShadow(themeData),
                       child: TextFormField(
                         keyboardType: TextInputType.emailAddress,
                         controller: textEmail,
                         autocorrect: false,
                         decoration: InputDecoration(
                           labelText: 'Email',
                           prefixIcon: Icon(Icons.email_outlined),
                           border: OutlineInputBorder(
                             borderSide: BorderSide.none,
                           )
                         ),
                       ),
                     ),
                     SizedBox(height: height * 0.035,),
                     Container(
                       decoration: _boxShadow(themeData),
                       child: PasswordInputField(controller: textPassword)
                     ),
                     SizedBox(height: height * 0.035,),
                     ElevatedButton(
                       style: ElevatedButton.styleFrom(
                         backgroundColor: Colors.indigo,
                         foregroundColor: Colors.white,
                         shape: RoundedRectangleBorder(),
                         elevation: 5,
                         
                       ),
                       onPressed: () {},
                       child: const Text('SIGN IN'),
                     )
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