import 'pdf_viewer_page.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:price_report/model_pricedata.dart';

reportView(context, ModelPriceData data) async {
  final Document pdf = Document();

  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return Column(
          children: [
            Header(level: 1, text: 'Pricelist Report'),

          ]
        ); // Center
      }));
  //save PDF

  final String dir = (await getApplicationDocumentsDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path),
    ),
  );
}