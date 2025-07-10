import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    super.key,
    required this.label,
    required this.value,
    required this.icon,
    required this.onTap,
  });

  final String label;
  final String value;
  final IconData icon;
  final VoidCallback onTap;

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
        readOnly: true,
        onTap: onTap,
        controller: TextEditingController(text: value),
        decoration: InputDecoration(
          labelText: label,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
          contentPadding: EdgeInsets.all(
            MediaQuery.of(context).size.height * 0.016,
          ),
        ),
        validator: (val) {
          if (val == null || val.isEmpty) {
            return 'Please select $label';
          }
          return null;
        },
      ),
    );
  }
}
