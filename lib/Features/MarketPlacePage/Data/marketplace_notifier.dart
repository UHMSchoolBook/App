import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/Features/MarketPlacePage/Domain/marketplace_db.dart';

final MarketDBProvider = Provider<MarketDB>((ref) {
  return MarketDB(ref);
});