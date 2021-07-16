import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class SkeletonTestWidget extends StatefulWidget {
  final bool isLoading;
  final Widget skeleton;
  final Widget child;

  const SkeletonTestWidget({
    Key? key,
    this.isLoading = true,
    required this.skeleton,
    required this.child,
  }) : super(key: key);

  @override
  SkeletonTestWidgetState createState() => SkeletonTestWidgetState();
}

class SkeletonTestWidgetState extends State<SkeletonTestWidget> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'SkeletonListView Test',
      home: Scaffold(
        // backgroundColor: Color(0xFF0E0E0E),
        appBar: AppBar(
          title: Text("Example"),
        ),
        body: Skeleton(
          isLoading: widget.isLoading,
          skeleton: widget.skeleton,
          child: widget.child,
        ),
      ),
      // home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
