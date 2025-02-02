import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:kulon/src/core/core.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:time/time.dart';

import '../../widgets/analog_clock_widget.dart';
import '../../widgets/widgets.dart';

class DashboardPage extends StatelessWidget {
  const DashboardPage({super.key});

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    return ListView(
      padding: EdgeInsets.fromLTRB(16, 20, 16, 0),
      children: [
        Card(
          elevation: 0,
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '01 - S1 Informatika - Reguler B2 - 0001234 - Mata Kuliah A - A-01',
                  style: Theme.of(context).textTheme.headlineSmall,
                ),
                SizedBox(height: 2),
                Text(
                  'Dashboard / My Course / 01 - S1 Informatika - Reguler B2 - 0001234 - Mata Kuliah A - A-01',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 16),
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                children: [
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'My Course',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Divider(),
                          SizedBox(height: 8),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Container(height: 1, color: Colors.grey),
                            itemBuilder: (context, index) {
                              return ListTile(
                                trailing: Text(
                                  'PRESENSI',
                                  style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue),
                                ),
                                title: Row(
                                  children: [
                                    Badge(
                                      label: Text('3'),
                                      backgroundColor: Colors.blue,
                                      child: Icon(Icons.notifications),
                                    ),
                                    SizedBox(width: 6),
                                    Badge(
                                      label: Text('3'),
                                      backgroundColor: Colors.green,
                                      child: Icon(Icons.assignment),
                                    ),
                                    SizedBox(width: 20),
                                    Flexible(
                                        child:
                                            Text('01 - S1 Informatika - Reguler B2 - 0001234 - Mata Kuliah A - A-01')),
                                  ],
                                ),
                                onTap: () {},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 16),
                  Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Latest Informations',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: 4),
                          Divider(),
                          SizedBox(height: 8),
                          ListView.separated(
                            shrinkWrap: true,
                            itemCount: 5,
                            physics: NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) => Container(height: 1, color: Colors.grey),
                            itemBuilder: (context, index) {
                              return ListTile(
                                leading: Badge(
                                  backgroundColor: Colors.blue,
                                  child: Icon(Icons.info),
                                ),
                                title: Text(
                                  'Enim consectetur in cupidatat cillum minim nisi labore ut. Irure minim voluptate anim Lorem in fugiat sint ad non reprehenderit est duis ipsum. Tempor adipisicing nulla incididunt duis velit commodo duis qui. Culpa labore dolore commodo mollit pariatur in ex sit cupidatat reprehenderit. Aliquip in ipsum labore excepteur.',
                                  maxLines: 3,
                                  overflow: TextOverflow.ellipsis,
                                ),
                                subtitle: Text('Asari Neo. ${DateTime.now().bestDateTimeFormat}.'),
                                onTap: () {},
                              );
                            },
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(width: 16),
            Column(
              children: [
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: 300,
                    child: AnalogClockWidget(),
                  ),
                ),
                SizedBox(height: 16),
                Card(
                  child: Container(
                    padding: EdgeInsets.all(16),
                    width: 300,
                    child: CalendarWidget(
                      events: [
                        CalenderEvent(now, "Today's CalenderEvent 1", CalenderEventType.holiday),
                        CalenderEvent(now, "Today's CalenderEvent 5", CalenderEventType.holiday),
                        CalenderEvent(now, "Today's CalenderEvent 4", CalenderEventType.holiday),
                        CalenderEvent(now, "Today's CalenderEvent 2", CalenderEventType.assignmentOpen),
                        CalenderEvent(now, "Today's CalenderEvent 3", CalenderEventType.assignmentClosed),
                        CalenderEvent(now, "Today's CalenderEvent 3", CalenderEventType.other),
                        CalenderEvent(now + 1.days, "Today's CalenderEvent 2", CalenderEventType.assignmentOpen),
                        CalenderEvent(now + 1.days, "Today's CalenderEvent 4", CalenderEventType.assignmentOpen),
                        CalenderEvent(now + 4.days, "Today's CalenderEvent 3", CalenderEventType.assignmentClosed),
                        CalenderEvent(now + 4.days, "Today's CalenderEvent 1", CalenderEventType.other),
                        CalenderEvent(now + 4.days, "Today's CalenderEvent 3", CalenderEventType.assignmentClosed),
                        CalenderEvent(now + 4.days, "Today's CalenderEvent 3", CalenderEventType.assignmentClosed),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
        SizedBox(height: 40)
      ],
    );
  }
}
