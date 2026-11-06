import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_radius.dart';
import 'package:macrox_app/core/theme/app_spacing.dart';
import 'package:macrox_app/core/theme/app_typography.dart';

class AddFoodPage extends StatelessWidget {
  const AddFoodPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.md,
            AppSpacing.screenHorizontal,
            24,
          ),
          children: [
            Text('Add Food', style: AppTypography.textTheme.headlineLarge),
            const SizedBox(height: AppSpacing.lg),
            TextField(
              style: AppTypography.textTheme.bodyLarge,
              decoration: InputDecoration(
                hintText: 'Search for food...',
                hintStyle: AppTypography.textTheme.bodyMedium?.copyWith(
                  color: AppColors.textSecondaryColor,
                ),
                prefixIcon: const Icon(
                  Icons.search_rounded,
                  color: AppColors.textSecondaryColor,
                ),
                filled: true,
                fillColor: AppColors.cardBackgroundColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(AppRadius.radiusMd),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Quick Add', style: AppTypography.textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            const Row(
              children: [
                Expanded(
                  child: _QuickAddCard(emoji: '🥚', label: 'Egg'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _QuickAddCard(emoji: '🍗', label: 'Chicken'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _QuickAddCard(emoji: '🍚', label: 'Rice'),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: _QuickAddCard(emoji: '🥛', label: 'Milk'),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.xl),
            Text('Recent', style: AppTypography.textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            const _RecentFoodTile(
              emoji: '🍗',
              title: 'Chicken Breast',
              subtitle: 'Grilled • 100 g',
              kcal: 165,
            ),
            const _RecentFoodTile(
              emoji: '🥣',
              title: 'Oats',
              subtitle: 'Cooked • 1 cup',
              kcal: 150,
            ),
            const _RecentFoodTile(
              emoji: '🍌',
              title: 'Banana',
              subtitle: 'Medium • 1 pc',
              kcal: 105,
            ),
            const SizedBox(height: AppSpacing.lg),
            SizedBox(
              height: 52,
              child: OutlinedButton(
                onPressed: () {},
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.borderColor),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppRadius.radiusMd),
                  ),
                ),
                child: Text(
                  'View All Foods',
                  style: AppTypography.textTheme.titleMedium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _QuickAddCard extends StatelessWidget {
  const _QuickAddCard({required this.emoji, required this.label});

  final String emoji;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.radiusMd),
      ),
      child: Column(
        children: [
          Text(emoji, style: const TextStyle(fontSize: 26)),
          const SizedBox(height: 8),
          Text(label, style: AppTypography.textTheme.labelMedium),
        ],
      ),
    );
  }
}

class _RecentFoodTile extends StatelessWidget {
  const _RecentFoodTile({
    required this.emoji,
    required this.title,
    required this.subtitle,
    required this.kcal,
  });

  final String emoji;
  final String title;
  final String subtitle;
  final int kcal;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(14),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.radiusMd),
      ),
      child: Row(
        children: [
          Container(
            height: 46,
            width: 46,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(emoji, style: const TextStyle(fontSize: 22)),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title, style: AppTypography.textTheme.titleMedium),
                const SizedBox(height: 4),
                Text(
                  subtitle,
                  style: AppTypography.textTheme.bodySmall?.copyWith(
                    color: AppColors.textSecondaryColor,
                  ),
                ),
              ],
            ),
          ),
          Text(
            '$kcal kcal',
            style: AppTypography.textTheme.bodySmall?.copyWith(
              color: AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
