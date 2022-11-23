import 'package:exercise/data.dart';
import 'package:flutter/material.dart';

class MyBackgraundWidget extends StatelessWidget {
  final String name;
  final String knownForDepartment;
  final String profilePath;

  const MyBackgraundWidget({
    super.key,
    this.name = Rock.name,
    this.knownForDepartment = Rock.knownForDepartment,
    this.profilePath = Rock.profilePath,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 230,
      child: Column(
        children: [
          const SizedBox(
            height: 80,
          ),
          CircleAvatar(
            backgroundImage: NetworkImage(profilePath),
            radius: 60,
          ),
          const SizedBox(height: 10),
          Text(
            name,
            style: const TextStyle(fontSize: 20),
          ),
          const SizedBox(height: 10),
          Text(
            knownForDepartment,
            style: const TextStyle(fontSize: 14),
          )
        ],
      ),
    );
  }
}
