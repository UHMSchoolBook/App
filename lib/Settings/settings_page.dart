import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
final themeProvider = StateProvider<ThemeMode>((ref) => ThemeMode.light);
class SettingsPage extends ConsumerWidget {

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final themeMode = ref.watch(themeProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: ListTile(
        title: Text('Toggle Theme'),
        trailing: Switch(
          value: themeMode == ThemeMode.dark,
          onChanged: (value) {
            ref.read(themeProvider.notifier).state =
            value ? ThemeMode.dark : ThemeMode.light;
          },
        ),
      ),
    );
  }
}
