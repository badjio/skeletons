import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonThemeExamplePage extends StatefulWidget {
  @override
  _SkeletonThemeExamplePageState createState() =>
      _SkeletonThemeExamplePageState();
}

class _SkeletonThemeExamplePageState extends State<SkeletonThemeExamplePage> {
  bool _isLoading = true;

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFC7E5EE),
      appBar: AppBar(
        title: Text("SkeletonTheme"),
      ),
      body: SkeletonTheme(
        themeMode: ThemeMode.light,
        shimmerGradient: LinearGradient(
          colors: [
            Color(0xFF67C5E2),
            Color(0xFF18A6D1),
            Color(0xFF67C5E2),
          ],
          stops: [
            0.1,
            0.5,
            0.9,
          ],
        ),
        child: Skeleton(
          duration: Duration(milliseconds: 800),
          isLoading: _isLoading,
          skeleton: SkeletonListView(
              item: SkeletonListTile(
            contentSpacing: 24,
            padding: EdgeInsets.symmetric(vertical: 16),
            leadingStyle: SkeletonAvatarStyle(width: 32, height: 24),
            titleStyle:
                SkeletonLineStyle(borderRadius: BorderRadius.circular(4)),
            hasSubtitle: false,
          )),
          child: _contentView(),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _toggleLoading,
        child: Icon(
          _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
        ),
      ),
    );
  }

  Widget _contentView() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 16),
          child: Row(
            children: [
              Icon(
                Icons.panorama,
                size: 28,
              ),
              SizedBox(
                width: 24,
              ),
              Expanded(
                child: Text(
                  "Lorem ipsum dolor sit amet.",
                  style: Theme.of(context).textTheme.headlineSmall,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ),
      );
}
