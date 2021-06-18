import 'package:flutter/material.dart';

class DefaultButton extends StatelessWidget {
  final String? text;
  final Color foregroundColor;
  final Color backgroundColor;
  final Function? onPressed;
  const DefaultButton({
    Key? key,
    this.onPressed,
    this.text,
    this.foregroundColor = Colors.white,
    this.backgroundColor = Colors.blue,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 0.8,
      height: 50,
      child: ElevatedButton(
        child: Text(
          text ?? '',
          // style: TextStyle(color: Colors.white),
        ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(
              onPressed == null ? Colors.grey : backgroundColor),
          foregroundColor: MaterialStateProperty.all<Color>(foregroundColor),
          shape: MaterialStateProperty.all<RoundedRectangleBorder>(
            RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
        onPressed: onPressed != null ? () => onPressed?.call() : null,
      ),
    );
  }
}
