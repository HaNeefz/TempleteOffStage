import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

// ignore: must_be_immutable
class DefaultTextField extends StatelessWidget {
  final Color? bgColor;
  final Color borderColor;
  final TextEditingController? controller;
  final bool secure;
  final String hint;
  final String? label;
  final String? prefixText;
  final bool next;
  final FocusNode? currentFocus;
  final FocusNode? nextFocus;
  final TextInputType keyboard;
  int? maxLenght;
  bool med;
  bool bold;
  final List<TextInputFormatter>? inputFormatter;
  TextCapitalization textCapitalization;

  DefaultTextField({
    this.bgColor,
    this.borderColor = Colors.purple,
    this.controller,
    this.secure = false,
    this.hint = "",
    this.next = true,
    this.med = false,
    this.bold = false,
    this.currentFocus,
    this.maxLenght,
    this.nextFocus,
    this.inputFormatter,
    this.keyboard = TextInputType.text,
    this.textCapitalization = TextCapitalization.none,
    this.prefixText,
    this.label,
  });

  @override
  Widget build(BuildContext context) {
    TextStyle styleNormal = Theme.of(context).textTheme.subtitle1!.copyWith(
          fontWeight: bold
              ? FontWeight.w700
              : med
                  ? FontWeight.w500
                  : FontWeight.w300,
        );
    TextStyle styleHint = Theme.of(context).textTheme.caption!.copyWith(
        fontWeight: bold
            ? FontWeight.w700
            : med
                ? FontWeight.w500
                : FontWeight.w300,
        color: Colors.grey[800]);
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      child: TextField(
        focusNode: currentFocus,
        controller: controller,
        textInputAction: next ? TextInputAction.next : TextInputAction.done,
        obscureText: secure,
        keyboardType: keyboard,
        maxLength: maxLenght,
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.blue),
            borderRadius: BorderRadius.circular(10),
          ),
          labelText: label,
          labelStyle: styleHint,
          hintText: hint,
          hintStyle: styleHint,
          prefixText: prefixText,
          prefixStyle: styleNormal,
          contentPadding: EdgeInsets.all(10),
          counterText: '',
        ),
        onSubmitted: (s) {
          if (currentFocus != null && nextFocus != null)
            _fieldFocusChange(context, currentFocus!, nextFocus!);
        },
        textCapitalization: textCapitalization,
        inputFormatters: inputFormatter,
        style: styleNormal,
      ),
    );
  }

//  inputFormatter: ValidatorInputFormatter(
//  editingValidator: EmailEditingRegexValidator(),
//  ),

  _fieldFocusChange(
      BuildContext context, FocusNode currentFocus, FocusNode nextFocus) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }
}
