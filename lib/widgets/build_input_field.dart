// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BuildinputField extends StatelessWidget {
  BuildinputField({
    super.key,
    required this.controller,
    required this.icon,
    required this.label,
    required this.validatorMsg,
    required this.maxLines,
  });
  String label;
  TextEditingController controller;
  IconData icon;
  String validatorMsg;
  int maxLines = 1;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: const [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      child: TextFormField(
        controller: controller,
        maxLines: maxLines,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.all(16),
        ),
        validator: (value) {
          if (value == null || value.isEmpty) {
            return validatorMsg;
          }
          return null;
        },
      ),
    );
  }
}
