import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class ItemsExamplePage extends StatelessWidget {
  const ItemsExamplePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: Color(0xFF0E0E0E),
      appBar: AppBar(
        title: Text("Items"),
      ),
      body: ListView(
        padding: EdgeInsets.symmetric(vertical: 16),
        children: [
          _linesView(),
          SizedBox(
            height: 16,
          ),
          _avatarsView(),
          SizedBox(
            height: 16,
          ),
          _listTilesView(),
          SizedBox(
            height: 16,
          ),
          _paragraphsView(),
        ],
      ),
    );
  }

  Widget _linesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "SkeletonLine",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        SkeletonLine(),
        SkeletonLine(
          style: SkeletonLineStyle(
            padding: EdgeInsets.all(16.0),
            borderRadius: BorderRadius.circular(24),
          ),
        ),
        SkeletonLine(
          style: SkeletonLineStyle(
            padding: EdgeInsets.symmetric(horizontal: 24.0),
            height: 11,
          ),
        ),
        SkeletonLine(
          style: SkeletonLineStyle(
              padding: EdgeInsets.all(16.0),
              borderRadius: BorderRadius.circular(8),
              height: 28,
              randomLength: true),
        ),
      ],
    );
  }

  Widget _avatarsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "SkeletonAvatar",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            VerticalDivider(),
            SkeletonAvatar(),
            VerticalDivider(),
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  borderRadius: BorderRadius.circular(8),
                  height: 62,
                  width: 62),
            ),
            VerticalDivider(),
            SkeletonAvatar(
              style: SkeletonAvatarStyle(
                  shape: BoxShape.circle, height: 72, width: 72),
            ),
            VerticalDivider(),
            SkeletonAvatar(
              style: SkeletonAvatarStyle(height: 96, width: 72),
            ),
          ],
        ),
      ],
    );
  }

  Widget _listTilesView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "SkeletonListTile",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        SkeletonListTile(
          padding: EdgeInsets.symmetric(horizontal: 16),
        ),
        SkeletonListTile(
          hasSubtitle: true,
          padding: EdgeInsets.all(16),
        ),
        SkeletonListTile(
          hasSubtitle: true,
          padding: EdgeInsets.symmetric(horizontal: 16),
          leadingStyle: SkeletonAvatarStyle(
              shape: BoxShape.circle, width: 64, height: 64),
          titleStyle:
              SkeletonLineStyle(borderRadius: BorderRadius.circular(16)),
          subtitleStyle: SkeletonLineStyle(
              borderRadius: BorderRadius.circular(16),
              randomLength: true,
              maxLength: 128),
          verticalSpacing: 16,
        ),
        SkeletonListTile(
          hasSubtitle: true,
          padding: EdgeInsets.all(16),
          leadingStyle: SkeletonAvatarStyle(
              shape: BoxShape.circle, width: 72, height: 72),
          titleStyle: SkeletonLineStyle(height: 18),
          subtitleStyle: SkeletonLineStyle(
            height: 12,
            maxLength: 172,
            minLength: 128,
          ),
          verticalSpacing: 16,
          contentSpacing: 6,
          trailing: SkeletonAvatar(
            style: SkeletonAvatarStyle(
                height: 32,
                width: 50,
                borderRadius: BorderRadius.circular(4),
                padding: EdgeInsetsDirectional.only(start: 16)),
          ),
        ),
      ],
    );
  }

  Widget _paragraphsView() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Text(
            "SkeletonParagraph",
            style: TextStyle(fontSize: 20),
          ),
        ),
        Divider(),
        SkeletonParagraph(),
        Divider(),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                  height: 16,
                  randomLength: true,
                  borderRadius: BorderRadius.circular(16))),
        ),
        Divider(),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 8,
              spacing: 6,
              lineStyle: SkeletonLineStyle(
                height: 12,
                randomLength: true,
              )),
        ),
        Divider(),
        SkeletonParagraph(
          style: SkeletonParagraphStyle(
              lines: 5,
              spacing: 8,
              lineStyle: SkeletonLineStyle(
                alignment: Alignment.center,
                height: 12,
                randomLength: true,
              )),
        ),
        Divider(),
      ],
    );
  }
}
