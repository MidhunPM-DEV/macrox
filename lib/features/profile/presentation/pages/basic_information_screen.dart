import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macrox_app/core/router/app_routes.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_textfield.dart';

class BasicInformationPage extends StatefulWidget {
  const BasicInformationPage({super.key});

  @override
  State<BasicInformationPage> createState() => _BasicInformationPageState();
}

class _BasicInformationPageState extends State<BasicInformationPage> {
  final _formKey = GlobalKey<FormState>();

  final _nameController = TextEditingController();
  final _ageController = TextEditingController();

  String _selectedGender = "Male";

  @override
  void dispose() {
    _nameController.dispose();
    _ageController.dispose();
    super.dispose();
  }

  Widget _genderButton(String gender) {
    final isSelected = _selectedGender == gender;

    return Expanded(
      child: GestureDetector(
        onTap: () {
          setState(() {
            _selectedGender = gender;
          });
        },
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 300),
          height: 48,
          decoration: BoxDecoration(
            color: isSelected ? AppColors.primaryColor : AppColors.surfaceColor,
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isSelected ? Colors.transparent : AppColors.borderColor,
            ),
          ),
          alignment: Alignment.center,
          child: Text(
            gender,
            style: TextStyle(
              color: isSelected ? Colors.black : Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ),
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
                        onPressed: () {
                          if (context.canPop()) {
                            context.pop();
                          } else {
                            context.go(AppRoutes.login);
                          }
                        },
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
                            value: .33,
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
                        "1/3",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),

                  const SizedBox(height: 40),

                  const Text(
                    "Basic Information",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  const SizedBox(height: 6),

                  const Text(
                    "Tell us a bit about yourself",
                    style: TextStyle(
                      color: AppColors.textSecondaryColor,
                      fontSize: 15,
                    ),
                  ),

                  const SizedBox(height: 30),

                  CustomTextField(
                    controller: _nameController,
                    hintText: "Full Name",
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your name";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 18),

                  CustomTextField(
                    controller: _ageController,
                    hintText: "Age",
                    keyboardType: TextInputType.number,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Please enter your age";
                      }
                      return null;
                    },
                  ),

                  const SizedBox(height: 24),

                  const Text(
                    "Gender",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),

                  const SizedBox(height: 14),

                  Row(
                    children: [
                      _genderButton("Male"),
                      const SizedBox(width: 10),
                      _genderButton("Female"),
                      const SizedBox(width: 10),
                      _genderButton("Other"),
                    ],
                  ),

                  const SizedBox(height: 150),

                  CustomAppElevatedButton(
                    text: "Next",
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        context.push(AppRoutes.bodyDetails);
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
