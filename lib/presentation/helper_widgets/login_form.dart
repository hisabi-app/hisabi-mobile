import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/domain/login_repository.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
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

  Future update(String token) async {
    sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences!.setString('email', emailController.text);
    sharedPreferences!.setString('password', passwordController.text);
    sharedPreferences!.setString('token', token);
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
                  final loginRepo =
                      LoginWithApiRepo(); // Instantiate the login repository
                  final token = await loginRepo.login(
                    emailController.text,
                    passwordController.text,
                  );
                  update(token);
                  final oldState = context.read<AppCubit>().state;
                  context.read<AppCubit>().updateState(
                      oldState.copyWith(isLoggedIn: true, token: token));
                  Navigator.pushReplacement(context,
                      MaterialPageRoute(builder: (context) {
                    return HomePage();
                  }));
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
