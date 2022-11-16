import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyStatelessWidget(),
    );
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2'];
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          // floatHeaderSlivers: true,
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            return <Widget>[
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title:
                      const Text('Books'), // This is the title in the app bar.
                  pinned: true,
                  floating: true,
                  snap: true,
                  expandedHeight: 200.0,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: const TabBarView(
              // These are the contents of the tab views, below the tabs.
              children: [
                MyTabWidget(name: 'Tab 1'),
                MyTabNewWidget(name: 'Tab 2'),
              ]
              // tabs.map((String name) {
              //   return SafeArea(
              //     top: false,
              //     bottom: false,
              //     child: Builder(
              //       // This Builder is needed to provide a BuildContext that is
              //       // "inside" the NestedScrollView, so that
              //       // sliverOverlapAbsorberHandleFor() can find the
              //       // NestedScrollView.
              //       builder: (BuildContext context) {
              //         return CustomScrollView(
              //           // The "controller" and "primary" members should be left
              //           // unset, so that the NestedScrollView can control this
              //           // inner scroll view.
              //           // If the "controller" property is set, then this scroll
              //           // view will not be associated with the NestedScrollView.
              //           // The PageStorageKey should be unique to this ScrollView;
              //           // it allows the list to remember its scroll position when
              //           // the tab view is not on the screen.
              //           key: PageStorageKey<String>(name),
              //           slivers: <Widget>[
              //             SliverOverlapInjector(
              //               // This is the flip side of the SliverOverlapAbsorber
              //               // above.
              //               handle:
              //                   NestedScrollView.sliverOverlapAbsorberHandleFor(
              //                       context),
              //             ),
              //             SliverPadding(
              //               padding: const EdgeInsets.all(8.0),
              //               // In this example, the inner scroll view has
              //               // fixed-height list items, hence the use of
              //               // SliverFixedExtentList. However, one could use any
              //               // sliver widget here, e.g. SliverList or SliverGrid.
              //               sliver: SliverFixedExtentList(
              //                 // The items in this example are fixed to 48 pixels
              //                 // high. This matches the Material Design spec for
              //                 // ListTile widgets.
              //                 itemExtent: 84.0, // 48.0,
              //                 delegate: SliverChildBuilderDelegate(
              //                   (BuildContext context, int index) {
              //                     // This builder is called for each child.
              //                     // In this example, we just number each list item.
              //                     return ListTile(
              //                       title: Text('Item $index'),
              //                     );
              //                   },
              //                   // The childCount of the SliverChildBuilderDelegate
              //                   // specifies how many children this inner list
              //                   // has. In this example, each tab has a list of
              //                   // exactly 30 items, but this is arbitrary.
              //                   childCount: 30,
              //                 ),
              //               ),
              //             ),
              //           ],
              //         );
              //       },
              //     ),
              //   );
              // }).toList(),
              ),
        ),
      ),
    );
  }
}

class MyTabWidget extends StatelessWidget {
  final String name;
  const MyTabWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        // This Builder is needed to provide a BuildContext that is
        // "inside" the NestedScrollView, so that
        // sliverOverlapAbsorberHandleFor() can find the
        // NestedScrollView.
        builder: (BuildContext context) {
          return CustomScrollView(
            // The "controller" and "primary" members should be left
            // unset, so that the NestedScrollView can control this
            // inner scroll view.
            // If the "controller" property is set, then this scroll
            // view will not be associated with the NestedScrollView.
            // The PageStorageKey should be unique to this ScrollView;
            // it allows the list to remember its scroll position when
            // the tab view is not on the screen.
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber
                // above.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                padding: const EdgeInsets.all(8.0),
                // In this example, the inner scroll view has
                // fixed-height list items, hence the use of
                // SliverFixedExtentList. However, one could use any
                // sliver widget here, e.g. SliverList or SliverGrid.
                sliver: SliverFixedExtentList(
                  // The items in this example are fixed to 48 pixels
                  // high. This matches the Material Design spec for
                  // ListTile widgets.
                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // This builder is called for each child.
                      // In this example, we just number each list item.
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    // The childCount of the SliverChildBuilderDelegate
                    // specifies how many children this inner list
                    // has. In this example, each tab has a list of
                    // exactly 30 items, but this is arbitrary.
                    childCount: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

class MyTabNewWidget extends StatelessWidget {
  final String name;
  const MyTabNewWidget({super.key, required this.name});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        top: false,
        bottom: false,
        child: CustomScrollView(
          key: PageStorageKey<String>(name),
          slivers: <Widget>[
            SliverOverlapInjector(
              handle: NestedScrollView.sliverOverlapAbsorberHandleFor(context),
            ),
            SliverPadding(
              padding: const EdgeInsets.all(8.0),
              sliver: SliverFixedExtentList(
                itemExtent: 48.0,
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    return ListTile(
                      title: Text('Item $index'),
                    );
                  },
                  childCount: 30,
                ),
              ),
            ),
          ],
        ));
  }
}
