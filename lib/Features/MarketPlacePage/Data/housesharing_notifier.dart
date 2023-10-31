import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:connect_people/MarketPlacePage/Domain/housesharing_db.dart';

final HouseDBProvider = Provider<HouseDB>((ref) {
  return HouseDB(ref);
});
