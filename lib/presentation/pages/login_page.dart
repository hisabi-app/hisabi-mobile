import 'package:hisabi_mobile_flutter/presentation/helper_widgets/login_form.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => LoginPage());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign In'),
      ),
      body: SignInForm(),
    );
  }
}
