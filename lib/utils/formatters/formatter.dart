import 'package:intl/intl.dart';

class TFormatter {

  static String formatDate(DateTime? date) {
    date ??= DateTime.now();
    return DateFormat('dd-MMM-yyyy').format(date); // Customize the date format as needed.
  }

  static String formatCurrency(double amount) {
    return NumberFormat.currency(locale: 'en_US', symbol: '\$').format(amount);
  }

  /// Formats a US 10-digit phone number into `(123) 456-7890` format.
  static String formatPhoneNumber(String phoneNumber) {
    phoneNumber = phoneNumber.replaceAll(RegExp(r'\D'), '');

    if (phoneNumber.length == 10) {
      return '(${phoneNumber.substring(0, 3)}) ${phoneNumber.substring(3, 6)}-${phoneNumber.substring(6)}';
    } else if (phoneNumber.length == 11) {
      return '+${phoneNumber[0]} (${phoneNumber.substring(1, 4)}) ${phoneNumber.substring(4, 7)}-${phoneNumber.substring(7)}';
    }
    // Return the original phone number if it doesn't match expected lengths.
    return phoneNumber;
  }

  /// Formats an international phone number by keeping only the digits.
  /// This method assumes input can contain non-digit characters.
  static String internationalFormatPhoneNumber(String phoneNumber) {
    // Remove any non-digit characters.
    var digitsOnly = phoneNumber.replaceAll(RegExp(r'\D'), '');
    return digitsOnly;
  }
}
