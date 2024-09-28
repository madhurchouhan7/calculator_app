import 'package:flutter/material.dart';

class CalculatorButton extends StatelessWidget {
  final String label;
  final Color color;
  final VoidCallback onTap;

  const CalculatorButton({
    Key? key,
    required this.label,
    required this.color,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0), // Add padding around the button
      child: InkWell(
        highlightColor: Colors.grey[800],
        borderRadius: BorderRadius.circular(10),
        onTap: onTap,
        child: Container(
          width: 70,
          height: 65,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(30),
          ),
          child: Center(
            child: Text(
              label,
              style: const TextStyle(
                fontSize: 30,
              ),
            ),
          ),
        ),
      ),
    );
  }
}