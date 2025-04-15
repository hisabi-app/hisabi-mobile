import 'package:hisabi_mobile_flutter/features/authentication/presentation/widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => LoginScreen());

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text('Sign In')), body: SignInForm());
  }
}
