import 'package:intl/intl.dart';

class DateTimeUtils {
  /// Convert UI date (e.g. "Aug 24, 2025") to API format ("2025-08-24")
  static String toApiDate(String date) {
    try {
      final parsed = DateFormat('MMM d, yyyy').parse(date);
      return DateFormat('yyyy-MM-dd').format(parsed);
    } catch (e) {
      return date; // fallback if parsing fails
    }
  }

  /// Convert UI time (e.g. "8:30 PM") to API format ("20:30:00")
  static String toApiTime(String time) {
    try {
      final parsed = DateFormat('h:mm a').parse(time);
      return DateFormat('HH:mm:ss').format(parsed);
    } catch (e) {
      return time;
    }
  }

  /// Convert API date ("2025-08-24") to UI format ("Aug 24, 2025")
  static String toUiDate(String apiDate) {
    try {
      final parsed = DateTime.parse(apiDate);
      return DateFormat('MMM d, yyyy').format(parsed);
    } catch (e) {
      return apiDate;
    }
  }

  /// Convert API time ("20:30:00") to UI format ("8:30 PM")
  static String toUiTime(String apiTime) {
    try {
      final parsed = DateFormat('HH:mm:ss').parse(apiTime);
      return DateFormat('h:mm a').format(parsed);
    } catch (e) {
      return apiTime;
    }
  }
}
