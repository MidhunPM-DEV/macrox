import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:macrox_app/core/router/app_routes.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_radius.dart';
import 'package:macrox_app/core/theme/app_spacing.dart';
import 'package:macrox_app/core/theme/app_typography.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundColor,
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.go(AppRoutes.food),
        backgroundColor: AppColors.primaryColor,
        shape: const CircleBorder(),
        child: const Icon(Icons.add, color: Colors.black, size: 28),
      ),
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.fromLTRB(
            AppSpacing.screenHorizontal,
            AppSpacing.md,
            AppSpacing.screenHorizontal,
            100,
          ),
          children: [
            Row(
              children: [
                Expanded(
                  child: Text.rich(
                    TextSpan(
                      children: [
                        TextSpan(
                          text: 'Good Morning, Midhun ',
                          style: AppTypography.textTheme.headlineMedium,
                        ),
                        const TextSpan(
                          text: '👋',
                          style: TextStyle(fontSize: 20),
                        ),
                      ],
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.notifications_none_rounded,
                    color: AppColors.textColor,
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.cardBackgroundColor,
                borderRadius: BorderRadius.circular(AppRadius.radiusLg),
              ),
              child: Column(
                children: [
                  Text(
                    'Calories',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: AppSpacing.md),
                  const SizedBox(
                    width: 168,
                    height: 168,
                    child: _CalorieRing(progress: 1850 / 2400),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Row(
              children: [
                Text('Macros', style: AppTypography.textTheme.headlineSmall),
                const Spacer(),
                GestureDetector(
                  onTap: () => context.go(AppRoutes.progress),
                  child: Text(
                    'See details  >',
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: AppSpacing.md),
            const _MacroRow(
              label: 'Protein',
              current: 120,
              goal: 180,
              color: AppColors.protein,
            ),
            const _MacroRow(
              label: 'Carbs',
              current: 180,
              goal: 250,
              color: AppColors.carbs,
            ),
            const _MacroRow(
              label: 'Fat',
              current: 48,
              goal: 70,
              color: AppColors.fat,
            ),
            const _MacroRow(
              label: 'Fiber',
              current: 18,
              goal: 30,
              color: AppColors.fiber,
            ),
            const SizedBox(height: AppSpacing.lg),
            Text("Today's Meals", style: AppTypography.textTheme.headlineSmall),
            const SizedBox(height: AppSpacing.md),
            const _MealTile(
              icon: Icons.wb_sunny_outlined,
              title: 'Breakfast',
              kcal: 450,
            ),
            const _MealTile(
              icon: Icons.lunch_dining_outlined,
              title: 'Lunch',
              kcal: 620,
            ),
            const _MealTile(
              icon: Icons.nights_stay_outlined,
              title: 'Dinner',
              kcal: 0,
              empty: true,
            ),
          ],
        ),
      ),
    );
  }
}

class _CalorieRing extends StatelessWidget {
  const _CalorieRing({required this.progress});

  final double progress;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: _RingPainter(progress.clamp(0, 1)),
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              '1,850',
              style: AppTypography.textTheme.displaySmall?.copyWith(
                fontWeight: FontWeight.w700,
              ),
            ),
            Text(
              '/ 2,400 kcal',
              style: AppTypography.textTheme.bodySmall?.copyWith(
                color: AppColors.textSecondaryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _RingPainter extends CustomPainter {
  _RingPainter(this.progress);

  final double progress;

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width / 2 - 10;
    final track = Paint()
      ..color = AppColors.borderColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;
    final fill = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 12
      ..strokeCap = StrokeCap.round;

    canvas.drawCircle(center, radius, track);
    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -1.57,
      6.2832 * progress,
      false,
      fill,
    );
  }

  @override
  bool shouldRepaint(covariant _RingPainter oldDelegate) {
    return oldDelegate.progress != progress;
  }
}

class _MacroRow extends StatelessWidget {
  const _MacroRow({
    required this.label,
    required this.current,
    required this.goal,
    required this.color,
  });

  final String label;
  final int current;
  final int goal;
  final Color color;

  @override
  Widget build(BuildContext context) {
    final value = current / goal;
    return Padding(
      padding: const EdgeInsets.only(bottom: 14),
      child: Column(
        children: [
          Row(
            children: [
              Text(label, style: AppTypography.textTheme.bodyMedium),
              const Spacer(),
              Text(
                '$current / $goal g',
                style: AppTypography.textTheme.bodySmall?.copyWith(
                  color: AppColors.textSecondaryColor,
                ),
              ),
            ],
          ),
          const SizedBox(height: 8),
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: LinearProgressIndicator(
              value: value.clamp(0, 1),
              minHeight: 8,
              backgroundColor: AppColors.surfaceColor,
              valueColor: AlwaysStoppedAnimation(color),
            ),
          ),
        ],
      ),
    );
  }
}

class _MealTile extends StatelessWidget {
  const _MealTile({
    required this.icon,
    required this.title,
    required this.kcal,
    this.empty = false,
  });

  final IconData icon;
  final String title;
  final int kcal;
  final bool empty;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: AppColors.cardBackgroundColor,
        borderRadius: BorderRadius.circular(AppRadius.radiusMd),
      ),
      child: Row(
        children: [
          Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: AppColors.surfaceColor,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Icon(icon, color: AppColors.primaryColor, size: 20),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Text(title, style: AppTypography.textTheme.titleMedium),
          ),
          Text(
            empty ? 'Add food' : '$kcal kcal',
            style: AppTypography.textTheme.bodySmall?.copyWith(
              color: empty ? AppColors.primaryColor : AppColors.textSecondaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
