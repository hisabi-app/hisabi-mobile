import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/login_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingPage extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => LandingPage());

  Future checkIfUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    String? token = prefs.getString('token');
    if (email != null && password != null) {
      return token;
    }
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        future: checkIfUserLoggedIn(),
        builder: (context, snapshot) {
          if (snapshot.data != null && snapshot.data != "") {
            final oldState = context.read<AppCubit>().state;
            context.read<AppCubit>().updateState(
                oldState.copyWith(token: snapshot.data.toString()));
            return HomePage();
          } else {
            return Scaffold(
              appBar: AppBar(
                title: const Text('Landing/Authentication Page'),
              ),
              body: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return LoginPage();
                        }));
                      },
                      child: const Text('Sign In'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) {
                          return SignUpScreen();
                        }));
                      },
                      child: const Text('Sign Up'),
                    ),
                  ],
                ),
              ),
            );
          }
        });
  }
}
