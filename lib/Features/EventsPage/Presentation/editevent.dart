import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:connect_people/Features/EventsPage/Data/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/EventsPage/Domain/events.dart';
import 'package:connect_people/Features/EventsPage/Data/event_provider.dart';
class EditEvent extends ConsumerWidget {
  final Event event;

  const EditEvent({Key? key, required this.event}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(title: const Text("Edit Event")),
      body: EventForm(
        event: event,
        onSubmit: (updatedEvent) {
          ref.read(eventProvider.notifier).updateEvent(event.id, updatedEvent);
          Navigator.pop(context, true);
        },
      ),
    );
  }
}

class EventForm extends StatefulWidget {
  final Event event;
  final void Function(Event) onSubmit;

  const EventForm({Key? key, required this.event, required this.onSubmit}) : super(key: key);

  @override
  _EventFormState createState() => _EventFormState();
}

class _EventFormState extends State<EventForm> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  late DateTime _selectedDate;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.event.title);
    _descController = TextEditingController(text: widget.event.description);
    _selectedDate = widget.event.date;
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16.0),
      children: [
        InputDatePickerFormField(
          firstDate: DateTime.now().subtract(const Duration(days: 365)), // Fixed firstDate
          lastDate: DateTime.now().add(const Duration(days: 365)), // Fixed lastDate
          initialDate: _selectedDate,
          onDateSubmitted: (date) {
            setState(() {
              _selectedDate = date;
            });
          },
        ),
        TextField(
          controller: _titleController,
          maxLines: 1,
          decoration: const InputDecoration(labelText: 'title'),
        ),
        TextField(
          controller: _descController,
          maxLines: 5,
          decoration: const InputDecoration(labelText: 'description'),
        ),
        ElevatedButton(
          onPressed: _submitForm,
          child: const Text("Save"),
        ),
      ],
    );
  }

  void _submitForm() {
    final updatedEvent = widget.event.copyWith(
      title: _titleController.text,
      description: _descController.text,
      date: _selectedDate,
    );
    widget.onSubmit(updatedEvent);
  }
}