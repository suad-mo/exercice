import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    const title = 'GeeksforGeeks';

    return MaterialApp(
      home: DefaultTabController(
        length: 3,
        child: Scaffold(
            body: CustomScrollView(
          slivers: <Widget>[
            SliverAppBar(
              snap: false,
              pinned: true,
              floating: false,
              flexibleSpace: FlexibleSpaceBar(
                  // centerTitle: true,
                  // // titlePadding: EdgeInsets.only(bottom: 0),
                  // title: const Text(title,
                  //     style: TextStyle(
                  //       color: Colors.white,
                  //       fontSize: 16.0,
                  //     ) //TextStyle
                  //     ), //Text
                  background: Stack(
                fit: StackFit.loose,
                children: [
                  Container(
                    width: double.infinity,
                    child: Image.network(
                      "https://i.ibb.co/QpWGK5j/Geeksfor-Geeks.png",
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Positioned(
                    top: 20,
                    right: 20,
                    child: Row(
                      children: [
                        Container(
                          // margin: EdgeInsets.all(5),
                          // decoration: BoxDecoration(
                          //     border: Border.all(width: 2),
                          //     color: Colors.green),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            border: Border.all(color: Colors.red),
                          ),
                          padding: const EdgeInsets.symmetric(horizontal: 5),
                          // color: Colors.redAccent,
                          child: Text(1.10.toStringAsFixed(1)),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    bottom: 20,
                    left: 20,
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        border: Border.all(color: Colors.red),
                        color: Colors.black26,
                      ),
                      // backgroundBlendMode: BlendMode.color),
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      // color: Colors.redAccent,
                      child: Text(1.10.toStringAsFixed(1)),
                    ),
                  ),
                ],
              ) //Images.network
                  ), //FlexibleSpaceBar
              expandedHeight: 280,
              backgroundColor: Colors.greenAccent[400],
              leading: IconButton(
                icon: const Icon(Icons.menu),
                tooltip: 'Menu',
                onPressed: () {},
              ),
              bottom: const TabBar(
                // padding: EdgeInsets.only(bottom: 30),
                tabs: <Widget>[
                  Tab(icon: Icon(Icons.cloud_outlined)),
                  Tab(icon: Icon(Icons.beach_access_sharp)),
                  Tab(icon: Icon(Icons.brightness_5_sharp)),
                ],
              ),
              actions: <Widget>[
                IconButton(
                  icon: const Icon(Icons.comment),
                  tooltip: 'Comment Icon',
                  onPressed: () {},
                ), //IconButton
                IconButton(
                  icon: const Icon(Icons.settings),
                  tooltip: 'Setting Icon',
                  onPressed: () {},
                ), //IconButton
              ], //<Widget>[]
            ), //SliverAppBar

            SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => ListTile(
                  tileColor: (index % 2 == 0) ? Colors.white : Colors.green[50],
                  title: Center(
                    child: Text('$index',
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 50,
                            color: Colors.greenAccent[400]) //TextStyle
                        ), //Text
                  ), //Center
                ), //ListTile
                childCount: 51,
              ), //SliverChildBuildDelegate
            ) //SliverList
          ], //<Widget>[]
        ) //CustonScrollView
            ),
      ), //Scaffold
      debugShowCheckedModeBanner: false,
      // Remove debug banner for proper
      // view of setting icon
    ); //MaterialApp
  }
}
