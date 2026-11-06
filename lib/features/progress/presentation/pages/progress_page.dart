import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/core/theme/app_radius.dart';
import 'package:macrox_app/core/theme/app_spacing.dart';
import 'package:macrox_app/core/theme/app_typography.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({super.key});

  static const _weightPoints = [72.0, 71.6, 71.2, 71.4, 70.8, 70.4, 70.0];
  static const _calorieBars = [2100, 1680, 1920, 1760, 2040, 1580, 1850];
  static const _days = ['M', 'T', 'W', 'T', 'F', 'S', 'S'];

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
            Text('Progress', style: AppTypography.textTheme.headlineLarge),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.cardBackgroundColor,
                borderRadius: BorderRadius.circular(AppRadius.radiusLg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Weight',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(
                        '70.0 kg',
                        style: AppTypography.textTheme.headlineLarge,
                      ),
                      const Spacer(),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 10,
                          vertical: 6,
                        ),
                        decoration: BoxDecoration(
                          color: AppColors.primaryColor.withValues(alpha: 0.15),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: Text(
                          '↓ 0.8 kg',
                          style: AppTypography.textTheme.labelMedium?.copyWith(
                            color: AppColors.primaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: CustomPaint(
                      painter: _LineChartPainter(_weightPoints),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      _ChartLabel('25 May'),
                      _ChartLabel('27 May'),
                      _ChartLabel('3 Jun'),
                      _ChartLabel('10 Jun'),
                      _ChartLabel('Today'),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppSpacing.lg),
            Container(
              padding: const EdgeInsets.all(AppSpacing.lg),
              decoration: BoxDecoration(
                color: AppColors.cardBackgroundColor,
                borderRadius: BorderRadius.circular(AppRadius.radiusLg),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Calories',
                    style: AppTypography.textTheme.bodyMedium?.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Weekly Average',
                    style: AppTypography.textTheme.bodySmall?.copyWith(
                      color: AppColors.textSecondaryColor,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '1,850 kcal',
                    style: AppTypography.textTheme.headlineLarge,
                  ),
                  const SizedBox(height: AppSpacing.lg),
                  SizedBox(
                    height: 140,
                    width: double.infinity,
                    child: CustomPaint(painter: _BarChartPainter(_calorieBars)),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      for (final day in _days)
                        Expanded(
                          child: Text(
                            day,
                            textAlign: TextAlign.center,
                            style: AppTypography.textTheme.labelSmall?.copyWith(
                              color: AppColors.textSecondaryColor,
                            ),
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _ChartLabel extends StatelessWidget {
  const _ChartLabel(this.text);

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppTypography.textTheme.labelSmall?.copyWith(
        color: AppColors.textSecondaryColor,
      ),
    );
  }
}

class _LineChartPainter extends CustomPainter {
  _LineChartPainter(this.points);

  final List<double> points;

  @override
  void paint(Canvas canvas, Size size) {
    if (points.isEmpty) return;

    final minY = points.reduce((a, b) => a < b ? a : b) - 0.4;
    final maxY = points.reduce((a, b) => a > b ? a : b) + 0.4;
    final dx = size.width / (points.length - 1);

    Offset toOffset(int i, double value) {
      final x = dx * i;
      final y = size.height - ((value - minY) / (maxY - minY)) * size.height;
      return Offset(x, y);
    }

    final path = Path()..moveTo(toOffset(0, points[0]).dx, toOffset(0, points[0]).dy);
    for (var i = 1; i < points.length; i++) {
      path.lineTo(toOffset(i, points[i]).dx, toOffset(i, points[i]).dy);
    }

    final line = Paint()
      ..color = AppColors.primaryColor
      ..style = PaintingStyle.stroke
      ..strokeWidth = 2.4
      ..strokeCap = StrokeCap.round
      ..strokeJoin = StrokeJoin.round;

    canvas.drawPath(path, line);

    final dot = Paint()..color = AppColors.primaryColor;
    final core = Paint()..color = AppColors.cardBackgroundColor;
    for (var i = 0; i < points.length; i++) {
      final offset = toOffset(i, points[i]);
      canvas.drawCircle(offset, 5, dot);
      canvas.drawCircle(offset, 2.4, core);
    }
  }

  @override
  bool shouldRepaint(covariant _LineChartPainter oldDelegate) => false;
}

class _BarChartPainter extends CustomPainter {
  _BarChartPainter(this.values);

  final List<int> values;

  @override
  void paint(Canvas canvas, Size size) {
    final max = values.reduce((a, b) => a > b ? a : b).toDouble();
    final slot = size.width / values.length;
    const barWidth = 14.0;

    for (var i = 0; i < values.length; i++) {
      final height = (values[i] / max) * size.height;
      final left = slot * i + (slot - barWidth) / 2;
      final rect = RRect.fromLTRBR(
        left,
        size.height - height,
        left + barWidth,
        size.height,
        const Radius.circular(6),
      );
      final paint = Paint()
        ..color = i == values.length - 1
            ? AppColors.primaryColor
            : AppColors.primaryColor.withValues(alpha: 0.35);
      canvas.drawRRect(rect, paint);
    }
  }

  @override
  bool shouldRepaint(covariant _BarChartPainter oldDelegate) => false;
}
