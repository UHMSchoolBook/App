// marketplace_providers.dart
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/marketplace.dart';
import '../Domain/marketplace_collection.dart';


final marketPlaceDBProvider = Provider((ref) => MarketPlaceDB());

final marketPlaceStreamProvider = StreamProvider.autoDispose<List<MarketPlaceData>>((ref) {
  final marketPlaceDB = ref.watch(marketPlaceDBProvider);
  return marketPlaceDB.getItems();
});

final marketPlaceByIdProvider = FutureProvider.family<MarketPlaceData?, String>((ref, itemId) {
  return ref.read(marketPlaceDBProvider).getItemById(itemId);
});
