import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macrox_app/core/router/app_routes.dart';
import 'package:macrox_app/features/auth/presentation/pages/login_page.dart';
import 'package:macrox_app/features/auth/presentation/pages/signup_page.dart';
import 'package:macrox_app/features/food/presentation/pages/add_food_page.dart';
import 'package:macrox_app/features/home/presentation/pages/homepage.dart';
import 'package:macrox_app/features/onboarding/presentation/pages/onboarding_page_one.dart';
import 'package:macrox_app/features/onboarding/presentation/pages/onboarding_page_two.dart';
import 'package:macrox_app/features/profile/presentation/pages/basic_information_screen.dart';
import 'package:macrox_app/features/profile/presentation/pages/body_details_screen.dart';
import 'package:macrox_app/features/profile/presentation/pages/goal_activity_screen.dart';
import 'package:macrox_app/features/profile/presentation/pages/profile_page.dart';
import 'package:macrox_app/features/progress/presentation/pages/progress_page.dart';
import 'package:macrox_app/features/shell/presentation/pages/main_shell.dart';
import 'package:macrox_app/features/splash/presentation/pages/splash_screen.dart';

final GlobalKey<NavigatorState> rootNavigatorKey = GlobalKey<NavigatorState>();

final GoRouter appRouter = GoRouter(
  navigatorKey: rootNavigatorKey,
  initialLocation: AppRoutes.splash,
  routes: [
    GoRoute(
      path: AppRoutes.splash,
      builder: (context, state) => const SplashScreen(),
    ),
    GoRoute(
      path: AppRoutes.onboarding,
      builder: (context, state) => const OnboardingPageOne(),
    ),
    GoRoute(
      path: AppRoutes.onboardingTwo,
      builder: (context, state) => const OnboardingPageTwo(),
    ),
    GoRoute(
      path: AppRoutes.login,
      builder: (context, state) => const LoginPage(),
    ),
    GoRoute(
      path: AppRoutes.signup,
      builder: (context, state) => const SignupPage(),
    ),
    GoRoute(
      path: AppRoutes.basicInfo,
      builder: (context, state) => const BasicInformationPage(),
    ),
    GoRoute(
      path: AppRoutes.bodyDetails,
      builder: (context, state) => const BodyDetailsScreen(),
    ),
    GoRoute(
      path: AppRoutes.goalActivity,
      builder: (context, state) => const GoalActivityScreen(),
    ),
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) {
        return MainShell(navigationShell: navigationShell);
      },
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.home,
              builder: (context, state) => const Homepage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.food,
              builder: (context, state) => const AddFoodPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.progress,
              builder: (context, state) => const ProgressPage(),
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: AppRoutes.profile,
              builder: (context, state) => const ProfilePage(),
            ),
          ],
        ),
      ],
    ),
  ],
);
