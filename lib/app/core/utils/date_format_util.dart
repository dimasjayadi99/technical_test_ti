import 'package:intl/intl.dart';

String formatTime(String dateTime) {
  try {
    final parsedDate = DateTime.parse(dateTime);

    final formattedTime = DateFormat("HH:mm:ss").format(parsedDate);

    return formattedTime;
  } catch (e) {
    return "Waktu tidak valid";
  }
}
