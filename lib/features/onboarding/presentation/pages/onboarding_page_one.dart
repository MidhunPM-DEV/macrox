import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_spacing.dart';
import 'package:macrox_app/core/theme/app_typography.dart';
import 'package:macrox_app/features/onboarding/presentation/pages/onboarding_page_two.dart';
import 'package:macrox_app/features/onboarding/widgets/custom_app_elevated_button.dart';

class OnboardingPageOne extends StatelessWidget {
  const OnboardingPageOne({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: Stack(
          children: [
            /// Food Image
            Positioned(
              right: -20,
              bottom: 10,
              child: Image.asset(
                'assets/images/onboardimage1.png',
                width: 320,
                fit: BoxFit.contain,
              ),
            ),

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

                  Text(
                    "Track.",
                    style: AppTypography.textTheme.displayLarge!.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    "Fuel.",
                    style: AppTypography.textTheme.displayLarge!.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                    ),
                  ),

                  Text(
                    "Progress.",
                    style: AppTypography.textTheme.displayLarge!.copyWith(
                      fontSize: 40,
                      fontWeight: FontWeight.w700,
                      color: AppColors.primaryColor,
                    ),
                  ),

                  const SizedBox(height: AppSpacing.lg),

                  SizedBox(
                    width: 220,
                    child: Text(
                      "Simple nutrition tracking to fuel your goals and see real progress.",
                      style: AppTypography.textTheme.titleMedium?.copyWith(
                        color: AppColors.textSecondaryColor,
                        height: 1.5,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
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
                      text: "Next",
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const OnboardingPageTwo(),
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
