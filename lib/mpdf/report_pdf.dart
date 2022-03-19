import '../lang/mlocalization.dart';
import 'pdf_viewer_page.dart';
import 'package:pdf/pdf.dart';
import 'dart:io';
import 'package:pdf/widgets.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter/material.dart' as material;
import 'package:price_report/model_pricedata.dart';
import 'package:price_report/helper/helper_formula.dart';

reportView(context, ModelPriceData data, String languageCode) async {
  final Document pdf = Document();
  MLocalizations lang = MLocalizations(material.Locale(languageCode));

  // jika ada keterangan muncul, jika tidak ada, maka field/tempat keterangannya hilang
  _ket(String key, String value) {
    if(value.isNotEmpty) {
      return key+": "+value;
    } else {
      return "";
    }
  }

  _val(String value) {
    if(value.isNotEmpty) {
      return value;
    } else {
      return "-";
    }
  }

  pdf.addPage(Page(
      pageFormat: PdfPageFormat.a4,
      build: (Context context) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,

          children: [
            Header(level: 0, text: '${lang.x("Pricelist Report")}'),
            Text("${lang.x("Nomor")}: ${_val(data.nomor)}"),
            Text("${lang.x("Tanggal")}: ${_val(data.tanggal)}"),
            Text("${lang.x("Nama PT")}: ${_val(data.namaPT)}"),
            Text("${lang.x("NPWP")}: ${_val(data.npwp)}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("${lang.x("PIC User")}: ${_val(data.picUser)}"),
            Text("${lang.x("PIC Position")}: ${_val(data.picPosition)}"),
            Text("${lang.x("Contact")}: ${_val(data.contact)}"),
            Text("${lang.x("Email")}: ${_val(data.email)}"),
            Text("${lang.x("Billing PIC")}: ${_val(data.billingPic)}"),
            Text("${lang.x("Billing Address")}: ${_val(data.billingAddress)}"),
            Text("${lang.x("Billing Contact")}: ${_val(data.billingContact)}"),
            Text("${lang.x("Billing Email")}: ${_val(data.billingEmail)}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("${lang.x("Total Employee")}e: ${currencyFormat(data.totalEmployee, noPrefix: true)}"),
            Text("${lang.x("Diskon Employee")}: ${discountFormat(data.diskonEmployee)}"),
            Text("${lang.x("Total Harga")}: ${currencyFormat(data.allEmployeePrice)}"),
            Text("${lang.x("Harga Per-karyawan")}: ${currencyFormat(data.pricePerEmployee)}"),
            Text("${lang.x("Harga Setelah Diskon")}: ${currencyFormat(data.afterDiscEmployee)}"),
            Text("${_ket(lang.x("Keterangan 1")!, data.ket1)}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("${lang.x("Harga Training")}: ${currencyFormat(data.hargaTraining)}"),
            Text("${lang.x("Diskon Training")}: ${discountFormat(data.diskonTraining)}"),
            Text("${lang.x("Harga Setelah Diskon")}: ${currencyFormat(data.afterDiscTraining)}"),
            Text("${_ket(lang.x("Keterangan 2")!, data.ket2)}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("${lang.x("Harga Implementasi")}: ${currencyFormat(data.hargaImplementasi)}"),
            Text("${lang.x("Diskon Implementasi")}: ${discountFormat(data.diskonImplementasi)}"),
            Text("${lang.x("Harga Setelah Diskon")}: ${currencyFormat(data.afterDiscImplementasi)}"),
            Text("${_ket(lang.x("Keterangan 3")!, data.ket3)}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("${lang.x("Harga Modifikasi")}: ${currencyFormat(data.hargaModifikasi)}"),
            Text("${lang.x("Diskon Modifikasi")}: ${discountFormat(data.diskonModifikasi)}"),
            Text("${lang.x("Harga Setelah Diskon")}: ${currencyFormat(data.afterDiscModifikasi)}"),
            Text("${_ket(lang.x("Keterangan 4")!, data.ket4)}"),

            Padding(padding: const EdgeInsets.all(10)),
            Text("${lang.x("Email Sales")}: ${_val(data.emailSales)}"),
          ]
        ); // Center
      }));

  //save PDF
  final String dir = (await getTemporaryDirectory()).path;
  final String path = '$dir/report.pdf';
  final File file = File(path);
  var tes = await pdf.save();
  await file.writeAsBytes(tes);
  material.Navigator.of(context).push(
    material.MaterialPageRoute(
      builder: (_) => PdfViewerPage(path: path, data: data, languageCode: languageCode),
    ),
  );
}