import 'package:flutter/services.dart';
import 'package:intl/intl.dart';

class DiscountInputFormatter extends TextInputFormatter {
  // DiscountInputFormatter({this.maxNumbers});
  final int maxNumbers = 100;

  TextEditingValue formatEditUpdate(TextEditingValue oldValue, TextEditingValue newValue) {

    if (newValue.selection.baseOffset == 0) {
      return newValue;
    }

    // tidak bisa masuk angka 0
    if (int.parse(newValue.text) == 0) {
      return oldValue;
    }

    // limit to 100%
    if (int.parse(newValue.text) > maxNumbers) {
      return oldValue;
    }

    return oldValue; // todo: SEMENTARA. BUGFIX, ini yang error
  }
}