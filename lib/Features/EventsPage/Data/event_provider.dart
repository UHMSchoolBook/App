import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_people/Features/EventsPage/Domain/events.dart';
final eventProvider = StateNotifierProvider<EventService, List<Event>>((ref) {
  return EventService(FirebaseFirestore.instance);
});

class EventService extends StateNotifier<List<Event>> {
  final FirebaseFirestore _firestore;

  EventService(this._firestore) : super([]);

  Stream<List<Event>> getEvents(DateTime start, DateTime end) {
    return _firestore
        .collection('events')
        .where('date', isGreaterThanOrEqualTo: start)
        .where('date', isLessThanOrEqualTo: end)
        .snapshots()
        .map((snapshot) => snapshot.docs
        .map((doc) => Event.fromJson(doc.data() as Map<String, dynamic>))
        .toList());
  }

  Future<Map<DateTime, List<Event>>> getEventsForMonth(DateTime month) async {
    final firstDay = DateTime(month.year, month.month, 1);
    final lastDay = DateTime(month.year, month.month + 1, 0);

    final snapshot = await _firestore
        .collection('events')
        .where('date', isGreaterThanOrEqualTo: firstDay)
        .where('date', isLessThanOrEqualTo: lastDay)
        .get();

    Map<DateTime, List<Event>> events = {};
    for (var doc in snapshot.docs) {
      final event = Event.fromJson(doc.data() as Map<String, dynamic>);
      final day = DateTime.utc(event.date.year, event.date.month, event.date.day);
      if (!events.containsKey(day)) {
        events[day] = [];
      }
      events[day]!.add(event);
    }
    return events;
  }

  Future<void> addEvent(Event event) {
    return _firestore.collection('events').add(event.toJson());
  }

  Future<void> updateEvent(String id, Event event) {
    return _firestore.collection('events').doc(id).update(event.toJson());
  }

  Future<void> deleteEvent(String id) {
    return _firestore.collection('events').doc(id).delete();
  }
}