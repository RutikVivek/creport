import 'package:flutter/material.dart';

class CustomDropDown extends StatelessWidget {
  final String labelText;
  final String hintText;
  final List<String> items;
  final String? value;
  final void Function(String?) onChanged;
  final IconData icon;

  const CustomDropDown({
    super.key,
    required this.labelText,
    required this.hintText,
    required this.items,
    required this.onChanged,
    required this.icon,
    this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: MediaQuery.of(context).size.height * 0.012,
        vertical: MediaQuery.of(context).size.height * 0.04,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(
          MediaQuery.of(context).size.height * 0.012,
        ),
        boxShadow: [
          BoxShadow(color: Colors.black12, blurRadius: 8, offset: Offset(2, 2)),
        ],
      ),
      child: DropdownButtonFormField<String>(
        value: value,
        decoration: InputDecoration(
          labelText: labelText,
          prefixIcon: Icon(icon),
          border: InputBorder.none,
        ),
        hint: Text(hintText),
        items: items
            .map((item) => DropdownMenuItem(value: item, child: Text(item)))
            .toList(),
        onChanged: onChanged,
        validator: (value) {
          if (value == null || value.isEmpty) {
            return "Please select $labelText";
          }
          return null;
        },
      ),
    );
  }
}
