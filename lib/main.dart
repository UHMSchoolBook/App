import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'Features/Feed/Domain/clubfeed.dart';
import 'Features/Feed/Domain/coursefeed.dart';
import 'Features/MarketPlacePage/Domain/housesharing.dart';
import 'Features/MarketPlacePage/Domain/marketplace.dart';
import 'Features/Student_Profile_Page/Domain/users.dart';
import 'app.dart';
import 'firebase_options.dart'; // Your Firebase configuration file
Future<bool> verifyInitialData() async {
  // logger.i('Verifying initial data files: Chapter, Garden, News, User');
  await UserData.checkInitialData();
  await MarketPlaceData.checkInitialData();
  await HouseSharingData.checkInitialData();
  await ClubFeedData.checkInitialData();
  await CourseFeedData.checkInitialData();
  return true;
}
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(ProviderScope(child: MyApp()));
}