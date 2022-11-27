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
        MaAppBarWidget(
          expandedHeight: expandedHeight,
          shrinkOffset: shrinkOffset,
        ),
        Positioned(
          bottom: 0,
          child: Container(
            width: MediaQuery.of(context).size.width,
            alignment: Alignment.center,
            child: shrinkOffset / expandedHeight < 0.5 ? backgound : null,
          ),
        ),
      ],
    );
  }

  double appear(double shrinkOffset) => shrinkOffset / expandedHeight;

  double disappear(double shrinkOffset) => 1 - shrinkOffset / expandedHeight;

  @override
  double get maxExtent => expandedHeight;

  @override
  double get minExtent => kToolbarHeight * 2;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
