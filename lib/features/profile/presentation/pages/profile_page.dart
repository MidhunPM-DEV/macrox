import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macrox_app/core/router/app_routes.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_radius.dart';
import 'package:macrox_app/core/theme/app_spacing.dart';
import 'package:macrox_app/core/theme/app_typography.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.lg,
            AppSpacing.screenHorizontal,
            24,
          ),
          children: [
            Center(
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 42,
                    backgroundColor: AppColors.cardBackgroundColor,
                    child: Icon(
                      Icons.person_rounded,
                      size: 42,
                      color: AppColors.primaryColor,
                    ),
                  ),
                  const SizedBox(height: 14),
                  Text('Midhun', style: AppTypography.textTheme.headlineMedium),
                  const SizedBox(height: 4),
                  Text(
                    'midhun@gmail.com',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            _ProfileTile(
              icon: Icons.edit_outlined,
              title: 'Edit Profile',
              onTap: () => context.push(AppRoutes.basicInfo),
            ),
            _ProfileTile(
              icon: Icons.flag_outlined,
              title: 'Goals',
              onTap: () => context.push(AppRoutes.goalActivity),
            ),
            _ProfileTile(
              icon: Icons.directions_run_outlined,
              title: 'Activity Level',
              trailing: 'Moderate',
              onTap: () => context.push(AppRoutes.goalActivity),
            ),
            _ProfileTile(
              icon: Icons.settings_outlined,
              title: 'Settings',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.help_outline_rounded,
              title: 'Help & Support',
              onTap: () {},
            ),
            _ProfileTile(
              icon: Icons.info_outline_rounded,
              title: 'About MacroX',
              onTap: () {},
            ),
            const SizedBox(height: AppSpacing.lg),
            Center(
              child: TextButton(
                onPressed: () => context.go(AppRoutes.login),
                child: Text(
                  'Log Out',
                  style: AppTypography.textTheme.titleMedium?.copyWith(
                    color: AppColors.errorColor,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ProfileTile extends StatelessWidget {
  const _ProfileTile({
    required this.icon,
    required this.title,
    required this.onTap,
    this.trailing,
  });

  final IconData icon;
  final String title;
  final String? trailing;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: ListTile(
        onTap: onTap,
        tileColor: AppColors.cardBackgroundColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppRadius.radiusMd),
        ),
        leading: Icon(icon, color: AppColors.textColor),
        title: Text(title, style: AppTypography.textTheme.titleMedium),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (trailing != null)
              Padding(
                padding: const EdgeInsets.only(right: 6),
                child: Text(
                  trailing!,
                  style: AppTypography.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ),
            const Icon(
              Icons.chevron_right_rounded,
              color: AppColors.textSecondaryColor,
            ),
          ],
        ),
      ),
    );
  }
}
