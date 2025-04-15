import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/cubit/auth_cubit.dart';

import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:email_validator/email_validator.dart' as EmailValidator2;

class SignInForm extends StatefulWidget {
  @override
  State<SignInForm> createState() => _SignInFormState();
}

class _SignInFormState extends State<SignInForm> {
  final _storage = FlutterSecureStorage();

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool _remember = false; // <-- track checkbox state here

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'Password is required'),
    MinLengthValidator(8, errorText: 'Password must be at least 8 characters'),
    PatternValidator(
      r'(?=.*?[#?!@$%^&*-])',
      errorText: 'Password must have at least one special character',
    ),
  ]);

  void _login() async {
    context.read<AuthCubit>().login(
      emailController.text,
      passwordController.text,
      _remember, // <-- use updated checkbox state
    );
    context.go('/dashboard');
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
                bool isValid = EmailValidator2.EmailValidator.validate(
                  value ?? '',
                );
                return isValid ? null : 'Enter a valid email';
              },
              controller: emailController,
              decoration: InputDecoration(labelText: 'Email'),
            ),
            TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              obscureText: true,
              // validator: passwordValidator,
              controller: passwordController,
              decoration: InputDecoration(labelText: 'Password'),
            ),

            // ✅ Checkbox to remember login
            CheckboxListTile(
              title: Text("Remember me"),
              value: _remember,
              onChanged: (value) {
                setState(() {
                  _remember = value ?? false;
                });
              },
              controlAffinity: ListTileControlAffinity.leading,
              contentPadding: EdgeInsets.zero,
            ),

            ElevatedButton(onPressed: _login, child: Text('Sign In')),
          ],
        ),
      ),
    );
  }
}
