import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/marketplace_db.dart';
import '../../Student_Profile_Page/Domain/user_db.dart';
import 'package:connect_people/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/MarketPlacePage/Data/marketplace_notifier.dart';
class EditItemPage extends ConsumerWidget {
  final String? itemId;

  EditItemPage({this.itemId});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _itemNameController = TextEditingController();
    final _priceController = TextEditingController();
    final _imagePathController = TextEditingController();
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    final item = ref.watch(MarketDBProvider).items.firstWhere(
            (element) => element.item_id == itemId,
        orElse: () => MarketData(
            item_id: '',
            name: '',
            price: '',
            imagePath: '',
            student_id: ''
        )
    );

    _itemNameController.text = item.name;
    _priceController.text = item.price;
    _imagePathController.text = item.imagePath;

    return Scaffold(
      appBar: AppBar(
        title: Text(itemId == null ? 'Add Item' : 'Edit Item'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _itemNameController,
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
              onPressed: () {
                final marketDB = ref.read(MarketDBProvider);
                if (itemId == null) {
                  // Add new item
                  marketDB.addItem(
                    item_id: 'item-${(marketDB.items.length + 1).toString().padLeft(2, '0')}',
                    name: _itemNameController.text,
                    price: _priceController.text,
                    imagePath: _imagePathController.text,
                    student_id: currentUserID, // This should be the logged-in user's ID
                  );
                } else {
                  // Update existing item
                  marketDB.updateItem(
                    item_id: itemId!,
                    name: _itemNameController.text,
                    price: _priceController.text,
                    imagePath: _imagePathController.text,
                    student_id: currentUserID, // This should be the logged-in user's ID
                  );
                }
                Navigator.of(context).pop();
              },
              child: Text(itemId == null ? 'Add' : 'Update'),
            ),
          ],
        ),
      ),
    );
  }
}
