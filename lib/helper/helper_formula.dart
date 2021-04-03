import 'package:intl/intl.dart';

int totalPerkaryawan(int totalKaryawan) {
  if(totalKaryawan == null) {
    totalKaryawan = 0;
  }

  if(totalKaryawan < 50) {
    return 20000;
  }

  if(totalKaryawan < 199) {
    return 18000;
  }

  if(totalKaryawan < 350) {
    return 15000;
  }

  if(totalKaryawan < 500) {
    return 8500;
  }

  if(totalKaryawan < 1000) {
    return 7000;
  }

  if(totalKaryawan >= 1000) {
    return 5500;
  }
}

int finalPrice(int firstPrice, int diskon) {
  int tempDiskon = 0;

  if(diskon == null) tempDiskon = 0; else tempDiskon = diskon;

  if(firstPrice == null) {
    return 0;
  } else {
    var finalPrice= firstPrice - (firstPrice*(tempDiskon/100.0));
    return finalPrice.toInt();
  }
}

String currencyFormat(int number) {
  if(number != null && number != 0) {
    var f = NumberFormat("#,##0").format(number);
    return "IDR. "+f.toString();
  } else {
    return "-";
  }
}

String notNull_Int(int val) {
  return val != null ? val.toString() : "";
}

int clearCurrencyFormat(value) {
  return int.parse(value.replaceAll(',', ''));
}