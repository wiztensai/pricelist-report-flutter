import 'package:flutter/material.dart';
import 'package:flutter_full_pdf_viewer/full_pdf_viewer_scaffold.dart';
import 'package:flutter_email_sender/flutter_email_sender.dart';
import 'package:price_report/model_pricedata.dart';

class PdfViewerPage extends StatelessWidget {
  final String path;
  final ModelPriceData data;
  const PdfViewerPage({Key key, this.path, this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    sendEmail() async {
      final Email email = Email(
        subject: 'Pricelist Report - ${data.namaPT}',
        recipients: [data.emailSales],
        attachmentPaths: [path],
        isHTML: false,
      );

      await FlutterEmailSender.send(email);
    }
    return PDFViewerScaffold(
      appBar: AppBar(
        title: Text("PDF Viewer"),
        leading: BackButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        actions: <Widget>[
          ElevatedButton(
              onPressed: (){
                sendEmail();
              },
              style: ElevatedButton.styleFrom(shadowColor: Colors.transparent),
              child: Text("SEND EMAIL"))
        ],
      ),
      path: path,
    );
  }
}