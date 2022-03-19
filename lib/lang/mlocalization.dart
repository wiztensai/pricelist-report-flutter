import 'dart:ui';

class MLocalizations {

  MLocalizations(this.locale);

  final Locale locale;

  static Map<String, Map<String, String>> _localizedValues = {
    'en': {
      'Pricelist Report' : 'Pricelist Report',
      'Nomor': 'Number',
      'Tanggal': 'Date',
      'Nama PT': 'Company Name',
      'NPWP': 'NPWP',

      'PIC User': 'PIC User',
      'PIC Position': 'PIC Position',
      'Contact': 'Contact',
      'Email': 'Email',
      'Billing PIC': 'Billing PIC',
      'Billing Address': 'Billing Address',
      'Billing Contact': 'Billing Contact',
      'Billing Email': 'Billing Email',

      'Total Employee': 'Total Employee',
      'Diskon Employee': 'Discount',
      'Total Harga': 'Total Price',
      'Harga Per-karyawan': 'Price per-Employee',
      'Harga Setelah Diskon': 'Price after Discount',
      'Keterangan 1': 'Keterangan 1',

      'Harga Training': 'Training Price',
      'Diskon Training': 'Discount',
      'Harga Setelah Diskon': 'Price after Discount',
      'Keterangan 2': 'Keterangan 2',

      'Harga Implementasi': 'Implementation Price',
      'Diskon Implementasi': 'Discount',
      'Harga Setelah Diskon': 'Price after Discount',
      'Keterangan 3': 'Keterangan 3',

      'Harga Modifikasi': 'Modification Price',
      'Diskon Modifikasi': 'Discount',
      'Harga Setelah Diskon': 'Price after Discount',
      'Keterangan 4': 'Keterangan 4',

      'Email Sales': 'Email Sales',
    },
    'id': {
      'Pricelist Report' : 'Laporan Daftar Harga',
      'Nomor': 'Nomor',
      'Tanggal': 'Tanggal',
      'Nama PT': 'Nama PT',
      'NPWP': 'NPWP',

      'PIC User': 'Nama PIC',
      'PIC Position': 'Posisi PIC',
      'Contact': 'Kontak',
      'Email': 'Email',
      'Billing PIC': 'PIC Penagihan',
      'Billing Address': 'Alamat Penagihan',
      'Billing Contact': 'Kontak Penagihan',
      'Billing Email': 'Email Penagihan',

      'Total Employee': 'Total Karyawan',
      'Diskon Employee': 'Diskon',
      'Total Harga': 'Total Harga',
      'Harga Per-karyawan': 'Harga per-Karyawan',
      'Harga Setelah Diskon': 'Harga Setelah Diskon',
      'Keterangan 1': 'Keterangan 1',

      'Harga Training': 'Harga Training',
      'Diskon Training': 'Diskon Training',
      'Harga Setelah Diskon': 'Harga Setelah Diskon',
      'Keterangan 2': 'Keterangan 2',

      'Harga Implementasi': 'Harga Implementasi',
      'Diskon Implementasi': 'Diskon Implementasi',
      'Harga Setelah Diskon': 'Harga Setelah Diskon',
      'Keterangan 3': 'Keterangan 3',

      'Harga Modifikasi': 'Harga Modifikasi',
      'Diskon Modifikasi': 'Diskon Modifikasi',
      'Harga Setelah Diskon': 'Harga Setelah Diskon',
      'Keterangan 4': 'Keterangan 4',

      'Email Sales': 'Email Sales',
    }
  };

  String? x(key) {
    return _localizedValues[locale.languageCode]![key];
  }
}