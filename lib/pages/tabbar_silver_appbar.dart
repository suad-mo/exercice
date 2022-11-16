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
              print(innerBoxIsScrolled);
              return [
                SliverAppBar(
                  title: innerBoxIsScrolled
                      ? const Text('${MyApp.title} Tab Bar')
                      : null,
                  leading: !innerBoxIsScrolled
                      ? Container(
                          // color: Colors.green,
                          margin: const EdgeInsets.all(5),
                          decoration: const BoxDecoration(
                            // borderRadius: BorderRadius.circular(10),
                            shape: BoxShape.circle,
                            color: Colors.black12,
                          ),
                          child: IconButton(
                            icon: const Icon(
                              Icons.arrow_back,
                              color: Colors.white,
                            ),
                            onPressed: () {},
                          ),
                        )
                      : IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.black,
                          ),
                          onPressed: () {},
                        ),
                  snap: false,
                  floating: false,
                  pinned: true,
                  expandedHeight: 250,
                  collapsedHeight: kToolbarHeight, // + 50,
                  flexibleSpace: FlexibleSpaceBar(
                    background: Image.network(
                      'https://source.unsplash.com/random?monochromatic+dark',
                      fit: BoxFit.cover,
                    ),
                    collapseMode: CollapseMode.parallax, // default mode
                    // title: const Text('Flexibile Title'),
                    // centerTitle: true,
                  ),
                  bottom: const TabBar(
                    tabs: [
                      Tab(
                        // icon: Icon(Icons.map),
                        // text: 'About',
                        child: Text(
                          'About',
                          style: TextStyle(fontSize: 20),
                        ),
                      ),
                      Tab(
                        // icon: Icon(Icons.portrait),
                        text: 'Cast',
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
