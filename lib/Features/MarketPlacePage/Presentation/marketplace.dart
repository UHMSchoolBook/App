import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../Student_Profile_Page/Domain/users_collection.dart';
import 'edit_Item.dart';
import 'edit_housesharing.dart';
import 'package:connect_people/Features/Student_Profile_Page/Data/user_notifier.dart';
import 'package:connect_people/Features/MarketPlacePage/Data/housesharing_notifier.dart';
import 'package:connect_people/Features/MarketPlacePage/Data/marketplace_notifier.dart';
final UserDB userDB = UserDB();
class MarketplacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
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
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => EditItemPage(),
                  ));
                } else if (tabIndex == 1) {
                  // Navigate to EditHouseSharingPage if it exists
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
    final marketPlaceAsyncValue = ref.watch(marketPlaceStreamProvider);

    return marketPlaceAsyncValue.when(
      data: (items) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return ListTile(
            title: Text(item.name),
            subtitle: Text('Price: ${item.price}'),
            trailing: Image.network(item.imagePath, width: 50, height: 50),
            onTap: () {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => EditItemPage(itemId: item.item_id),
              ));
            },
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
    );
  }
}

class HouseSharingTab extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final houseSharingAsyncValue = ref.watch(houseSharingStreamProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';
    return houseSharingAsyncValue.when(
      data: (rooms) => ListView.builder(
        itemCount: rooms.length,
        itemBuilder: (context, index) {
          final room = rooms[index];
          return MarketplaceItem(
            title: room.location,
            author: room.student_id,
            price: room.rent,
            imagePath: room.imagePath,
            currentUserId: currentUserID,
            itemId: room.item_id,
          );
        },
      ),
      loading: () => CircularProgressIndicator(),
      error: (e, st) => Text('Error: $e'),
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
            FutureBuilder<String>(
              future: userDB.getUserName(author),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Text('Loading...');
                }
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }
                return Text('Posted by: ${snapshot.data}');
              },
            ),
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

