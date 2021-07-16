import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:skeletons/skeletons.dart';

import 'widgets/skeleton_test_widget.dart';

void main() {
  testWidgets('test loading (active) skeleton widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(SkeletonTestWidget(
      isLoading: true,
      skeleton: SkeletonListTile(),
      child: Container(
        key: Key("child_widget"),
      ),
    ));

    await tester.pump(Duration.zero);

    expect(
        find.byType(
          Shimmer,
        ),
        findsOneWidget);
    expect(
        find.byType(
          SkeletonListTile,
        ),
        findsOneWidget);
    expect(
        find.byKey(
          Key("child_widget"),
        ),
        findsNothing);
  });

  testWidgets('test loaded (inactive) skeleton widget',
      (WidgetTester tester) async {
    await tester.pumpWidget(SkeletonTestWidget(
      isLoading: false,
      skeleton: SkeletonListTile(),
      child: Container(
        key: Key("child_widget"),
      ),
    ));

    await tester.pump(Duration.zero);

    expect(
        find.byType(
          ShimmerWidget,
        ),
        findsNothing);
    expect(
        find.byType(
          SkeletonListTile,
        ),
        findsNothing);
    expect(
        find.byKey(
          Key("child_widget"),
        ),
        findsOneWidget);
  });

  testWidgets('test skeleton listview widget', (WidgetTester tester) async {
    tester.binding.window.physicalSizeTestValue = Size(1080, 2160);
    await tester.pumpWidget(SkeletonTestWidget(
      isLoading: true,
      skeleton: SkeletonListView(
        itemBuilder: (context, index) {
          return SkeletonListTile(key: Key("item_$index"));
        },
      ),
      child: Container(),
    ));

    await tester.pump(Duration.zero);

    // test visible items:
    expect(
        find.byType(
          SkeletonListTile,
        ),
        findsWidgets);
    expect(
        find.byKey(
          Key("item_0"),
        ),
        findsWidgets);

    expect(
        find.byKey(
          Key("item_10"),
        ),
        findsWidgets);

    // try to scroll down (wont)
    final gesture1 =
        await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture1.moveBy(Offset(0, -300)); //How much to scroll by
    await tester.pump();

    // finds nothing since scrolling disabled.
    expect(
        find.byKey(
          Key("item_15"),
        ),
        findsNothing);

    await tester.pumpWidget(SkeletonTestWidget(
      isLoading: true,
      skeleton: SkeletonListView(
        scrollable: true,
        itemBuilder: (context, index) {
          return SkeletonListTile(key: Key("item_$index"));
        },
      ),
      child: Container(),
    ));

    // try to scroll down
    final gesture2 =
        await tester.startGesture(Offset(0, 300)); //Position of the scrollview
    await gesture2.moveBy(Offset(0, -300)); //How much to scroll by
    await tester.pump();

    // finds nothing, not visible anymore.
    expect(
        find.byKey(
          Key("item_1"),
        ),
        findsNothing);

    // finds one visible, since scrolling is enabled this time.
    expect(
        find.byKey(
          Key("item_15"),
        ),
        findsOneWidget);
  });

  testWidgets('test default theme', (WidgetTester tester) async {
    await tester.pumpWidget(SkeletonTestWidget(
      isLoading: true,
      skeleton: SkeletonParagraph(),
      child: Container(),
    ));

    await tester.pump(Duration.zero);

    // final finder = find.byType(Shimmer);
    // final Shimmer shimmerWidget = tester.firstWidget(finder);

    final ShimmerState shimmerState = tester.state(find.byType(ShimmerWidget));

    expect(shimmerState.gradient, SHIMMER_GRADIENT);
  });

  testWidgets('test skeletons dark theme mode', (WidgetTester tester) async {
    await tester.pumpWidget(SkeletonTheme(
      themeMode: ThemeMode.dark,
      child: SkeletonTestWidget(
        isLoading: true,
        skeleton: SkeletonListView(
            item: SkeletonListTile(
          hasLeading: true,
          hasSubtitle: false,
          leadingStyle: SkeletonAvatarStyle(
            shape: BoxShape.circle,
          ),
        )),
        child: Container(),
      ),
    ));

    await tester.pump(Duration.zero);

    final ShimmerState shimmerState = tester.state(find.byType(ShimmerWidget));

    expect(shimmerState.gradient, DARK_SHIMMER_GRADIENT);
  });

  testWidgets('test skeletons custom theme', (WidgetTester tester) async {
    LinearGradient _customGradient = LinearGradient(
      colors: [
        Color(0xFF9AFFC1),
        Color(0xFF29D86C),
        Color(0xFF9AFFC1),
      ],
      stops: [
        0.0,
        0.5,
        1.0,
      ],
      tileMode: TileMode.clamp,
    );

    await tester.pumpWidget(SkeletonTheme(
      themeMode: ThemeMode.light,
      shimmerGradient: _customGradient,
      child: SkeletonTestWidget(
        isLoading: true,
        skeleton: SkeletonListView(
          item: SkeletonListTile(
            hasLeading: true,
            hasSubtitle: false,
            leadingStyle: SkeletonAvatarStyle(
              shape: BoxShape.circle,
            ),
          ),
        ),
        child: Container(),
      ),
    ));

    await tester.pump(Duration.zero);

    final ShimmerState shimmerState = tester.state(find.byType(ShimmerWidget));

    expect(shimmerState.gradient, _customGradient);
  });
}
