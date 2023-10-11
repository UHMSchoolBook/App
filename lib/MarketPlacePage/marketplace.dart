import 'package:flutter/material.dart';
import '../data_model/marketplace_db.dart';
import '../data_model/housesharing_db.dart';

class MarketplacePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          leading: Builder(
            builder: (BuildContext context) {
              return IconButton(
                icon: Icon(Icons.menu),
                onPressed: () {
                  Scaffold.of(context).openDrawer();
                },
              );
            },
          ),
          title: Text('Marketplace'),
          bottom: TabBar(
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
      ),
    );
  }
}

class SaleTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: marketDB.items.length,
      itemBuilder: (context, index) {
        return MarketplaceItem(
          marketDB.items[index].name,
          marketDB.items[index].student_id,
          marketDB.items[index].price,
          marketDB.items[index].imagePath,
        );
      },
    );
  }
}

class HouseSharingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: houseDB.rooms.length,
      itemBuilder: (context, index) {
        return MarketplaceItem(
          houseDB.rooms[index].location,
          houseDB.rooms[index].student_id,
          houseDB.rooms[index].rent,
          houseDB.rooms[index].imagePath,
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

  MarketplaceItem(this.title, this.author, this.price, this.imagePath);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 15),
            Text('Posted by: $author'),
            Text('Price: $price'),
          ],
        ),
        trailing: Image.network(
          imagePath,
          width: 50,
          height: 50,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
