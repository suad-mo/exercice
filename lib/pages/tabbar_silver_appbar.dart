import 'package:flutter/material.dart';

import '../main.dart';
import '../widgets/image_widget.dart';

class TabBarSilverAppBar extends StatelessWidget {
  const TabBarSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: DefaultTabController(
          length: 2,
          child: NestedScrollView(
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                const SliverAppBar(
                  title: Text(MyApp.title),
                  bottom: TabBar(
                    tabs: [
                      Tab(
                        icon: Icon(Icons.map),
                        text: 'Tab 1',
                      ),
                      Tab(
                        icon: Icon(Icons.portrait),
                        text: 'Tab 1',
                      ),
                    ],
                  ),
                )
              ];
            },
            body: TabBarView(children: [
              buildImages(),
              buildImages(),
            ]),
          ),
        ),
      );

  Widget buildImages() => GridView.builder(
        padding: const EdgeInsets.only(top: 0),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
        ),
        itemCount: 20,
        itemBuilder: (context, index) => ImageWidget(index: index),
      );
}
