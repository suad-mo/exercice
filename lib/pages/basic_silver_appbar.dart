import 'package:exercise/widgets/image_widget.dart';
import 'package:flutter/material.dart';

class BasicSilverAppBar extends StatelessWidget {
  const BasicSilverAppBar({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              backgroundColor: Colors.red,
              expandedHeight: 200,
              floating: true,
              // snap: true, //
              pinned: true,
              flexibleSpace: FlexibleSpaceBar(
                background: Image.network(
                  'https://source.unsplash.com/random?monochromatic+dark',
                  fit: BoxFit.cover,
                ),
                collapseMode: CollapseMode.parallax, // default mode
                title: const Text('Flexibile Title'),
                centerTitle: true,
              ),
              // title: const Text('Flexibile Title'),
              // centerTitle: true,
              leading: Container(
                color: Colors.black26,
                child: const Icon(Icons.arrow_back),
              ),
              foregroundColor: Colors.amber,
              actions: const [
                Icon(Icons.settings),
                SizedBox(width: 12),
              ],
            ),
            buildImages(),
          ],
        ),
      );

  Widget buildImages() => SliverToBoxAdapter(
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          physics:
              const ScrollPhysics(), // Omogucava scrolanje u odnosu na parent Widget
          shrinkWrap: true,
          primary: true,
          itemCount: 20,
          itemBuilder: ((context, index) => ImageWidget(index: index)),
        ),
      );

//   Widget buildImagesSilverGridView() => SliverToBoxAdapter(
//         child: SliverGrid.count(
// crossAxisCount: 2,
//           gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 2),
//           delegate: SliverChildBuilderDelegate(
//               (context, index) => ImageWidget(index: index)),
//         ),

//       );
}
