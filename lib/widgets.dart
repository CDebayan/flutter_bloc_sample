import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class EditTextField extends StatelessWidget {
  final String hint;
  final TextEditingController controller;
  final String errorText;
  final ValueChanged<String> onChanged;

  EditTextField({this.hint, this.controller, this.errorText, this.onChanged});

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      onChanged: onChanged,
      decoration: InputDecoration(hintText: hint, errorText: errorText),
    );
  }
}

class Button extends StatelessWidget {
  final String text;
  final Function() onPressed;

  Button({this.text, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.blue,
      child: Text(
        text,
        style: TextStyle(color: Colors.white),
      ),
      onPressed: onPressed,
    );
  }
}

showToast({@required String message}) {
  Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_SHORT,
    gravity: ToastGravity.BOTTOM,
  );
}
