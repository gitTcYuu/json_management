import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:json_management/blocs/feeds/feeds_bloc.dart';
import 'package:json_management/blocs/photos/photos_bloc.dart';
import 'package:json_management/route.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FeedsBloc()..add(LoadFeeds())),
        BlocProvider(create: (context) => PhotosBloc()..add(LoadPhotos())),
      ],
      child: MaterialApp(
        title: 'JSON API',
        debugShowCheckedModeBanner: false,
        routes: AppRoute().getRouteAll,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'JSON API',
          style: TextStyle(color: Colors.grey[700]),
        ),
      ),
      body: AppRoute().getPageAll[_currentIndex],
      bottomNavigationBar: NavigationBarTheme(
          data: const NavigationBarThemeData(
            elevation: 0,
            backgroundColor: Colors.white,
          ),
          child: NavigationBar(
              labelBehavior:
                  NavigationDestinationLabelBehavior.onlyShowSelected,
              selectedIndex: _currentIndex,
              onDestinationSelected: (index) => setState(() {
                    _currentIndex = index;
                  }),
              destinations: [
                _iconNavDestination(FontAwesomeIcons.solidNewspaper,
                    FontAwesomeIcons.newspaper, 'Feeds'),
                _iconNavDestination(FontAwesomeIcons.solidImage,
                    FontAwesomeIcons.image, 'SharePlus'),
                _iconNavDestination(FontAwesomeIcons.solidUser,
                    FontAwesomeIcons.user, 'My Profile'),
              ])),
    );
  }
}

Widget _iconNavDestination(
    IconData iconSelected, IconData iconUnSelect, String label) {
  return NavigationDestination(
      selectedIcon: Icon(
        iconSelected,
        color: Colors.grey[700],
        size: 18,
      ),
      icon: Icon(
        iconUnSelect,
        color: Colors.grey[300],
        size: 18,
      ),
      label: label);
}
