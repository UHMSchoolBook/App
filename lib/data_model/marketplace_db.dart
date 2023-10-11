
class MarketData {
  MarketData(
      {required this.item_id,
        required this.name,
        required this.price,
        required this.imagePath,
        required this.student_id,});

  String item_id;
  String name;
  String price;
  String imagePath;
  String student_id;
}

class MarketDB {
  final List<MarketData> _items = [
    MarketData(
        item_id: 'item-001',
        name: 'Reading Table',
        price: '\$30',
        imagePath: 'https://99grid.com/cdn/shop/products/ztable_1800x1800.jpg?v=1652878709',
        student_id: 'user-001'),
    MarketData(
        item_id: 'item-002',
        name: 'Book Shelf',
        price: '\$40',
        imagePath: 'https://99grid.com/cdn/shop/products/2-min_1800x1800.png?v=1653215539',
        student_id: 'user-002'),
    MarketData(
        item_id: 'item-003',
        name: 'Lamp Light',
        price: '\$40',
        imagePath: 'https://target.scene7.com/is/image/Target/GUEST_5191802e-b6ab-4788-971a-dee4e0671e77?wid=1200&hei=1200&qlt=80&fmt=webp',
        student_id: 'user-003'),
  ];
  List<MarketData> get items => _items;
}
/// The singleton instance providing access to all user data for clients.
MarketDB marketDB = MarketDB();