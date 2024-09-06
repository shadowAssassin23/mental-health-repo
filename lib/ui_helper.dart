import 'package:flutter/material.dart';

class Uihelper {
  static customTextField(TextEditingController controller, String text,
      IconData icondata, bool toHide) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: TextField(
          controller: controller,
          obscureText: toHide,
          decoration: InputDecoration(
            hintText: text,
            suffixIcon: Icon(icondata),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25),
            ),
          ),
        ),
      ),
    );
  }

  static customButtom(VoidCallback voidCallback, String text) {
    return SizedBox(
        height: 50,
        width: 200,
        child: ElevatedButton(
          onPressed: () {
            voidCallback();
          },
          child: Text(text,
              style: const TextStyle(
                fontSize: 20,
              )),
        ));
  }

  static customAlertBox(BuildContext context, String text) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(text),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("Ok")),
          ],
        );
      },
    );
  }
}
