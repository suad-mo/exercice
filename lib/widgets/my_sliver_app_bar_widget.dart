// ignore_for_file: unnecessary_const

import 'package:exercise/data.dart';
import 'package:exercise/widgets/my_backgraund_widget.dart';
import 'package:flutter/material.dart';

class MySliverAppBarWidget extends StatelessWidget {
  final bool innerBoxIsScrolled;
  const MySliverAppBarWidget({super.key, required this.innerBoxIsScrolled});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: innerBoxIsScrolled ? const Text(Rock.name) : null,
      leading: const IconButton(
        icon: Icon(
          Icons.arrow_back,
          color: Colors.white,
        ),
        onPressed: null,
      ),

      // : const Icon(Icons.arrow_back),
      // snap: true,
      foregroundColor: Colors.black,
      backgroundColor: Colors.white,
      elevation: 0,
      expandedHeight: 260,
      stretch: true,
      pinned: true,
      floating: false,
      actionsIconTheme:
          const IconThemeData(shadows: [Shadow(color: Colors.green)]),
      forceElevated: false,
      // flexibleSpace: FlexibleSpaceBarSettings(
      //   toolbarOpacity: 1,
      //   minExtent: 60,
      //   maxExtent: 260,
      //   currentExtent: 5,
      //   child: this,
      // ),
      // collapsedHeight: 120,
      flexibleSpace: FlexibleSpaceBar(
        background: MyBackgraundWidget(),
        centerTitle: true,
        stretchModes: [
          StretchMode.fadeTitle,
        ],
        collapseMode: CollapseMode.parallax,
      ),
    );
  }
}
