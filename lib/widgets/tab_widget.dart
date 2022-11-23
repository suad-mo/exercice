import 'package:flutter/material.dart';

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
                      childCount: 20,
                    ),
                  ),
                ),
              ]);
        },
      ),
    );
  }
}
