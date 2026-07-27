import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/features/auth/presentation/pages/signup_page.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_textfield.dart';
import 'package:macrox_app/features/profile/presentation/pages/basic_information_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _hidePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _login() {
    if (!(_formKey.currentState?.validate() ?? false)) return;
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const BasicInformationPage()),
    );

    debugPrint("Login Successful");
  }

  void _navigateToSignup() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const SignupPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            keyboardDismissBehavior: ScrollViewKeyboardDismissBehavior.onDrag,
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 100),

                const Text(
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Log in to your account",
                  style: TextStyle(
                    color: AppColors.textSecondaryColor,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 30),

                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      CustomTextField(
                        controller: _emailController,
                        hintText: "Email",
                        keyboardType: TextInputType.emailAddress,
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your email";
                          }

                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');

                          if (!emailRegex.hasMatch(value.trim())) {
                            return "Please enter a valid email";
                          }

                          return null;
                        },
                      ),

                      const SizedBox(height: 16),
                      CustomTextField(
                        controller: _passwordController,
                        hintText: "Password",
                        obscureText: _hidePassword,
                        suffixIcon: IconButton(
                          icon: Icon(
                            _hidePassword
                                ? Icons.visibility_off
                                : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _hidePassword = !_hidePassword;
                            });
                          },
                        ),
                        validator: (value) {
                          if (value == null || value.trim().isEmpty) {
                            return "Please enter your password";
                          }
                          if (value.trim().length < 8) {
                            return "Password must be at least 8 characters";
                          }
                          return null;
                        },
                      ),
                    ],
                  ),
                ),

                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forgot password?",
                      style: TextStyle(color: AppColors.primaryColor),
                    ),
                  ),
                ),

                const SizedBox(height: 40),

                CustomAppElevatedButton(text: "Log in", onPressed: _login),

                const SizedBox(height: 35),

                Row(
                  children: const [
                    Expanded(child: Divider(color: AppColors.borderColor)),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Text("Or", style: TextStyle(color: Colors.grey)),
                    ),
                    Expanded(child: Divider(color: AppColors.borderColor)),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  children: [
                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                          side: const BorderSide(color: AppColors.borderColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: Image.network(
                          "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                          height: 22,
                        ),
                      ),
                    ),

                    const SizedBox(width: 16),

                    Expanded(
                      child: OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                          minimumSize: const Size.fromHeight(55),
                          side: const BorderSide(color: AppColors.borderColor),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14),
                          ),
                        ),
                        child: const Icon(
                          Icons.apple,
                          color: Colors.white,
                          size: 26,
                        ),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 30),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Don't have an account?",
                      style: TextStyle(color: AppColors.textSecondaryColor),
                    ),
                    TextButton(
                      onPressed: _navigateToSignup,
                      child: const Text(
                        "Sign up",
                        style: TextStyle(color: AppColors.primaryColor),
                      ),
                    ),
                  ],
                ),

                const SizedBox(height: 24),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
