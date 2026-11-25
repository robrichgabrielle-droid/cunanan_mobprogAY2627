import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'screens/home_screen.dart';
import 'screens/newsfeed_screen.dart';

void main() => runApp(const RoblesFacebook());

class RoblesFacebook extends StatelessWidget {
  const RoblesFacebook({super.key});

  Widget _withScreenUtil(Widget screen) {
    return ScreenUtilInit(
      designSize: const Size(412, 715),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_, _) => screen,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Facebook Replication',
      home: _withScreenUtil(const HomeScreen()),
      routes: {
        '/newsfeed': (context) => _withScreenUtil(const NewsFeedScreen()),
        '/home': (context) => _withScreenUtil(const HomeScreen()),
      },
    );
  }
}