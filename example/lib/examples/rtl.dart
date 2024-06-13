import 'dart:math';

import 'package:flutter/material.dart';
import 'package:skeletons/skeletons.dart';

class RtlExamplePage extends StatefulWidget {
  @override
  _RtlExamplePageState createState() => _RtlExamplePageState();
}

class _RtlExamplePageState extends State<RtlExamplePage> {
  bool _isLoading = true;

  final random = new Random();

  String randomText() => texts[random.nextInt(5)];

  final List<String> texts = [
    "لوريم ايبسوم دولار سيت أميت ,كونسيكتيتور أدايبا يسكينج أليايت",
    "سيت دو أيوسمود تيمبور أنكايديديونتيوت لابوري ات دولار ماجنا أليكيوا",
    "يوت انيم أد مينيم فينايم,كيواس نوستريد أكسير سيتاشن",
    "ديواس أيوتي أريري دولار إن ريبريهينديرأيت فوليوبتاتي فيلايت أيسسي كايلليوم دولار",
    "سيونت ان كيولبا كيو أوفيسيا ديسيريونتموليت انيم أيدي ايست لابوريوم",
    "سيت يتبيرسبايكياتيس يوندي أومنيس أستي ناتيس أيررور سيت فوليبتاتيم أكيسأنتييوم دولاريمكيو لايودانتيوم",
  ];

  void _toggleLoading() {
    setState(() {
      _isLoading = !_isLoading;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        appBar: AppBar(
          title: Text("Right-To-Left"),
        ),
        body: Skeleton(
          isLoading: _isLoading,
          skeleton: _skeletonView(),
          child: _contentView(),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _toggleLoading,
          child: Icon(
            _isLoading ? Icons.hourglass_full : Icons.hourglass_bottom,
          ),
        ),
      ),
    );
  }

  Widget _skeletonView() => SkeletonListView(
        item: SkeletonListTile(
          verticalSpacing: 12,
          leadingStyle: SkeletonAvatarStyle(
              width: 64, height: 64, shape: BoxShape.circle),
          titleStyle: SkeletonLineStyle(
              height: 16,
              minLength: MediaQuery.of(context).size.width / 2,
              randomLength: true,
              borderRadius: BorderRadius.circular(12)),
          subtitleStyle: SkeletonLineStyle(
              height: 12,
              minLength: MediaQuery.of(context).size.width * 2 / 3,
              randomLength: true,
              borderRadius: BorderRadius.circular(12)),
          hasSubtitle: true,
        ),
      );

  Widget _contentView() => ListView.builder(
        padding: EdgeInsets.symmetric(horizontal: 16.0),
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: Row(
            children: [
              Container(
                width: 64,
                height: 64,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage("assets/placeholder.png")),
                  shape: BoxShape.circle,
                ),
              ),
              SizedBox(
                width: 8,
              ),
              Expanded(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    randomText(),
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(fontSize: 16, fontWeight: FontWeight.w600),
                    maxLines: 1,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    randomText(),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ))
            ],
          ),
        ),
      );
}
//  ListView.builder(
//         physics: NeverScrollableScrollPhysics(),
//         itemBuilder: (context, index) => Container(),
//       )
