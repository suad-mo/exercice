import 'package:exercise/widgets/my_sliver_app_bar_delegate.dart';
import 'package:exercise/widgets/my_sliver_app_bar_widget.dart';
import 'package:exercise/widgets/tab_grid_view_widget%20copy.dart';
import 'package:exercise/widgets/tab_widget.dart';
import 'package:flutter/material.dart';

import '../widgets/my_backgraund_widget.dart';
import '../widgets/my_tab_grid_view_widget.dart';

class MyAdvancedSilverAppBar extends StatelessWidget {
  const MyAdvancedSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
          body: DefaultTabController(
        length: 6,
        child: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => <Widget>[
                // SliverOverlapAbsorber(
                //   handle:
                //       NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                //   sliver: SliverPersistentHeader(
                //     delegate: MySliverAppBarDelegate(
                //         expandedHeight: 260,
                //         backgound: const MyBackgraundWidget()),
                //     // MediaQuery.of(context).size.height * 2 / 5),
                //     pinned: true,
                //     floating: true,
                //   ),
                // ),
                MySliverAppBarWidget(innerBoxIsScrolled: innerBoxIsScrolled),
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
              TabGridViewWidget(name: 'name1', context: context),
              MyTabGridViewWidget(name: 'name', context: context),
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

// class MySilverAppBarDelegate extends SliverPersistentHeaderDelegate {
//   final double expandedHeight;

//   MySilverAppBarDelegate({
//     required this.expandedHeight,
//   });

//   @override
//   Widget build(
//       BuildContext context, double shrinkOffset, bool overlapsContent) {
//     //const size = 60;
//     //final top = expandedHeight - shrinkOffset - size / 2;
//     print(
//         'shrinkOffset:$shrinkOffset, overlapsContent:$overlapsContent, expandedHeight:$expandedHeight');
//     print(
//         'shrinkOffset:$shrinkOffset, minExtend:$minExtent, expandedHeight:$expandedHeight');
//     return Stack(
//       clipBehavior: Clip.none,
//       fit: StackFit.expand,
//       children: [
//         if (isBack(shrinkOffset)) buildBackground01(shrinkOffset),
//         buildAppBar01(shrinkOffset),
//       ],
//     );
//   }

//   double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

//   double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

//   bool isBar(double shrinkOffset) => shrinkOffset <= expandedHeight - 150;
//   bool isBack(double shrinkOffset) => shrinkOffset <= expandedHeight - 170;

//   Widget buildAppBar(double shrinkOffset) => Opacity(
//         opacity: appear(shrinkOffset),
//         child: AppBar(
//           leading: const Icon(Icons.arrow_back),
//           title: const Text(MyApp.title),
//         ),
//       );

//   Widget buildAppBar01(double shrinkOffset) => AppBar(
//         elevation: 0,
//         backgroundColor:
//             isBack(shrinkOffset) ? Colors.transparent : Colors.white,
//         leading: isBar(shrinkOffset)
//             ? Container(
//                 margin: const EdgeInsets.all(5),
//                 decoration: const BoxDecoration(
//                   // borderRadius: BorderRadius.circular(10),
//                   shape: BoxShape.circle,
//                   color: Colors.black26,
//                 ),
//                 child: IconButton(
//                   icon: const Icon(
//                     Icons.arrow_back,
//                     color: Colors.white,
//                   ),
//                   onPressed: () {},
//                 ),
//               )
//             : const Icon(Icons.arrow_back),
//         title: isBar(shrinkOffset) ? null : const Text(MyApp.title),
//         centerTitle: false,
//         // bottom: const TabBar(
//         //   indicatorWeight: 1,
//         //   indicatorColor: Colors.blue,
//         //   indicatorPadding: EdgeInsets.all(5),
//         //   indicatorSize: TabBarIndicatorSize.label,
//         //   automaticIndicatorColorAdjustment: false,
//         //   isScrollable: true,
//         //   tabs: [
//         //     Tab(text: 'About'),
//         //     Tab(text: 'Cast'),
//         //     Tab(text: 'Comments'),
//         //     Tab(text: 'Review'),
//         //     Tab(text: 'Recommendations'),
//         //     Tab(text: 'Similar'),
//         //   ],
//         // ),
//       );

//   Widget buildBackground(double shrinkOffset) => Opacity(
//         opacity: disappear(shrinkOffset),
//         child: Image.network(
//           'https://source.unsplash.com/random?mono+dark',
//           fit: BoxFit.cover,
//         ),
//       );

//   Widget buildBackground01(double shrinkOffset) => Opacity(
//         opacity: isBar(shrinkOffset) ? 1 : disappear(shrinkOffset),
//         child: Image.network(
//           'https://source.unsplash.com/random?mono+dark',
//           fit: BoxFit.cover,
//         ),
//       );

//   Widget buildFloating(double shrinkOffset) => Opacity(
//         opacity: disappear(shrinkOffset),
//         child: Card(
//           child: Row(
//             children: [
//               Expanded(child: buildButton(text: 'Share', icon: Icons.share)),
//               Expanded(child: buildButton(text: 'Like', icon: Icons.thumb_up)),
//             ],
//           ),
//         ),
//       );

//   Widget buildButton({required String text, required IconData icon}) =>
//       TextButton(
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(icon),
//             const SizedBox(width: 12),
//             Text(text, style: const TextStyle(fontSize: 20)),
//           ],
//         ),
//         onPressed: () {},
//       );

//   @override
//   double get maxExtent => expandedHeight;

//   @override
//   double get minExtent => kToolbarHeight; // + 60;

//   @override
//   bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) => true;
// }

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
    print(minExtent.toString());
    return Container(
      color: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class MyCustomHeaderPage extends StatelessWidget {
  const MyCustomHeaderPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Row(
          children: [
            // const SizedBox(width: 8),
            Text('225 movies'),
            Expanded(child: SizedBox()),

            Text('Sort'),
            IconButton(onPressed: (() {}), icon: Icon(Icons.sort)),
            Text('View'),
            IconButton(onPressed: (() {}), icon: Icon(Icons.menu_book)),
            // const SizedBox(width: 8)
          ],
        ),
      ),
    );
  }
}
