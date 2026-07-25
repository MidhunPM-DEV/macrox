import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_spacing.dart';
import 'package:macrox_app/core/theme/app_typography.dart';
import 'package:macrox_app/features/auth/presentation/pages/login_page.dart';
import 'package:macrox_app/features/onboarding/presentation/widgets/feature_file.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';

class OnboardingPageTwo extends StatelessWidget {
  const OnboardingPageTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            /// Content
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: AppSpacing.xl,
                vertical: AppSpacing.xxl,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Spacer(),

                  Text.rich(
                    TextSpan(
                      style: AppTypography.textTheme.displayLarge!.copyWith(
                        fontSize: 40,
                        fontWeight: FontWeight.w700,
                      ),
                      children: [
                        const TextSpan(text: "Everything\nin "),
                        TextSpan(
                          text: "balance.",
                          style: TextStyle(
                            color: AppColors.primaryColor, // Your green color
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  SizedBox(
                    width: 220,
                    child: Text(
                      "Trust your macros,stay\nconsistent and achieve\nypur best self.",
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        color: AppColors.textSecondaryColor,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),

                  const Spacer(),
                  Column(
                    children: const [
                      FeatureTile(
                        icon: Icons.local_fire_department_rounded,
                        title: "Track Calories",
                      ),
                      SizedBox(height: 18),
                      FeatureTile(
                        icon: Icons.gps_fixed_rounded,
                        title: "Hit Your Macros",
                      ),
                      SizedBox(height: 18),
                      FeatureTile(
                        icon: Icons.bar_chart_rounded,
                        title: "See Progress",
                      ),
                    ],
                  ),
                  const Spacer(),

                  /// Indicator
                  Row(
                    children: [
                      _indicator(true),
                      const SizedBox(width: 8),
                      _indicator(false),
                      const SizedBox(width: 8),
                      _indicator(false),
                    ],
                  ),

                  const SizedBox(height: AppSpacing.xl),

                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: CustomAppElevatedButton(
                      text: "Get Started",
                      onPressed: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LoginPage(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _indicator(bool active) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 250),
      width: active ? 26 : 8,
      height: 8,
      decoration: BoxDecoration(
        color: active ? AppColors.primaryColor : AppColors.dividerColor,
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }
}
