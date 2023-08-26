import 'package:flutter/material.dart';

class InterestRows extends StatelessWidget {
  final String label;

  const InterestRows({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
      child: Chip(
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
        backgroundColor: Colors.blue,
      ),
    );
  }
}
