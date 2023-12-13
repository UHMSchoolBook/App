import 'dart:collection';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:table_calendar/table_calendar.dart';
import 'package:connect_people/Features/EventsPage/Data/event_provider.dart';
import 'package:connect_people/Features/EventsPage/Presentation/eventitem.dart';
import 'package:connect_people/Features/EventsPage/Presentation/addevent.dart';
import 'package:connect_people/Features/EventsPage/Presentation/editevent.dart';
import 'package:connect_people/Features/EventsPage/Domain/events.dart';

class EventsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: EventCalendar(),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _navigateToAddEvent(context, ref),
        child: const Icon(Icons.add),
      ),
    );
  }

  void _navigateToAddEvent(BuildContext context, WidgetRef ref) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => AddEvent(onEventAdded: () => ref.refresh(eventProvider)),
      ),
    );
    if (result ?? false) {
      ref.refresh(eventProvider); // Refresh events list
    }
  }
}

class EventCalendar extends StatefulWidget {
  @override
  _EventCalendarState createState() => _EventCalendarState();
}

class _EventCalendarState extends State<EventCalendar> {
  late DateTime _focusedDay;
  late DateTime _selectedDay;

  @override
  void initState() {
    super.initState();
    _focusedDay = DateTime.now();
    _selectedDay = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer(
      builder: (context, ref, _) {
        // Accessing EventService instance
        final eventService = ref.read(eventProvider.notifier);

        return FutureBuilder<Map<DateTime, List<Event>>>(
          future: eventService.getEventsForMonth(_focusedDay),
          builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              }

              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }

              final events = snapshot.data ?? {};

              return Column(
                children: [
                  TableCalendar<Event>(
                  firstDay: DateTime.utc(2010, 10, 16),
                  lastDay: DateTime.utc(2030, 3, 14),
                  focusedDay: _focusedDay,
                  selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                  onDaySelected: (selectedDay, focusedDay) {
                    setState(() {
                      _selectedDay = selectedDay;
                      _focusedDay = focusedDay;
                    });
                  },
                    eventLoader: (day) => events[day] ?? [],
                    calendarStyle: const CalendarStyle(
                    weekendTextStyle: TextStyle(
                    color: Colors.red,
                ),
                selectedDecoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  color: Colors.red,
                ),
              ),
              calendarBuilders: CalendarBuilders(
                headerTitleBuilder: (context, day) {
                  return Container(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(day.toString()),
                  );
                },
              ),
              // ... other properties ...
            ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: events[_selectedDay]?.length ?? 0,
                      itemBuilder: (context, index) {
                        final event = events[_selectedDay]![index];
                        return EventItem(
                          event: event,
                          onDelete: () => eventService.deleteEvent(event.id),
                          onTap: () => _navigateToEditEvent(context, event, ref),
                        );
                      },
                    ),
                  ),
                ],
              );
            },
          );
        },
    );
  }

  void _navigateToEditEvent(BuildContext context, Event event, WidgetRef ref) async {
    final result = await Navigator.push<bool>(
      context,
      MaterialPageRoute(
        builder: (_) => EditEvent(
          event: event,
          onEventEdited: () => ref.refresh(eventProvider),
        ),
      ),
    );
    if (result ?? false) {
      ref.refresh(eventProvider); // Refresh events list
    }
  }
}