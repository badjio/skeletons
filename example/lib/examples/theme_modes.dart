import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ThemeModesExamplePage extends StatefulWidget {
  @override
  _ThemeModesExamplePageState createState() => _ThemeModesExamplePageState();
}

class _ThemeModesExamplePageState extends State<ThemeModesExamplePage> {
  bool _isLoading = true;
  ThemeMode _themeMode = ThemeMode.light;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  void _toggleThemeMode() {
    setState(() {
      _themeMode =
          _themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SkeletonTheme(
      shimmerGradient: LinearGradient(
        colors: [
          Color(0xFFD8E3E7),
          Color(0xFFC8D5DA),
          Color(0xFFD8E3E7),
        ],
        stops: [
          0.1,
          0.5,
          0.9,
        ],
      ),
      darkShimmerGradient: LinearGradient(
        colors: [
          Color(0xFF222222),
          Color(0xFF242424),
          Color(0xFF2B2B2B),
          Color(0xFF242424),
          Color(0xFF222222),
        ],
        stops: [
          0.0,
          0.2,
          0.5,
          0.8,
          1,
        ],
        begin: Alignment(-2.4, -0.2),
        end: Alignment(2.4, 0.2),
        tileMode: TileMode.clamp,
      ),
      child: MaterialApp(
        themeMode: _themeMode,
        theme: _lightTheme,
        darkTheme: _darkTheme,
        home: Scaffold(
            // backgroundColor: Color(0xFFC7E5EE),
            appBar: AppBar(
              title: Text("Theme Modes"),
              leading: IconButton(
                icon: Icon(
                  Icons.chevron_left,
                  size: 30,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
            ),
            body: Skeleton(
              duration: Duration(milliseconds: 800),
              isLoading: _isLoading,
              skeleton: _skeletonView(),
              child: _contentView(),
            ),
            floatingActionButtonLocation:
                FloatingActionButtonLocation.centerDocked,
            floatingActionButton: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  FloatingActionButton(
                    heroTag: "THEME_MODE_ACTION_BUTTON",
                    onPressed: _toggleThemeMode,
                    child: Icon(_themeMode == ThemeMode.light
                        ? Icons.wb_sunny
                        : Icons.nightlight_round),
                  ),
                  FloatingActionButton(
                    heroTag: "LOADING_ACTION_BUTTON",
                    onPressed: _toggleLoading,
                    child: Icon(
                      _isLoading
                          ? Icons.hourglass_full
                          : Icons.hourglass_bottom,
                    ),
                  )
                ],
              ),
            )),
      ),
    );
  }

  Widget _skeletonView() => SkeletonListView(
      scrollable: true,
      item: SkeletonListTile(
        contentSpacing: 12,
        verticalSpacing: 12,
        padding: EdgeInsets.symmetric(vertical: 12),
        leadingStyle: SkeletonAvatarStyle(
            width: 64, height: 64, borderRadius: BorderRadius.circular(8)),
        titleStyle: SkeletonLineStyle(borderRadius: BorderRadius.circular(4)),
        subtitleStyle: SkeletonLineStyle(
            borderRadius: BorderRadius.circular(4),
            randomLength: true,
            minLength: MediaQuery.of(context).size.width / 3,
            maxLength: MediaQuery.of(context).size.width / 2),
        hasSubtitle: true,
      ));

  Widget _contentView() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      image: AssetImage("assets/placeholder.png")),
                ),
              ),
              SizedBox(
                width: 12,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Lorem ipsum dolor sit amet.",
                    style: Theme.of(context).textTheme.headlineSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text("Lorem ipsum dolor sit."),
                ],
              ))
            ],
          ),
        ),
      );
}

ThemeData _lightTheme = ThemeData(
  brightness: Brightness.light,
);

ThemeData _darkTheme = ThemeData(
  brightness: Brightness.dark,
);
