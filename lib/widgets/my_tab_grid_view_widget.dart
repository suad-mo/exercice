// ignore_for_file: file_names

import 'package:exercise/data.dart';

import 'package:flutter/material.dart';

import 'my_image_widget.dart';

class MyTabGridViewWidget extends StatelessWidget {
  final String name;
  final BuildContext context;

  const MyTabGridViewWidget({
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
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  sliver: SliverGrid(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 3, childAspectRatio: 2 / 3),
                    delegate: SliverChildBuilderDelegate(
                        (context, index) => MyImageWidget(index: index),
                        childCount: Rock.posters.length),
                  )),
            ],
          );
        },
      ),
    );
  }
}
