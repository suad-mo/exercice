import 'package:flutter/material.dart';

import 'my_app_bar_widget.dart';

class MySliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  final double expandedHeight;
  final Widget backgound;

  MySliverAppBarDelegate({
    required this.expandedHeight,
    required this.backgound,
  });

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        backgound,
        MaAppBarWidget(
          expandedHeight: expandedHeight,
          shrinkOffset: shrinkOffset,
        ),
      ],
    );
  }

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
