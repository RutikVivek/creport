import 'package:flutter/material.dart';

class BuildInputFileWithKeyboardtype extends StatelessWidget {
  const BuildInputFileWithKeyboardtype({
    super.key,
    required this.label,
    required this.controller,
    required this.icon,
    required this.keyboardType,
    required this.validatorMsg,
    required this.maxLines,
  });

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final String validatorMsg;
  final TextInputType keyboardType;
  final int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
