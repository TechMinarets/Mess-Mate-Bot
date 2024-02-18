import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:messmatebot/presentation/screen/auth/notifier/auth_notifier.dart';
import 'package:messmatebot/presentation/screen/home/home_screen.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: SafeArea(
        child: Container(
          padding: const EdgeInsets.only(left: 32, bottom: 32),
          width: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Positioned(
                top: 0,
                right: 0,
                child: FractionallySizedBox(
                  widthFactor: 1,
                  child: Container(
                    height: 100, // Set the height of the bubble
                    width: 100, // Set the width of the bubble
                    decoration: const BoxDecoration(
                      color: Colors.blue, // Set the color of the bubble
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(
                          100,
                        ), // Adjust as needed
                      ),
                    ),
                  ),
                ),
              ),
              Flexible(
                flex: 5,
                child: Container(),
              ),
              // const SizedBox(
              //   height: 64,
              // ),
              // TextFieldInput(
              //   hintText: 'Enter your email',
              //   textInputType: TextInputType.emailAddress,
              //   textEditingController: _emailController,
              // ),
              // const SizedBox(
              //   height: 24,
              // ),
              // TextFieldInput(
              //   hintText: 'Enter your password',
              //   textInputType: TextInputType.text,
              //   textEditingController: _passwordController,
              //   isPass: true,
              // ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Let\'s get\nStarted',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.w900,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),

              const SizedBox(
                height: 05,
              ),

              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Track Together',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w600,
                  ),
                  textAlign: TextAlign.left,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  ref.read(authNotifierProvider.notifier).googleSignIn();
                  Navigator.of(context).pushReplacement(
                    MaterialPageRoute(
                      builder: (context) => const HomeScreen(),
                    ),
                  );
                },
                child: Container(
                  decoration: ShapeDecoration(
                    color: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  height: 50,
                  width: 180,
                  child: Center(
                    child: const Text(
                      'Login',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
