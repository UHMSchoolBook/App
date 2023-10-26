import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../data_model/marketplace_db.dart';
import '../data_model/housesharing_db.dart';
import '../data_model/user_db.dart';
import '../MarketPlacePage/edit_Item.dart';
import '../MarketPlacePage/edit_housesharing.dart';

class MarketplacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          title: TabBar(
            tabs: [
              Tab(text: 'Sale'),
              Tab(text: 'House Sharing'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            SaleTab(),
            HouseSharingTab(),
          ],
        ),
        floatingActionButton: Builder(
          builder: (context) {
            return FloatingActionButton(
              child: Icon(Icons.add),
              onPressed: () {

                final tabIndex = DefaultTabController.of(context)!.index;
                if (tabIndex == 0) {
                  // Sale tab is active
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditItemPage(),
                  ));
                } else if (tabIndex == 1) {
                  // House Sharing tab is active
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditHouseSharingPage(),
                  ));
                }
              },
            );
          },
        ),
      ),
    );
  }
}


class SaleTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final MarketDB = ref.watch(MarketDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    return ListView.builder(
      itemCount: MarketDB.items.length,
      itemBuilder: (context, index) {
        return MarketplaceItem(
          title: MarketDB.items[index].name,
          author: MarketDB.items[index].student_id,
          price: MarketDB.items[index].price,
          imagePath: MarketDB.items[index].imagePath,
          currentUserId: currentUserID,
          itemId: MarketDB.items[index].item_id,
        );
      },
    );
  }
}

class HouseSharingTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseDB = ref.watch(HouseDBProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    return ListView.builder(
      itemCount: houseDB.rooms.length,
      itemBuilder: (context, index) {
        return MarketplaceItem(
          title: houseDB.rooms[index].location,
          author: houseDB.rooms[index].student_id,
          price: houseDB.rooms[index].rent,
          imagePath: houseDB.rooms[index].imagePath,
          currentUserId: currentUserID,
          itemId: houseDB.rooms[index].item_id,
        );
      },
    );
  }
}


class MarketplaceItem extends StatelessWidget {
  final String title;
  final String author;
  final String price;
  final String imagePath;
  final String currentUserId;
  final String itemId;

  MarketplaceItem({
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
    required this.currentUserId,
    required this.itemId,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 20),
            Text('Posted by: ${userDB.getUserName(author)}'),
            Text('Price: $price'),
          ],
        ),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Image.network(
              imagePath,
              width: 60,
              height: 60,
              fit: BoxFit.cover,
            ),
            SizedBox(width: 10),
            if (currentUserId == author)
              PopupMenuButton<String>(
                onSelected: (value) {
                  if (value == 'edit') {
                    if (itemId.startsWith('item-')) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditItemPage(itemId: itemId),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditHouseSharingPage(roomId: itemId),
                      ));
                    }
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  const PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit'),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}

