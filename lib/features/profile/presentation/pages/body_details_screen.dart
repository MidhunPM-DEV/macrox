import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_textfield.dart';
import 'package:macrox_app/features/profile/presentation/pages/goal_activity_screen.dart';

class BodyDetailsScreen extends StatefulWidget {
  const BodyDetailsScreen({super.key});

  @override
  State<BodyDetailsScreen> createState() => _BodyDetailsScreenState();
}

class _BodyDetailsScreenState extends State<BodyDetailsScreen> {
  final _formKey = GlobalKey<FormState>();

  final _weightController = TextEditingController();
  final _heightController = TextEditingController();

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: Scaffold(
        backgroundColor: AppColors.backgroundColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 20),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// Top Row
                  Row(
                    children: [
                      IconButton(
                        onPressed: () => Navigator.pop(context),
                        icon: const Icon(
                          Icons.arrow_back_ios_new_rounded,
                          color: Colors.white,
                          size: 20,
                        ),
                      ),

                      const SizedBox(width: 8),

                      Expanded(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: .66,
                            minHeight: 6,
                            backgroundColor: AppColors.surfaceColor,
                            valueColor: const AlwaysStoppedAnimation(
                              AppColors.primaryColor,
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(width: 15),

                      const Text(
                        "2/3",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Body Details",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Help us calculate your daily needs",
                    style: TextStyle(
                      color: AppColors.textSecondaryColor,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomTextField(
                    controller: _weightController,
                    hintText: "Weight",
                    suffixIcon: const Text(
                      "kg",
                      style: TextStyle(
                        color: AppColors.textSecondaryColor,
                        fontSize: 15,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your weight";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  CustomTextField(
                    controller: _heightController,
                    hintText: "Height",
                    suffixIcon: const Text(
                      "cm",
                      style: TextStyle(
                        color: AppColors.textSecondaryColor,
                        fontSize: 15,
                      ),
                    ),
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your height";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 150),

                  CustomAppElevatedButton(
                    text: "Next",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        // Navigate to the next screen
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const GoalActivityScreen(),
                          ),
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
