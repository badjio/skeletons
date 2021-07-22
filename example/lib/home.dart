import 'package:example/examples/custom_shimmer_gradient.dart';
import 'package:example/examples/items.dart';
import 'package:example/examples/list_view_cards.dart';
import 'package:example/examples/list_view_custom.dart';
import 'package:example/examples/rtl.dart';
import 'package:example/examples/theme_modes.dart';
import 'package:flutter/material.dart';

import 'examples/list_view_default.dart';
import 'examples/skeleton_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Skeletons Examples"),
      ),
      body: Center(
        child: ListView(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          children: [
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => ItemsExamplePage()))),
              child: Text(
                "Items",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => ListViewExample1Page()))),
              child: Text(
                "List View (Default)",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => ListViewExample2Page()))),
              child: Text(
                "List View (Custom List Tiles)",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => ListviewCardsExamplePage()))),
              child: Text(
                "List View (Cards)",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => SkeletonThemeExamplePage()))),
              child: Text(
                "SkeletonTheme",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => ThemeModesExamplePage()))),
              child: Text(
                "Light/Dark Mode",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push(
                  (MaterialPageRoute(builder: (context) => RtlExamplePage()))),
              child: Text(
                "Right-To-Left",
                style: TextStyle(fontSize: 20),
              ),
            ),
            Divider(),
            TextButton(
              onPressed: () => Navigator.of(context).push((MaterialPageRoute(
                  builder: (context) => CustomShimmerGradientExamplePage()))),
              child: Text(
                "Custom Shimmer Gradient",
                style: TextStyle(fontSize: 20),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
