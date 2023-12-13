import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/EventsPage/Domain/events.dart';
import 'package:connect_people/Features/EventsPage/Data/event_provider.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';

class AddEvent extends ConsumerWidget {
  final VoidCallback onEventAdded;

  const AddEvent({Key? key, required this.onEventAdded}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Add Event")),
      body: EventForm(
        onSubmit: (Event event) {
          ref.read(eventProvider.notifier).addEvent(event).then((_) {
            onEventAdded(); // Invoke callback after adding event
            Navigator.pop(context, true);
          });
        },
      ),
    );
  }
}

class EventForm extends ConsumerStatefulWidget {
  final void Function(Event) onSubmit;

  const EventForm({Key? key, required this.onSubmit}) : super(key: key);

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends ConsumerState<EventForm> {// Change to ConsumerState
  final _titleController = TextEditingController();
  final _descController = TextEditingController();
  DateTime _selectedDate = DateTime.now();
  final _dateController = TextEditingController();

  @override
  Widget build(BuildContext context) {
     // Use ref instead of context

    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        TextFormField(
          controller: _dateController,
          decoration: const InputDecoration(
            labelText: 'Date',
            border: OutlineInputBorder(),
          ),
          readOnly: true, // Make it read-only
          onTap: () async {
            DateTime? pickedDate = await showDatePicker(
              context: context,
              initialDate: _selectedDate,
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365)),
            );
            if (pickedDate != null && pickedDate != _selectedDate) {
              setState(() {
                _selectedDate = pickedDate;
                _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate); // Format the date as you need
              });
            }
          },
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _titleController,
          decoration: const InputDecoration(
            labelText: 'Title',
            border: OutlineInputBorder(),
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: _descController,
          decoration: const InputDecoration(
            labelText: 'Description',
            border: OutlineInputBorder(),
          ),
          maxLines: 5,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text("Save"),
        ),
      ],
    );
  }

  void _submitForm() {
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    final event = Event(
      title: _titleController.text,
      description: _descController.text,
      date: _selectedDate,
      id: DateTime.now().millisecondsSinceEpoch.toString(),
      student_id: currentUserID,
    );

    ref.read(eventProvider.notifier).addEvent(event).then((_) {
      // Trigger a state update or re-fetch events here
      ref.refresh(eventProvider);
    });

    Navigator.pop(context);
  }
}