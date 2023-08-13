import 'package:cloud_firestore/cloud_firestore.dart';

class ConvertTime {
  static String convertTime(Timestamp time) {
    DateTime dateTime = time.toDate();
    String date = dateTime.day.toString();
    String month = dateTime.month.toString();
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString();
    String minute = dateTime.minute.toString();
    String second = dateTime.second.toString();
    return "$hour:$minute";
  }

  static String convertDate(Timestamp time) {
    DateTime dateTime = time.toDate();
    String date = dateTime.day.toString();
    String month = dateTime.month.toString();
    String year = dateTime.year.toString();
    String hour = dateTime.hour.toString();
    String minute = dateTime.minute.toString();
    String second = dateTime.second.toString();
    return "$date-$month-$year";
  }
}
