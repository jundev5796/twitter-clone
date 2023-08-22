import 'package:flutter/material.dart';

class AuthButton extends StatelessWidget {
  final String text;

  const AuthButton({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(text),
    );
  }
}
