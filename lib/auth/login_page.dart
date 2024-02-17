import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/auth/auth_methods.dart';
import 'package:messmatebot/auth/signup_page.dart';
import 'package:messmatebot/auth/text_field_input_widget.dart';
import 'package:messmatebot/presentation/route_manager/route_manager.dart';
import 'package:messmatebot/presentation/screen/auth/notifier/auth_notifier.dart';
import 'package:messmatebot/presentation/screen/auth/state/auth_ui_state.dart';
import 'package:messmatebot/presentation/screen/home/home_screen.dart';

class LoginScreen extends ConsumerStatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends ConsumerState<LoginScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    super.dispose();
    _emailController.dispose();
    _passwordController.dispose();
  }
  //
  // void loginUser() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().loginUser(
  //     email: _emailController.text,
  //     password: _passwordController.text,
  //   );
  // }
  //
  // void signInWithGmail() async {
  //   setState(() {
  //     _isLoading = true;
  //   });
  //   String res = await AuthMethods().signInWithGoogle();
  //
  //   if (res == 'success') {
  //     RouteManager.of(context).goToHomeScreen();
  //   } else {}
  //   setState(() {
  //     _isLoading = true;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    final authUiState = ref.watch(authNotifierProvider);
    if (authUiState == const AuthUiState.loading()) {
      return const CircularProgressIndicator();
    } else if (authUiState == const AuthUiState.authenticated()) {
      return const HomeScreen();
    } else {
      return Scaffold(
        resizeToAvoidBottomInset: false,
        body: SafeArea(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            width: double.infinity,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                const SizedBox(
                  height: 64,
                ),
                TextFieldInput(
                  hintText: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                  textEditingController: _emailController,
                ),
                const SizedBox(
                  height: 24,
                ),
                TextFieldInput(
                  hintText: 'Enter your password',
                  textInputType: TextInputType.text,
                  textEditingController: _passwordController,
                  isPass: true,
                ),
                const SizedBox(
                  height: 24,
                ),
                // InkWell(
                //   onTap: loginUser,
                //   child: Container(
                //     width: double.infinity,
                //     alignment: Alignment.center,
                //     padding: const EdgeInsets.symmetric(vertical: 12),
                //     decoration: const ShapeDecoration(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.all(Radius.circular(4)),
                //       ),
                //       color: Colors.blueAccent,
                //     ),
                //     child: !_isLoading
                //         ? const Text(
                //             'Log in',
                //           )
                //         : const CircularProgressIndicator(
                //             color: Colors.black,
                //           ),
                //   ),
                // ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () =>
                      ref.read(authNotifierProvider.notifier).googleSignIn(),
                  child: Container(
                    decoration: ShapeDecoration(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    height: 50,
                    width: 150,
                    child: const Text(
                      'Sign in with GMAIL',
                    ),
                  ),
                ),
                Flexible(
                  flex: 2,
                  child: Container(),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(vertical: 8),
                      child: const Text(
                        'Dont have an account?',
                      ),
                    ),
                    GestureDetector(
                      onTap: () => Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (context) => const SignupScreen(),
                        ),
                      ),
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8),
                        child: const Text(
                          ' Signup.',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      );
    }
  }
}
