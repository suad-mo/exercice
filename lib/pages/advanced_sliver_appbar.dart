import 'package:exercise/widgets/tab_grid_view_widget%20copy.dart';
import 'package:exercise/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

import '../main.dart';

class AdvancedSilverAppBar extends StatelessWidget {
  const AdvancedSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: DefaultTabController(
        length: 6,
        child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => <Widget>[
                SliverOverlapAbsorber(
                  handle:
                      NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                  sliver: SliverPersistentHeader(
                    delegate: CustomSilverAppBarDelegate(expandedHeight: 400),
                    pinned: true,
                    floating: false,
                  ),
                ),

                SliverPersistentHeader(
                  pinned: true,
                  floating: false,
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      // labelStyle: TextStyle(),
                      indicatorWeight: 1,
                      indicatorColor: Colors.blue,
                      // indicatorPadding: EdgeInsets.all(5),
                      indicatorSize: TabBarIndicatorSize.label,
                      // automaticIndicatorColorAdjustment: false,
                      isScrollable: true,
                      tabs: [
                        Tab(text: 'About'),
                        Tab(text: 'Cast'),
                        Tab(text: 'Comments'),
                        Tab(text: 'Review'),
                        Tab(text: 'Recommendations'),
                        Tab(text: 'Similar'),
                      ],
                    ),
                  ),
                ),
                // buildImages(),
              ]),
          body: TabBarView(
            children: [
              TabGridViewWidget(name: 'name', context: context),
              TabGridViewWidget(name: 'name1', context: context),
              TabGridViewWidget(name: 'name2', context: context),
              TabGridViewWidget(name: 'name3', context: context),
              TabWidget(name: 'Tab1', context: context),
              TabWidget(name: 'Tab', context: context),
            ],
          ),
        ),
      ));

  // Widget buildImages() => SliverGrid(
  //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
  //       crossAxisCount: 2,
  //       // childAspectRatio: 1.2,
  //     ),
  //     delegate: SliverChildBuilderDelegate(
  //       (context, index) => ImageWidget(index: index),
  //       childCount: 20,
  //     ));
}

class CustomSilverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;

  CustomSilverAppBarDelegate({
    required this.expandedHeight,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    //const size = 60;
    //final top = expandedHeight - shrinkOffset - size / 2;
    // print(
    //     'shrinkOffset:$shrinkOffset, overlapsContent:$overlapsContent, expandedHeight:$expandedHeight');
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        if (isBack(shrinkOffset)) buildBackground01(shrinkOffset),
        buildAppBar01(shrinkOffset),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  bool isBar(double shrinkOffset) => shrinkOffset <= expandedHeight - 180;
  bool isBack(double shrinkOffset) => shrinkOffset <= expandedHeight - 200;

  Widget buildAppBar(double shrinkOffset) => Opacity(
        opacity: appear(shrinkOffset),
        child: AppBar(
          leading: const Icon(Icons.arrow_back),
          title: const Text(MyApp.title),
        ),
      );

  Widget buildAppBar01(double shrinkOffset) => AppBar(
        elevation: 0,
        backgroundColor:
            isBack(shrinkOffset) ? Colors.transparent : Colors.white,
        leading: isBar(shrinkOffset)
            ? Container(
                margin: const EdgeInsets.all(5),
                decoration: const BoxDecoration(
                  // borderRadius: BorderRadius.circular(10),
                  shape: BoxShape.circle,
                  color: Colors.black26,
                ),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {},
                ),
              )
            : const Icon(Icons.arrow_back),
        title: isBar(shrinkOffset) ? null : const Text(MyApp.title),
        centerTitle: false,
        // bottom: const TabBar(
        //   indicatorWeight: 1,
        //   indicatorColor: Colors.blue,
        //   indicatorPadding: EdgeInsets.all(5),
        //   indicatorSize: TabBarIndicatorSize.label,
        //   automaticIndicatorColorAdjustment: false,
        //   isScrollable: true,
        //   tabs: [
        //     Tab(text: 'About'),
        //     Tab(text: 'Cast'),
        //     Tab(text: 'Comments'),
        //     Tab(text: 'Review'),
        //     Tab(text: 'Recommendations'),
        //     Tab(text: 'Similar'),
        //   ],
        // ),
      );

  Widget buildBackground(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Image.network(
          'https://source.unsplash.com/random?mono+dark',
          fit: BoxFit.cover,
        ),
      );

  Widget buildBackground01(double shrinkOffset) => Opacity(
        opacity: isBar(shrinkOffset) ? 1 : disappear(shrinkOffset),
        child: Image.network(
          'https://source.unsplash.com/random?mono+dark',
          fit: BoxFit.cover,
        ),
      );

  Widget buildFloating(double shrinkOffset) => Opacity(
        opacity: disappear(shrinkOffset),
        child: Card(
          child: Row(
            children: [
              Expanded(child: buildButton(text: 'Share', icon: Icons.share)),
              Expanded(child: buildButton(text: 'Like', icon: Icons.thumb_up)),
            ],
          ),
        ),
      );

  Widget buildButton({
    required String text,
    required IconData icon,
  }) =>
      TextButton(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon),
            const SizedBox(width: 12),
            Text(text, style: const TextStyle(fontSize: 20)),
          ],
        ),
        onPressed: () {},
      );

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight + 60;

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.all(8),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}
