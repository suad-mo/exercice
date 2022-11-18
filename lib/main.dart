import 'package:flutter/material.dart';

void main() => runApp(const MaterialApp(home: MyApp()));

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 1,
      length: 3,
      child: Scaffold(
        body: CustomScrollView(
          physics: const BouncingScrollPhysics(
              parent: AlwaysScrollableScrollPhysics()),
          slivers: <Widget>[
            SliverAppBar(
              bottom: const TabBar(
                automaticIndicatorColorAdjustment: true,
                tabs: <Widget>[
                  Tab(
                    icon: Icon(Icons.cloud_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.beach_access_sharp),
                  ),
                  Tab(
                    icon: Icon(Icons.brightness_5_sharp),
                  ),
                ],
              ),
              automaticallyImplyLeading: false,
              leading: const Icon(Icons.arrow_back),
              pinned: true,
              stretch: true,
              onStretchTrigger: () {
                // Function callback for stretch
                print('aaa...');
                return Future<void>.value();
              },
              expandedHeight: 300.0,
              flexibleSpace: FlexibleSpaceBar(
                stretchModes: const <StretchMode>[
                  StretchMode.zoomBackground,
                  StretchMode.blurBackground,
                  StretchMode.fadeTitle,
                ],
                centerTitle: true,
                titlePadding: const EdgeInsets.symmetric(vertical: 50),
                title: const Text(
                  'Flight Report',
                  // style: TextStyle(color: Colors.black),
                ),
                background: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Image.network(
                      'https://flutter.github.io/assets-for-api-docs/assets/widgets/owl-2.jpg',
                      fit: BoxFit.cover,
                    ),
                    const DecoratedBox(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment(0.0, 0.5),
                          end: Alignment.center,
                          colors: <Color>[
                            Color(0x60000000),
                            Color(0x00000000),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate(
                const <Widget>[
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Sunday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  ListTile(
                    leading: Icon(Icons.wb_sunny),
                    title: Text('Monday'),
                    subtitle: Text('sunny, h: 80, l: 65'),
                  ),
                  // ListTiles++
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
