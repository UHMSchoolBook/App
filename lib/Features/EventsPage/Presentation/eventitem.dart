import 'package:flutter/material.dart';

import 'package:connect_people/Features/EventsPage/Domain/events.dart';
import 'package:connect_people/Features/EventsPage/Data/event_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../Student_Profile_Page/Data/user_notifier.dart';

class EventItem extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserID = ref.watch(currentUserIDProvider);

    return ListTile(
      title: Text(event.title),
      subtitle: Text('${event.date} - ${event.description ?? ""}'),
      onTap: onTap,
      trailing: currentUserID == event.student_id
          ? Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          IconButton(
            icon: const Icon(Icons.edit),
            onPressed: onTap,
          ),
          IconButton(
            icon: const Icon(Icons.delete),
            onPressed: onDelete,
          ),
        ],
      )
          : null,
    );
  }
}