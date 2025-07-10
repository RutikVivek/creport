// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

class BuildInputFieldWithMaxlines extends StatelessWidget {
  BuildInputFieldWithMaxlines({
    super.key,
    required this.controller,
    required this.icon,
    required this.maxLines,
    required this.validatorMsg,
    required this.label,
  });

  String label;
  TextEditingController controller;
  IconData icon;
  String validatorMsg;
  int maxLines;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.012,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(16),
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
