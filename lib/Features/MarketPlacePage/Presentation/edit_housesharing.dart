import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Data/housesharing_notifier.dart';
import '../Domain/housesharing.dart';  // Ensure this is correctly imported
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart'; // Ensure this is correctly imported

class EditHouseSharingPage extends ConsumerWidget {
  final String? roomId;

  EditHouseSharingPage({this.roomId});
  final _locationController = TextEditingController();
  final _rentController = TextEditingController();
  final _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    // Initialize controllers if roomId is not null
    if (roomId != null) {
      final roomDataAsyncValue = ref.watch(houseSharingByIdProvider(roomId!));
      roomDataAsyncValue.whenData((room) {
        if (room != null) {
          _locationController.text = room.location;
          _rentController.text = room.rent;
          _imagePathController.text = room.imagePath;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(roomId == null ? 'Add Room' : 'Edit Room'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _locationController,
              decoration: InputDecoration(labelText: 'Location'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _rentController,
              decoration: InputDecoration(labelText: 'Rent'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _imagePathController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _handleSave(context, ref),
              child: Text(roomId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSave(BuildContext context, WidgetRef ref) {
    final houseSharingDB = ref.read(houseSharingDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    final newRoom = HouseSharingData(
      item_id: roomId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      location: _locationController.text,
      rent: _rentController.text,
      imagePath: _imagePathController.text,
      student_id: currentUserID,
    );

    if (roomId == null) {
      houseSharingDB.addRoom(newRoom);
    } else {
      houseSharingDB.updateRoom(roomId!, newRoom);
    }

    Navigator.of(context).pop();
  }
}
