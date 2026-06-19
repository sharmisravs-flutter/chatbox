import 'package:intl/intl.dart';

class Dateformats {
  static String formatChatTime(String date) {
    final dateTime = DateTime.parse(date);
    final now = DateTime.now();

    if (now.year == dateTime.year &&
        now.month == dateTime.month &&
        now.day == dateTime.day) {
      return DateFormat('h:mm a').format(dateTime);
    }

    final yesterday = now.subtract(const Duration(days: 1));

    if (yesterday.year == dateTime.year &&
        yesterday.month == dateTime.month &&
        yesterday.day == dateTime.day) {
      return 'Yesterday';
    }

    if (now.difference(dateTime).inDays < 7) {
      return DateFormat('EEE').format(dateTime);
    }

    return DateFormat('dd MMM').format(dateTime);
  }
}
