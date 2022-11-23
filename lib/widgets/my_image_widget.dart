import 'package:exercise/data.dart';
import 'package:flutter/material.dart';

class MyImageWidget extends StatelessWidget {
  const MyImageWidget({super.key, required this.index});
  final int index;

  @override
  Widget build(BuildContext context) => SizedBox(
        height: 150,
        width: double.infinity,
        child: Card(
          child: Image.network(
            Rock.posters[index],
            fit: BoxFit.cover,
          ),
        ),
      );
}
