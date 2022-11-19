import 'package:exercise/pages/advanced_sliver_appbar.dart';
import 'package:flutter/material.dart';

import 'pages/basic_silver_appbar.dart';
import 'pages/tabbar_silver_appbar.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  return runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  static const String title = 'Silver App Bar';

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.white,
          appBarTheme: const AppBarTheme(
              backgroundColor: Colors.white, foregroundColor: Colors.black),
          tabBarTheme: const TabBarTheme(
              labelColor: Colors.blue, unselectedLabelColor: Colors.black),
          // bottomNavigationBarTheme: BottomNavigationBarTheme()
        ),
        title: title,
        home: const MainPage(),
      );
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int index = 0;

  @override
  Widget build(BuildContext context) => Scaffold(
        bottomNavigationBar: buildBottomBar(),
        body: buildPages(),
      );

  Widget buildBottomBar() {
    const style = TextStyle(color: Colors.white);
    return BottomNavigationBar(
      backgroundColor: Theme.of(context).primaryColorDark,
      selectedItemColor: Colors.white70,
      unselectedItemColor: Colors.white24,
      currentIndex: index,
      items: const [
        BottomNavigationBarItem(
          icon: Text('SilverAppBar', style: style),
          label: 'Basic',
        ),
        BottomNavigationBarItem(
          icon: Text('SliverAppBar', style: style),
          label: 'Advanced',
        ),
        BottomNavigationBarItem(
          icon: Text('SilverAppBar', style: style),
          label: 'TabBar',
        ),
      ],
      onTap: (index) => setState(() => this.index = index),
    );
  }

  Widget buildPages() {
    switch (index) {
      case 0:
        return const BasicSilverAppBar();
      case 1:
        return const AdvancedSilverAppBar();
      case 2:
        return const TabBarSilverAppBar();
      default:
        return Container();
    }
  }
}
