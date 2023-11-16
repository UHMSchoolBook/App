import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../Domain/housesharing.dart';
import '../Domain/housesharing_collection.dart';

final houseSharingDBProvider = Provider((ref) => HouseSharingDB());

final houseSharingStreamProvider = StreamProvider.autoDispose<List<HouseSharingData>>((ref) {
  final houseSharingDB = ref.watch(houseSharingDBProvider);
  return houseSharingDB.getRooms();
});

final houseSharingByIdProvider = FutureProvider.family<HouseSharingData?, String>((ref, roomId) {
  return ref.read(houseSharingDBProvider).getRoomById(roomId);
});
