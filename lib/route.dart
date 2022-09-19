import 'package:flutter/material.dart';

import 'pages/feed_page.dart';
import 'pages/profile_page.dart';
import 'pages/shareplus_page.dart';

class AppRoute {
  static const feed = 'feed';
  static const shareplus = 'shareplus';
  static const profile = 'profile';

  final _route = <String, WidgetBuilder>{
    feed: (context) => const FeedPage(),
    shareplus: (context) => const SharePlusPage(),
    profile: (context) => const ProfilePage(),
  };

  final _listPage = [
    const FeedPage(),
    const SharePlusPage(),
    const ProfilePage(),
  ];

  get getRouteAll => _route;
  get getPageAll => _listPage;
}
