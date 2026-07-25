import 'package:flutter/material.dart';

class CustomAppElevatedButton extends StatelessWidget {
  final String text;
  final VoidCallback? onPressed;
  const CustomAppElevatedButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 50,
      child: ElevatedButton(onPressed: onPressed, child: Text(text)),
    );
  }
}
