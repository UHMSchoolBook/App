import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../MessagesPage/Domain/messages.dart';
import '../../MessagesPage/Presentation/Messenger.dart';
import '../../MessagesPage/Presentation/chat_screen.dart';
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
    final marketPlaceAsyncValue = ref.watch(marketPlaceStreamProvider);
    final currentUserID = ref.watch(currentUserIDProvider.notifier).state ?? '';

    return marketPlaceAsyncValue.when(
      data: (items) => ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          final item = items[index];
          return MarketplaceItem(
            title: item.name,
            author: item.student_id, // Assuming each item has a 'student_id' field
            price: item.price.toString(),
            imagePath: item.imagePath,
            currentUserId: currentUserID,
            itemId: item.item_id,
            isSaleItem: true,

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
            isSaleItem: false,

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
  final bool isSaleItem;

  MarketplaceItem({
    required this.title,
    required this.author,
    required this.price,
    required this.imagePath,
    required this.currentUserId,
    required this.itemId,
    required this.isSaleItem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            title: Text(title),
            subtitle: Text('Price: $price'),
          ),
          Image.network(
            imagePath,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
          ),
          FutureBuilder<String>(
            future: userDB.getUserName(author),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Text('Loading...');
              }
              if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Row(
                  children: [
                    Text('Posted by: ${snapshot.data}'),
                    Spacer(),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => ChatScreen(userId: author),
                        ));
                      },
                      child: Text('Send a Message'),
                    ),
                  ],
                ),
              );
            },
          ),
          if (currentUserId == author)
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  icon: Icon(Icons.edit),
                  onPressed: () {
                    // Check if the item is a sale item
                    if (isSaleItem) {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditItemPage(itemId: itemId),
                      ));
                    } else {
                      Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => EditHouseSharingPage(roomId: itemId),
                      ));
                    }
                  },
                ),

              ],
            ),
        ],
      ),
    );
  }
}
