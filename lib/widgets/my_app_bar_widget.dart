import 'package:flutter/material.dart';

import '../data.dart';

class MaAppBarWidget extends StatelessWidget {
  final double shrinkOffset;
  final double expandedHeight;
  final String name = Rock.name;

  const MaAppBarWidget(
      {super.key, required this.shrinkOffset, required this.expandedHeight});

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  bool isBar(double shrinkOffset) => shrinkOffset <= expandedHeight - 120;
  bool isBack(double shrinkOffset) => shrinkOffset <= expandedHeight - 140;

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: appear(shrinkOffset),
      child: AppBar(
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
        title: isBar(shrinkOffset) ? null : Text(name),
        centerTitle: false,
        // flexibleSpace: FlexibleSpaceBar(background: MyBackgraundWidget()),
      ),
    );
  }
}

//  bottom: const TabBar(
//         indicatorWeight: 1,
//         indicatorColor: Colors.blue,
//         indicatorPadding: EdgeInsets.all(5),
//         indicatorSize: TabBarIndicatorSize.label,
//         automaticIndicatorColorAdjustment: false,
//         isScrollable: true,
//         tabs: [
//           Tab(text: 'About'),
//           Tab(text: 'Cast'),
//           Tab(text: 'Comments'),
//           Tab(text: 'Review'),
//           Tab(text: 'Recommendations'),
//           Tab(text: 'Similar'),
//         ],
//       ),