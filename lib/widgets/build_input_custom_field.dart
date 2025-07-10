import 'package:flutter/material.dart';

class BuildInputCustomField extends StatelessWidget {
  const BuildInputCustomField({
    super.key,
    required this.icon,
    required this.controller,
    required this.label,
    required this.hasCertification,
  });

  final String label;
  final TextEditingController controller;
  final IconData icon;
  final String? hasCertification;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
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
          if (hasCertification == "yes" && (value == null || value.isEmpty)) {
            return 'Please enter $label';
          }
          return null;
        },
      ),
    );
  }
}


