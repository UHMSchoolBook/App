import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/marketplace.dart';
import '../Domain/marketplace_db.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/MarketPlacePage/Data/marketplace_notifier.dart';
class EditItemPage extends ConsumerWidget {
  final String? itemId;

  EditItemPage({this.itemId});

  final _nameController = TextEditingController();
  final _priceController = TextEditingController();
  final _imagePathController = TextEditingController();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    if (itemId != null) {
      ref.watch(marketPlaceByIdProvider(itemId!)).whenData((item) {
        if (item != null) {
          _nameController.text = item.name;
          _priceController.text = item.price;
          _imagePathController.text = item.imagePath;
        }
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(itemId == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _nameController,
              decoration: InputDecoration(labelText: 'Item Name'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _priceController,
              decoration: InputDecoration(labelText: 'Price'),
            ),
            SizedBox(height: 16),
            TextField(
              controller: _imagePathController,
              decoration: InputDecoration(labelText: 'Image URL'),
            ),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: () => _handleSave(context, ref),
              child: Text(itemId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }

  void _handleSave(BuildContext context, WidgetRef ref) {
    final marketPlaceDB = ref.read(marketPlaceDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    final newMarketPlaceData = MarketPlaceData(
      item_id: itemId ?? DateTime.now().millisecondsSinceEpoch.toString(),
      name: _nameController.text,
      price: _priceController.text,
      imagePath: _imagePathController.text,
      student_id: currentUserID,
    );

    if (itemId == null) {
      marketPlaceDB.addItem(newMarketPlaceData);
    } else {
      marketPlaceDB.updateItem(itemId!, newMarketPlaceData);
    }

    Navigator.of(context).pop();
  }
}