import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../Data/groupsProvider.dart';
import '../Domain/groups.dart';
import 'groupspage.dart';

class AddGroupsPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Groups'),
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(16.0),
            child: TextField(
              onChanged: (value) => ref.read(groupsSearchProvider.notifier).search(value),
              decoration: InputDecoration(
                labelText: 'Search Groups',
                suffixIcon: Icon(Icons.search),
              ),
            ),
          ),
          Expanded(
            child: GroupSearchResults(),
          ),
        ],
      ),
    );
  }
}


class GroupSearchResults extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<GroupData> groups = ref.watch(groupsSearchProvider);

    return ListView.builder(
      itemCount: groups.length,
      itemBuilder: (context, index) {
        return ListTile(
          title: Text(groups[index].name),
          onTap: () {
            // Assuming you have a route to navigate to the GroupsPage
            // and you pass the selected group's ID to it
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => GroupDetailPage(groupId: groups[index].group_id),
              ),
            );
          },
        );
      },
    );
  }
}

