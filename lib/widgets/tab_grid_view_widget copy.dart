// ignore_for_file: file_names

import 'package:exercise/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class TabGridViewWidget extends StatelessWidget {
  final String name;
  final BuildContext context;

  const TabGridViewWidget({
    Key? key,
    required this.name,
    required this.context,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: false,
      bottom: false,
      child: Builder(
        builder: (BuildContext context) {
          return CustomScrollView(
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
              ),
              SliverPadding(
                  padding: const EdgeInsets.all(8.0),
                  // In this example, the inner scroll view has
                  // fixed-height list items, hence the use of
                  // SliverFixedExtentList. However, one could use any
                  // sliver widget here, e.g. SliverList or SliverGrid.
                  // U ovom primjeru, pogled unutrašnjeg pomicanja ima
                  // stavke liste fiksne visine, stoga se koristi
                  // SliverFixedExtentList. Međutim, ovdje se može
                  // koristiti bilo koji sliver widget,
                  // npr. SliverList ili SliverGrid.
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2),
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => ImageWidget(index: index),
                        childCount: 20,
                        addRepaintBoundaries: false),
                  )),
            ],
          );
        },
      ),
    );
  }
}
