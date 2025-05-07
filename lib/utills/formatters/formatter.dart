import 'package:intl/intl.dart';

class TFormatter {
  static String formaDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-mm-yyyy').format(date);
  }

  static String formatCurancy(double ammount) {
    return NumberFormat.currency(locale: 'eu_us', symbol: '\$').format(ammount);
  }

  static String formatPhoneNumber(String phoneNUmber) {
    if (phoneNUmber.length == 10) {
      return '(${phoneNUmber.substring(0, 3)} ${phoneNUmber.substring(3, 6)} ${phoneNUmber.substring(6)}';
    } else if (phoneNUmber.length == 11) {
      return '(${phoneNUmber.substring(0, 4)} ${phoneNUmber.substring(4, 7)} ${phoneNUmber.substring(7)}';
    }
    return phoneNUmber;
  }

  static String internationalFormatPhoneNumber(String phoneNumber) {
    var digetsOnly = phoneNumber.replaceAll(RegExp(r'\D'), "");
    String countryCood = '+${digetsOnly.substring(0, 2)}';
    digetsOnly = digetsOnly.substring(2);
    final formattedNumber = StringBuffer();
    formattedNumber.write('($countryCood)');
    int i = 0;
    while (i < digetsOnly.length) {
      int groupLenth = 2;
      if (i == 0 && countryCood == '+1') {
        groupLenth = 3;
      }
      int end = i + groupLenth;
      formattedNumber.write(digetsOnly.substring(i, end));
      if (end < digetsOnly.length) {
        formattedNumber.write('');
      }
      i = end;
    }
    return formattedNumber.toString();
  }
}
