import 'package:intl/intl.dart';

class DateTimeHelper {
  static const String dd_mm_yy = "dd/MM/yyyy";

  static String formatDate(String temps, DateTime dateTime) {
    return DateFormat(temps).format(dateTime);
  }
}