import 'package:intl/intl.dart';

class DateRangeFormat{

  static String formatDateRange(String startDate, String endDate) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    String startDay = DateFormat('d').format(start);
    String startMonth = DateFormat('MMM').format(start);
    String endDay = DateFormat('d').format(end);
    String endMonth = DateFormat('MMM').format(end);
    if (startMonth == endMonth) {
      return "$startMonth $startDay-$endDay";
    } else {
      return "$startMonth $startDay-$endMonth $endDay ";
    }
  }

  static int dateRangeCount(String startDate, String endDate) {
    DateTime start = DateTime.parse(startDate);
    DateTime end = DateTime.parse(endDate);
    return end.difference(start).inDays + 1; // +1 to include both start and end dates
  }

}