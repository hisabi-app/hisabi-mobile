import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatelessWidget {
  final route = MaterialPageRoute(builder: (context) => LandingScreen());

  Future checkIfUserLoggedIn() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? email = prefs.getString('email');
    String? password = prefs.getString('password');
    String? token = prefs.getString('token');
    List<String>? listOfBanks = prefs.getStringList('listOfBanks');
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
            oldState.copyWith(token: snapshot.data.toString()),
          );

          return HomePage();
        } else {
          return Scaffold(
            appBar: AppBar(title: const Text('Landing/Authentication Page')),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return LoginScreen();
                          },
                        ),
                      );
                    },
                    child: const Text('Sign In'),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return SignUpScreen();
                          },
                        ),
                      );
                    },
                    child: const Text('Sign Up'),
                  ),
                ],
              ),
            ),
          );
        }
      },
    );
  }
}
