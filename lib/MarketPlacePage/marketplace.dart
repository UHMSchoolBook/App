import 'package:flutter/material.dart';

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
                icon: Icon(Icons.menu), // Burger menu icon
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
    return ListView(
      children: [
        MarketplaceItem('Item 1', 'Description of item 1', 'A', '20 USD'),
        MarketplaceItem('Item 2', 'Description of item 2', 'B', '50 USD'),
        MarketplaceItem('Item 3', 'Description of item 3', 'C', '30 USD'),
      ],
    );
  }
}

class HouseSharingTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        MarketplaceItem('House 1', 'Description of house 1', 'D', '500 USD/month'),
        MarketplaceItem('House 2', 'Description of house 2', 'E', '600 USD/month'),
        MarketplaceItem('House 3', 'Description of house 3', 'F', '550 USD/month'),
      ],
    );
  }
}

class MarketplaceItem extends StatelessWidget {
  final String title;
  final String description;
  final String author;
  final String price;

  MarketplaceItem(this.title, this.description, this.author, this.price);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.all(10),
      child: ListTile(
        leading: CircleAvatar(
          // Display author's avatar
          backgroundImage: AssetImage('assets/avatar.png'),
        ),
        title: Text(title),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(description),
            SizedBox(height: 15),
            Text('Posted by: $author'),
            Text('Price: $price'),
          ],
        ),
      ),
    );
  }
}