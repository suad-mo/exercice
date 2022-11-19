import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MainCollapsingToolbar(),
    );
  }
}

class MainCollapsingToolbar extends StatelessWidget {
  const MainCollapsingToolbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: DefaultTabController(
        length: 2,
        child: NestedScrollView(
            headerSliverBuilder:
                (BuildContext context, bool innerBoxIsScrolled) {
              return <Widget>[
                SliverAppBar(
                  expandedHeight: 200.0,
                  floating: false,
                  pinned: true,
                  title: const Text('Colapsing Toolbar'),
                  automaticallyImplyLeading: true,
                  flexibleSpace: FlexibleSpaceBar(
                      // centerTitle: true,
                      // title: const Text("Collapsing Toolbar",
                      //     style: TextStyle(
                      //       color: Colors.white,
                      //       fontSize: 16.0,
                      //     )),
                      background: Image.network(
                    "https://images.pexels.com/photos/396547/pexels-photo-396547.jpeg?auto=compress&cs=tinysrgb&h=350",
                    fit: BoxFit.cover,
                  )),
                ),
                SliverPersistentHeader(
                  delegate: _SliverAppBarDelegate(
                    const TabBar(
                      labelColor: Colors.blue,
                      unselectedLabelColor: Colors.grey,
                      // labelColor: Colors.black87,
                      // unselectedLabelColor: Colors.grey,
                      tabs: [
                        Tab(
                            child: Text('Tab 1',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),
                        Tab(
                            child: Text('Tab 2',
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16))),

                        // Tab(icon: Icon(Icons.info), text: "Tab 1"),
                        // Tab(icon: Icon(Icons.lightbulb_outline), text: "Tab 2"),
                      ],
                    ),
                  ),
                  pinned: true,
                  floating: false,
                ),
              ];
            },
            body: const TabBarView(
              children: [
                Center(
                  child: Text("Sample text 1"),
                ),
                Center(
                  child: Text("Sample text 2"),
                ),
              ],
            )),
      ),
    );
  }
}

class _SliverAppBarDelegate extends SliverPersistentHeaderDelegate {
  _SliverAppBarDelegate(this._tabBar);

  final TabBar _tabBar;

  @override
  double get minExtent => _tabBar.preferredSize.height;
  @override
  double get maxExtent => _tabBar.preferredSize.height;

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Container(
      child: _tabBar,
    );
  }

  @override
  bool shouldRebuild(_SliverAppBarDelegate oldDelegate) {
    return false;
  }
}

