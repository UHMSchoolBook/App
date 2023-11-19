import 'package:flutter/material.dart';

import 'package:connect_people/Features/EventsPage/Domain/events.dart';
import 'package:connect_people/Features/EventsPage/Data/event_provider.dart';

class EventItem extends StatelessWidget {
  final Event event;
  final VoidCallback onDelete;
  final VoidCallback? onTap;

  const EventItem({
    Key? key,
    required this.event,
    required this.onDelete,
    this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(event.title),
      subtitle: Text(event.date.toString()),
      onTap: onTap,
      trailing: IconButton(
        icon: const Icon(Icons.delete),
        onPressed: onDelete,
      ),
    );
  }
}