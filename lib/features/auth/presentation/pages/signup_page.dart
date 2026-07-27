import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_textfield.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  bool hidePassword = true;
  bool hideConfirmPassword = true;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,

        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  const SizedBox(height: 100),

                  const Text(
                    "Create your\naccount",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 8),

                  const Text(
                    "Let's get started",
                    style: TextStyle(
                      color: AppColors.textSecondaryColor,
                      fontSize: 15,
                    ),
                  ),

                  Form(
                    key: formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your full name";
                            }
                            return null;
                          },
                          controller: nameController,
                          hintText: "Full Name",
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your email";
                            }
                            return null;
                          },
                          controller: emailController,
                          hintText: "Email",
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter your password";
                            }
                            if (value.length < 8) {
                              return "Password must be at least 8 characters";
                            }

                            return null;
                          },
                          controller: passwordController,
                          hintText: "Password",
                        ),
                        CustomTextField(
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please confirm your password";
                            }
                            if (value != passwordController.text) {
                              return "Passwords do not match";
                            }
                            return null;
                          },
                          controller: confirmPasswordController,
                          hintText: "Confirm Password",
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

                  CustomAppElevatedButton(
                    onPressed: () {
                      if (formKey.currentState!.validate()) {
                        // Perform signup logic here
                      }
                    },
                    text: "Sign up",
                  ),

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
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 55),

                            side: const BorderSide(
                              color: AppColors.borderColor,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),

                          onPressed: () {},

                          icon: Image.network(
                            "https://cdn-icons-png.flaticon.com/512/2991/2991148.png",
                            height: 22,
                          ),

                          label: const Text(""),
                        ),
                      ),

                      const SizedBox(width: 16),

                      Expanded(
                        child: OutlinedButton.icon(
                          style: OutlinedButton.styleFrom(
                            minimumSize: const Size(0, 55),

                            side: const BorderSide(
                              color: AppColors.borderColor,
                            ),

                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14),
                            ),
                          ),

                          onPressed: () {},

                          icon: const Icon(
                            Icons.apple,
                            color: Colors.white,
                            size: 26,
                          ),

                          label: const Text(""),
                        ),
                      ),
                    ],
                  ),
                  Center(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Already have an account?",
                          style: TextStyle(color: AppColors.textSecondaryColor),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          child: const Text(
                            "Log in",
                            style: TextStyle(color: AppColors.primaryColor),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 25),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
