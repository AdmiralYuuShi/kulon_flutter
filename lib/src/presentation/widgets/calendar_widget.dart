import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time/time.dart';

class CalendarWidget extends StatelessWidget {
  final List<CalenderEvent>? events;
  const CalendarWidget({super.key, this.events});

  @override
  Widget build(BuildContext context) {
    return TableCalendar(
      firstDay: DateTime.utc(2010, 10, 16),
      lastDay: DateTime.utc(2030, 3, 14),
      focusedDay: DateTime.now(),
      availableCalendarFormats: {CalendarFormat.month: 'Month'},
      onFormatChanged: (format) {},
      headerStyle: HeaderStyle(titleCentered: true, formatButtonVisible: false),
      calendarStyle: CalendarStyle(
        rangeHighlightColor: Colors.blue,
        todayDecoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle),
      ),
      calendarBuilders: CalendarBuilders<CalenderEvent>(
        markerBuilder: (context, day, events) {
          int holiday = 0;
          int assignmentOpen = 0;
          int assignmentClosed = 0;
          int others = 0;
          for (CalenderEvent e in events.where((d) => d.date.isAtSameDayAs(day))) {
            switch (e.type) {
              case CalenderEventType.holiday:
                holiday += 1;
                break;
              case CalenderEventType.assignmentOpen:
                assignmentOpen += 1;
                break;
              case CalenderEventType.assignmentClosed:
                assignmentClosed += 1;
                break;
              default:
                others += 1;
            }
          }
          return Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (assignmentOpen > 0) CalendarMarkerWidget(label: '$assignmentOpen', color: Colors.green),
              if (assignmentClosed > 0) CalendarMarkerWidget(label: '$assignmentClosed', color: Colors.blue),
              if (holiday > 0) CalendarMarkerWidget(label: '$holiday', color: Colors.red),
              if (others > 0) CalendarMarkerWidget(label: '$others', color: Colors.grey),
            ],
          );
        },
      ),
      startingDayOfWeek: StartingDayOfWeek.monday,
      eventLoader: (day) {
        return _getCalenderEventsForDay(day);
      },
    );
  }

  List<CalenderEvent> _getCalenderEventsForDay(DateTime day) {
    // Implementation example
    return (events ?? []).where((e) => e.date.isAtSameDayAs(day)).toList();
  }
}

enum CalenderEventType { holiday, assignmentOpen, assignmentClosed, other }

class CalendarMarkerWidget extends StatelessWidget {
  final String label;
  final Color color;
  const CalendarMarkerWidget({super.key, required this.label, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 1.5),
      color: color,
      child: Text(
        label,
        style: TextStyle(fontSize: 10),
      ),
    );
  }
}

class CalenderEvent {
  final DateTime date;
  final String title;
  final CalenderEventType type;

  const CalenderEvent(
    this.date,
    this.title,
    this.type,
  );

  @override
  String toString() => '($title, ${type.name})';
}
