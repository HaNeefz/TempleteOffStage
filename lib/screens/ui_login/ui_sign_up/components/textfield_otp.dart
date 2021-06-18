import 'package:flutter/material.dart';

// ignore: must_be_immutable
class TextFieldOTP extends StatelessWidget {
  final Function(String)? onSuccess;
  List<String>? textValues = List.filled(4, 'fill');
  TextFieldOTP({Key? key, this.onSuccess}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _textFieldOTP(context, 0, first: true, last: false),
        _textFieldOTP(context, 1, first: false, last: false),
        _textFieldOTP(context, 2, first: false, last: false),
        _textFieldOTP(context, 3, first: false, last: true),
      ],
    );
  }

  Container _textFieldOTP(context, index, {bool? first, bool? last}) {
    return Container(
      height: 85,
      child: AspectRatio(
        aspectRatio: 0.7,
        child: TextField(
          autofocus: true,
          keyboardType: TextInputType.number,
          maxLength: 1,
          textAlign: TextAlign.center,
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          onChanged: (v) {
            if (v.length == 1 && last == false) {
              FocusScope.of(context).nextFocus();
            } else if (v.length == 0 && first == false) {
              FocusScope.of(context).previousFocus();
            }
            // textValues!.insert(index, v);
            textValues![index] = v;
            if (last! && textValues!.join().length == 4) {
              onSuccess?.call(textValues!.join());
              FocusScope.of(context).unfocus();
            }
          },
          decoration: InputDecoration(
            counter: Offstage(),
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.grey, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(color: Colors.blue, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
        ),
      ),
    );
  }
}
