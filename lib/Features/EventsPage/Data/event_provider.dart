import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:connect_people/Features/EventsPage/Domain/events.dart';
import 'package:intl/intl.dart';
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
    final lastDay = DateTime(month.year, month.month + 1, 1).subtract(Duration(days: 1));

    // Convert firstDay and lastDay to Timestamp format
    final firstDayTimestamp = Timestamp.fromDate(firstDay);
    final lastDayTimestamp = Timestamp.fromDate(lastDay);

    print("First day of month: $firstDay");
    print("Last day of month: $lastDay");

    final snapshot = await _firestore
        .collection('events')
        .where('date', isGreaterThanOrEqualTo: firstDayTimestamp)
        .where('date', isLessThanOrEqualTo: lastDayTimestamp)
        .get();

    print("Snapshot data: ${snapshot.docs.map((doc) => doc.data()).toList()}");

    Map<DateTime, List<Event>> events = {};
    for (var doc in snapshot.docs) {
      var data = doc.data() as Map<String, dynamic>;

      // The Event.fromJson method will automatically convert the Timestamp to DateTime
      final event = Event.fromJson(data);

      final day = DateTime.utc(event.date.year, event.date.month, event.date.day);
      print("Event: ${event.title}, Date: ${event.date}, Day: $day");

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

  Future<void> updateEvent(String id, Event event) async {
    print("Updating event with ID: $id");

    var querySnapshot = await _firestore
        .collection('events')
        .where('id', isEqualTo: id)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var docId = querySnapshot.docs.first.id;
      return _firestore.collection('events').doc(docId).update(event.toJson());
    } else {
      print("No event found with ID: $id");
    }
  }

  Future<void> deleteEvent(String id) async {
    print("Deleting event with ID: $id");

    var querySnapshot = await _firestore
        .collection('events')
        .where('id', isEqualTo: id)
        .limit(1)
        .get();

    if (querySnapshot.docs.isNotEmpty) {
      var docId = querySnapshot.docs.first.id;
      return _firestore.collection('events').doc(docId).delete();
    } else {
      print("No event found with ID: $id");
    }
  }


}