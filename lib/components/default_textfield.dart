import 'package:flutter/material.dart';

class DefaultTextField extends StatelessWidget {
  final String? label;
  final String? prefixText;
  final TextEditingController? controller;
  const DefaultTextField({
    Key? key,
    this.controller,
    this.label,
    this.prefixText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
            prefixText: prefixText,
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
            labelText: label ?? "",
            labelStyle: TextStyle(fontSize: 14)),
      ),
    );
  }
}
