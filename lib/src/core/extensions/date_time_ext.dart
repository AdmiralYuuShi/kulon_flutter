import 'package:intl/intl.dart';

extension DateTimeExt on DateTime {
  String get bestDateFormat => DateFormat('EEEE, dd MMMM y').format(this);
  String get bestDateTimeFormat => DateFormat('dd MMM y, HH:mm:ss').format(this);
}
