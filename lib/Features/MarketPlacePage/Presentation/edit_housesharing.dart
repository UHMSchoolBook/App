import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/housesharing_db.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/MarketPlacePage/Data/housesharing_notifier.dart';
class EditHouseSharingPage extends ConsumerWidget {
  final String? roomId;

  EditHouseSharingPage({this.roomId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _locationController = TextEditingController();
    final _rentController = TextEditingController();
    final _imagePathController = TextEditingController();
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    final room = ref.watch(HouseDBProvider).rooms.firstWhere(
            (element) => element.item_id == roomId,
        orElse: () => HouseData(
            item_id: '',
            location: '',
            rent: '',
            imagePath: '',
            student_id: ''
        )
    );

    _locationController.text = room.location;
    _rentController.text = room.rent;
    _imagePathController.text = room.imagePath;

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
              onPressed: () {
                if (roomId == null) {
                  // Add new room
                  ref.read(HouseDBProvider).addRoom(
                    item_id: 'room-${(ref.read(HouseDBProvider).rooms.length + 1).toString().padLeft(2, '0')}',
                    location: _locationController.text,
                    rent: _rentController.text,
                    imagePath: _imagePathController.text,
                    student_id: currentUserID,
                  );
                } else {
                  // Update existing room
                  ref.read(HouseDBProvider).updateRoom(
                    item_id: roomId!,
                    location: _locationController.text,
                    rent: _rentController.text,
                    imagePath: _imagePathController.text,
                    student_id: currentUserID,
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text(roomId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
