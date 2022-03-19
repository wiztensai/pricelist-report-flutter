import 'package:flutter/material.dart';

class DialogUtils {
  static void showCustomDialog(
      BuildContext context, List<Map<String, StepState>> notFinishForm,
      {required Function onSubmit(String langCode)}) {
    String message =
        "Please recheck form before generate PDF! Make sure all section fill out:\n\n";
    notFinishForm.forEach((element) {
      message = "${message}✗ ${element.keys.single}\n";
    });

    if (notFinishForm.isEmpty) {
      message =
          "Congratulation, all section fill out! You can generate PDF now.\n\n";
    }

    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.all(16),
              child: Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Column(children: [
                  Container(
                      alignment: Alignment.centerLeft, child: Text("INFO", style: TextStyle(fontWeight: FontWeight.bold),)),
                  Padding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      child: Text(message)),
                  Column(mainAxisAlignment: MainAxisAlignment.end, children: [
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            onSubmit('id');
                          },
                          child: Text("Generate PDF ID")),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            onSubmit('en');
                          },
                          child: Text("Generate PDF EN")),
                    ),
                    SizedBox(
                      width: 200,
                      child: ElevatedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          style: ButtonStyle(
                              backgroundColor:
                                  MaterialStateProperty.all(Colors.grey)),
                          child: Text("Cancel")),
                    ),
                  ]),
                ])
              ]),
            ),
          );
        });
  }
}
