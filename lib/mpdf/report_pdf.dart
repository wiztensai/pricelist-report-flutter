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
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Header(level: 0, text: 'Pricelist Report'),
            Text("Nomor: ${data.nomor}"),
            Text("Tanggal: ${data.tanggal}"),
            Text("Nama PT: ${data.namaPT}"),
            Text("NPWP: ${data.npwp}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("PIC User: ${data.picUser}"),
            Text("PIC Position: ${data.picPosition}"),
            Text("Contact: ${data.contact}"),
            Text("Email: ${data.email}"),
            Text("Billing PIC: ${data.billingPic}"),
            Text("Billing Address: ${data.billingAddress}"),
            Text("Billing Contact: ${data.billingContact}"),
            Text("Billing Email: ${data.billingEmail}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("Total Employee: ${data.totalEmployee}"),
            Text("Diskon Employee: ${data.diskonEmployee}"),
            Text("Keterangan 1: ${data.ket1}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("Harga Training: ${data.hargaTraining}"),
            Text("Diskon Training: ${data.diskonTraining}"),
            Text("Keterangan 2: ${data.ket2}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("Harga Implementasi: ${data.hargaImplementasi}"),
            Text("Diskon Implementasi: ${data.diskonImplementasi}"),
            Text("Keterangan 3: ${data.ket3}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("Harga Modifikasi: ${data.hargaModifikasi}"),
            Text("Diskon Modifikasi: ${data.diskonModifikasi}"),
            Text("Keterangan 4: ${data.ket4}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("Email Sales: ${data.emailSales}"),
          ]
        ); // Center
      }));

  //save PDF
  final String dir = (await getTemporaryDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  await file.writeAsBytes(pdf.save());
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path, data: data),
    ),
  );
}