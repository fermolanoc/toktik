import 'package:intl/intl.dart';

class HumanFormats {
  static String humanReadableNumber(int number) {
    final formatterNumber = NumberFormat.compactCurrency(
            locale: 'en_US', decimalDigits: 0, symbol: '')
        .format(number);

    return formatterNumber;
  }
}
