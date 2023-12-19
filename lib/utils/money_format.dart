import 'package:intl/intl.dart';

class MoneyFormat {
  static String convertToIdr(double number) {
    NumberFormat currencyFormat = NumberFormat.currency(
      locale: 'id',
      symbol: 'Rp.',
      decimalDigits: 0,
    );
    return currencyFormat.format(number);
  }
}
