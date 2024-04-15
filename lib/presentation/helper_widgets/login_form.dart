import 'package:cashify_mobile_flutter/presentation/pages/home_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:email_validator/email_validator.dart' as EmailValidator2;
import 'package:shared_preferences/shared_preferences.dart';

class SignInForm extends StatelessWidget {
  SharedPreferences? sharedPreferences;
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);

  Future update() async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString('email', emailController.text);
    sharedPreferences!.setString('password', passwordController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        child: Column(
          children: [
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              validator: (value) {
                bool isValid = EmailValidator2.EmailValidator.validate(value!);
                if (isValid) {
                  return null;
                } else {
                  return 'Enter a valid email';
                }
              },
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              validator: passwordValidator,
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Password',
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                try {
                  final credential =
                      await FirebaseAuth.instance.signInWithEmailAndPassword(
                    email: emailController.text,
                    password: passwordController.text,
                  );
                  update();
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
                } on FirebaseAuthException catch (e) {
                  if (e.code == 'user-not-found') {
                    print('No user found for that email.');
                  } else if (e.code == 'wrong-password') {
                    print('Wrong password provided for that user.');
                  }
                } catch (e) {
                  print(e);
                }
              },
              child: Text('Sign In'),
            ),
          ],
        ),
      ),
    );
  }
}
