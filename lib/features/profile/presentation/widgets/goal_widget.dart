import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';
import 'package:macrox_app/features/profile/domain/models/goal_model.dart';

class GoalCard extends StatelessWidget {
  final GoalModel goal;
  final bool selected;
  final VoidCallback onTap;

  const GoalCard({
    super.key,
    required this.goal,
    required this.selected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(16),
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 250),
        margin: const EdgeInsets.only(bottom: 14),
        padding: const EdgeInsets.all(18),
        decoration: BoxDecoration(
          color: selected ? AppColors.primaryColor : AppColors.surfaceColor,
          borderRadius: BorderRadius.circular(16),
          border: Border.all(
            color: selected ? AppColors.primaryColor : Colors.transparent,
            width: 1.5,
          ),
        ),
        child: Row(
          children: [
            Icon(goal.icon, color: selected ? Colors.black : Colors.white),

            const SizedBox(width: 16),

            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    goal.title,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: selected ? Colors.black : Colors.white,
                    ),
                  ),

                  const SizedBox(height: 4),

                  Text(
                    goal.subtitle,
                    style: TextStyle(
                      color: selected
                          ? Colors.black87
                          : AppColors.textSecondaryColor,
                    ),
                  ),
                ],
              ),
            ),

            AnimatedSwitcher(
              duration: const Duration(milliseconds: 200),
              child: selected
                  ? const Icon(Icons.check_circle, color: Colors.white)
                  : const SizedBox(),
            ),
          ],
        ),
      ),
    );
  }
}
