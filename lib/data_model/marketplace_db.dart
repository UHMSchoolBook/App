import 'package:flutter_riverpod/flutter_riverpod.dart';
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
  MarketDB(this.ref);
  final ProviderRef<MarketDB> ref;
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

  void addItem({
    required String item_id,
    required String name,
    required String price,
    required String imagePath,
    required String student_id,}) {
    String id = 'item-${(_items.length + 1).toString().padLeft(2, '0')}';
    MarketData data = MarketData(
      item_id: id,
      name: name,
      price: price,
      imagePath: imagePath,
      student_id: student_id,);
    _items.add(data);
  }


  void updateItem({
    required String item_id,
    required String name,
    required String price,
    required String imagePath,
    required String student_id,}) {
    String id = 'feed-${(_items.length + 1).toString().padLeft(2, '0')}';
    _items.removeWhere((MarketData) => MarketData.item_id == item_id);
    MarketData data = MarketData(
      item_id: id,
      name: name,
      price: price,
      imagePath: imagePath,
      student_id: student_id,);
    _items.add(data);
  }
}


final MarketDBProvider = Provider<MarketDB>((ref) {
  return MarketDB(ref);
});
