import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final emailController = TextEditingController();

  final passwordController = TextEditingController();

  bool hidePassword = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                  "Welcome back",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                const Text(
                  "Log in to continue",
                  style: TextStyle(
                    color: AppColors.textSecondaryColor,
                    fontSize: 15,
                  ),
                ),

                const SizedBox(height: 100),

                TextField(
                  controller: emailController,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    hintText: "Email or Phone",
                    hintStyle: const TextStyle(
                      color: AppColors.textSecondaryColor,
                    ),

                    filled: true,
                    fillColor: AppColors.cardBackgroundColor,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 18),

                TextField(
                  controller: passwordController,

                  obscureText: hidePassword,

                  style: const TextStyle(color: Colors.white),

                  decoration: InputDecoration(
                    hintText: "Password",

                    hintStyle: const TextStyle(
                      color: AppColors.textSecondaryColor,
                    ),

                    filled: true,

                    fillColor: AppColors.cardBackgroundColor,

                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 18,
                    ),

                    suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          hidePassword = !hidePassword;
                        });
                      },

                      icon: Icon(
                        hidePassword
                            ? Icons.visibility_off_outlined
                            : Icons.visibility_outlined,
                        color: Colors.grey,
                      ),
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(14),
                      borderSide: BorderSide.none,
                    ),
                  ),
                ),

                const SizedBox(height: 10),

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

                const SizedBox(height: 50),

                CustomAppElevatedButton(onPressed: () {}, text: "Log in"),

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

                          side: const BorderSide(color: AppColors.borderColor),

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

                          side: const BorderSide(color: AppColors.borderColor),

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
                SizedBox(height: 50),
                Center(
                  child: RichText(
                    text: const TextSpan(
                      children: [
                        TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: AppColors.textSecondaryColor),
                        ),

                        TextSpan(
                          text: "Sign up",

                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),

                const SizedBox(height: 25),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
