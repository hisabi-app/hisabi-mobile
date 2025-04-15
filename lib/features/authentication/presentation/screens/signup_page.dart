import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:email_validator/email_validator.dart' as EmailValidator2;
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';

class SignUpScreen extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => SignUpScreen());

  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  final passwordValidator = MultiValidator([
    RequiredValidator(errorText: 'password is required'),
    MinLengthValidator(8, errorText: 'password must be at least 8 digits long'),
    PatternValidator(r'(?=.*?[#?!@$%^&*-])',
        errorText: 'passwords must have at least one special character')
  ]);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Container(
        child: Form(
          child: Column(
            children: [
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: (value) {
                  bool isValid =
                      EmailValidator2.EmailValidator.validate(value!);
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
                obscureText: true,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                validator: passwordValidator,
                controller: passwordController,
                decoration: InputDecoration(
                  labelText: 'Password',
                ),
              ),
              ElevatedButton(
                onPressed: () async {},
                child: Text('Sign Up'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
