import 'package:intl/intl.dart';

class AppHelpers {
  static String dayMonthYearFormat(DateTime date) {
    return DateFormat('dd MMMM yyyy').format(date);
  }

  static String monthYearFormat(DateTime date) {
    return DateFormat('MMMM yyyy').format(date);
  }

  static String databaseDateFormat(DateTime date) {
    return DateFormat('yyyy-MM-dd').format(date);
  }
}