class MyStatelessWidget extends StatelessWidget {
  const MyStatelessWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final List<String> tabs = <String>['Tab 1', 'Tab 2', 'Tab 3'];
    return DefaultTabController(
      length: tabs.length, // This is the number of tabs.
      child: Scaffold(
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxIsScrolled) {
            // These are the slivers that show up in the "outer" scroll view.
            // Ovo su isječci koji se pojavljuju u "spoljnom" prikazu skrolovanja.
            print(innerBoxIsScrolled);
            return <Widget>[
              SliverOverlapAbsorber(
                // This widget takes the overlapping behavior of the SliverAppBar,
                // and redirects it to the SliverOverlapInjector below. If it is
                // missing, then it is possible for the nested "inner" scroll view
                // below to end up under the SliverAppBar even when the inner
                // scroll view thinks it has not been scrolled.
                // This is not necessary if the "headerSliverBuilder" only builds
                // widgets that do not overlap the next sliver.

                // Ovaj widget preuzima ponašanje preklapanja SliverAppBar-a i
                // preusmjerava ga na SliverOverlapInjector ispod. Ako nedostaje,
                // onda je moguće da ugniježđeni "unutrašnji" prikaz za pomicanje
                // ispod završi ispod SliverAppBar čak i kada pogled unutrašnjeg
                // pomicanja misli da nije pomican. Ovo nije potrebno ako
                // "headerSliverBuilder" gradi samo widgete koji se ne preklapaju
                // sa sljedećim isječkom.
                handle:
                    NestedScrollView.sliverOverlapAbsorberHandleFor(context),
                sliver: SliverAppBar(
                  title:
                      const Text('Books'), // This is the title in the app bar.
                  pinned: true,
                  expandedHeight: 250.0,
                  // The "forceElevated" property causes the SliverAppBar to show
                  // a shadow. The "innerBoxIsScrolled" parameter is true when the
                  // inner scroll view is scrolled beyond its "zero" point, i.e.
                  // when it appears to be scrolled below the SliverAppBar.
                  // Without this, there are cases where the shadow would appear
                  // or not appear inappropriately, because the SliverAppBar is
                  // not actually aware of the precise position of the inner
                  // scroll views.

                  // Svojstvo "forceElevated" uzrokuje da SliverAppBar prikaže senku.
                  // Parametar "innerBoxIsScrolled" je istinit kada se pogled unutrašnjeg
                  // pomicanja pomiče iznad svoje "nulte" tačke, tj. kada se čini
                  // da se pomiče ispod SliverAppBar-a. Bez toga, postoje slučajevi
                  // u kojima bi se sjena pojavila ili ne bi se pojavila na neprikladan
                  // način, jer SliverAppBar zapravo nije svjestan precizne pozicije
                  // prikaza unutrašnjeg skrolovanja.
                  forceElevated: innerBoxIsScrolled,
                  bottom: TabBar(
                    // These are the widgets to put in each tab in the tab bar.
                    tabs: tabs.map((String name) => Tab(text: name)).toList(),
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            // These are the contents of the tab views, below the tabs.
            children: tabs.map((String name) {
              return TabWidget(
                context: context,
                name: name,
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

class TabWidget extends StatelessWidget {
  final String name;
  final BuildContext context;

  const TabWidget({
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
        // This Builder is needed to provide a BuildContext that is
        // "inside" the NestedScrollView, so that
        // sliverOverlapAbsorberHandleFor() can find the
        // NestedScrollView.

        // Ovaj Builder je potreban da obezbedi BuildContext koji je
        // "unutar" NestedScrollView, tako da sliverOverlapAbsorberHandleFor()
        // može pronaći NestedScrollView.
        builder: (BuildContext context) {
          return CustomScrollView(
            // The "controller" and "primary" members should be left
            // unset, so that the NestedScrollView can control this
            // inner scroll view.
            // If the "controller" property is set, then this scroll
            // view will not be associated with the NestedScrollView.
            // The PageStorageKey should be unique to this ScrollView;
            // it allows the list to remember its scroll position when
            // the tab view is not on the screen.

            // Članovi "controller" i "primary" trebaju biti nepostavljeni,
            // tako da NestedScrollView može kontrolirati ovaj unutrašnji
            // prikaz pomicanja. Ako je postavljeno svojstvo "controller",
            // onda ovaj prikaz pomicanja neće biti povezan sa NestedScrollView.
            // PageStorageKey bi trebao biti jedinstven za ovaj rollView;
            // omogućava listi da zapamti svoju poziciju pomeranja
            // kada prikaz kartice nije na ekranu.
            key: PageStorageKey<String>(name),
            slivers: <Widget>[
              SliverOverlapInjector(
                // This is the flip side of the SliverOverlapAbsorber
                // above.
                // Ovo je druga strana SliverOverlapAbsorbera iznad.
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
                sliver: SliverFixedExtentList(
                  // The items in this example are fixed to 48 pixels
                  // high. This matches the Material Design spec for
                  // ListTile widgets.

                  itemExtent: 48.0,
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      // This builder is called for each child.
                      // In this example, we just number each list item.
                      // Ovaj graditelj je pozvan za svako dijete.
                      // U ovom primjeru samo numeriramo svaku stavku liste.
                      return ListTile(
                        title: Text('Item $index'),
                      );
                    },
                    // The childCount of the SliverChildBuilderDelegate
                    // specifies how many children this inner list
                    // has. In this example, each tab has a list of
                    // exactly 30 items, but this is arbitrary.
                    childCount: 30,
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
