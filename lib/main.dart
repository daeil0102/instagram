import 'package:flutter/material.dart';
import 'package:instargram/Provider/app_provider.dart';
import 'package:instargram/screen/main_tab_screen.dart';

void main() {
  runApp(const InstagramApp());
}

class InstagramApp extends StatelessWidget {
  const InstagramApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: appProvider.notifyCount,
      builder: (context, value, child) {
        return MaterialApp(
            home: MainTabScreen()
        );
      }
    );
  }
}