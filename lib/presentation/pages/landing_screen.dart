import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/cubit/auth_cubit.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/cubit/auth_state.dart';
import 'package:hisabi_mobile_flutter/presentation/cubit/app_cubit.dart';
import 'package:hisabi_mobile_flutter/features/dashboard/presentation/screens/dashboard_page.dart';
import 'package:hisabi_mobile_flutter/presentation/pages/home_page.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/screens/login_screen.dart';
import 'package:hisabi_mobile_flutter/features/authentication/presentation/screens/signup_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LandingScreen extends StatefulWidget {
  @override
  State<LandingScreen> createState() => _LandingScreenState();
}

class _LandingScreenState extends State<LandingScreen> {
  Future<void> checkIfUserLoggedIn() async {
    context.read<AuthCubit>().checkIfLoggedIn();
  }

  @override
  void initState() {
    super.initState();
    checkIfUserLoggedIn(); // Auto-login check on app startup
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthCubit, AuthState>(
      builder: (context, state) {
        if (state is Authenticated) {
          Future.microtask(
            () => context.go('/dashboard'),
          ); // Navigate to Dashboard if authenticated
          return Container();
        } else if (state is AuthLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          print("what the hell is this state? $state");
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
