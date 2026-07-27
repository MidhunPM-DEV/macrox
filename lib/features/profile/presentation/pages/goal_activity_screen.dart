import 'package:flutter/material.dart';
import 'package:macrox_app/core/theme/app_colors.dart';

class GoalActivityScreen extends StatefulWidget {
  const GoalActivityScreen({super.key});

  @override
  State<GoalActivityScreen> createState() => _GoalActivityScreenState();
}

class _GoalActivityScreenState extends State<GoalActivityScreen> {
  String selectedGoal = "Maintain Weight";
  String selectedActivity = "Moderate";

  final List<Map<String, dynamic>> goals = [
    {
      "title": "Lose Weight",
      "subtitle": "Create a calorie deficit",
      "icon": Icons.monitor_weight_outlined,
    },
    {
      "title": "Maintain Weight",
      "subtitle": "Stay healthy and strong",
      "icon": Icons.favorite_outline,
    },
    {
      "title": "Gain Weight",
      "subtitle": "Build muscle and size",
      "icon": Icons.fitness_center_outlined,
    },
  ];

  final List<String> activityLevels = [
    "Sedentary",
    "Light",
    "Moderate",
    "Active",
    "Very Active",
  ];

  @override
  Widget build(BuildContext context) {
    const background = Color(0xff0E1116);
    const surface = Color(0xff1A1F28);
    const primary = Color(0xff9BE15D);
    const secondary = Color(0xff8C939D);

    return Scaffold(
      backgroundColor: background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// Header
              Row(
                children: [
                  IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new_rounded,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: const LinearProgressIndicator(
                        value: 1,
                        minHeight: 6,
                        backgroundColor: surface,
                        valueColor: AlwaysStoppedAnimation(
                          AppColors.primaryColor,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  const Text(
                    "3/3",
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 35),

              const Text(
                "Goal & Activity",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 6),

              const Text(
                "What's your goal?",
                style: TextStyle(color: secondary, fontSize: 15),
              ),

              const SizedBox(height: 24),

              /// Goal Cards
              ...goals.map((goal) {
                final selected = selectedGoal == goal["title"];

                return GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedGoal = goal["title"];
                    });
                  },
                  child: AnimatedContainer(
                    duration: const Duration(milliseconds: 250),
                    margin: const EdgeInsets.only(bottom: 14),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: selected
                          ? const Color.fromARGB(102, 120, 246, 9)
                          : surface,
                      borderRadius: BorderRadius.circular(16),
                      border: Border.all(
                        color: selected
                            ? const Color.fromARGB(255, 120, 246, 9)
                            : Colors.transparent,
                        width: 1.5,
                      ),
                    ),
                    child: Row(
                      children: [
                        Icon(goal["icon"], color: Colors.white),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                goal["title"],
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                goal["subtitle"],
                                style: TextStyle(
                                  color: selected ? Colors.black87 : secondary,
                                  fontSize: 13,
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (selected)
                          const Icon(Icons.check_circle, color: Colors.white),
                      ],
                    ),
                  ),
                );
              }),

              const SizedBox(height: 25),

              const Text(
                "Activity Level",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                  fontSize: 16,
                ),
              ),

              const SizedBox(height: 12),

              DropdownButtonFormField<String>(
                initialValue: selectedActivity,
                dropdownColor: surface,
                decoration: InputDecoration(
                  filled: true,
                  fillColor: surface,
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(14),
                    borderSide: BorderSide.none,
                  ),
                ),
                style: const TextStyle(color: Colors.white),
                iconEnabledColor: Colors.white,
                items: activityLevels
                    .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                    .toList(),
                onChanged: (value) {
                  setState(() {
                    selectedActivity = value!;
                  });
                },
              ),

              const Spacer(),

              SizedBox(
                width: double.infinity,
                height: 56,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primaryColor,
                    foregroundColor: Colors.black,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                  ),
                  onPressed: () {
                    debugPrint(selectedGoal);
                    debugPrint(selectedActivity);

                    // Save to Firestore
                    // Calculate macros
                    // Navigate to Home
                  },
                  child: const Text(
                    "Calculate My Macros",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
