import 'package:flutter/material.dart';

class DialogUtils {
  static void showCustomDialog(BuildContext context, List<Map<String, StepState>> notFinishForm,
      {@required Function onSubmit}) {

    String notFinish = "";
    notFinishForm.forEach((element) {
      notFinish = "${notFinish}✗ ${element.keys.single}\n";
    });

    showDialog(
        context: context,
        builder: (_) {
          return Dialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(4.0)),
            child: Container(
              padding: EdgeInsets.all(16),
              child:
              Column(mainAxisSize: MainAxisSize.min, children: <Widget>[
                Column(children: [
                  Container(
                    alignment: Alignment.centerLeft,
                    child: Text("INFO")
                  ),
                  Padding(padding: EdgeInsets.symmetric(vertical: 8), child:Text("Please recheck form before generate PDF! Make sure all section fill out:\n\n${notFinish}")),
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    Padding(
                        padding: EdgeInsets.only(right: 8),
                        child: ElevatedButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(Colors.grey)),
                            child: Text("Cancel"))),
                    ElevatedButton(
                        onPressed: () {
                          onSubmit();
                        },
                        child: Text("Generate PDF"))
                  ]),
                ])
              ]),
            ),
          );
        });
  }
}
