import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tutorial_coach_mark/tutorial_coach_mark.dart';
import '../widgets/Colection_item_scroll.dart';
import '../widgets/News_Tile_Scroll.dart';
import '../widgets/App_Bar.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({super.key});
  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final ScrollController _scrollController = ScrollController();
  final GlobalKey _appBarTitleKey = GlobalKey();
  final GlobalKey _collectionsKey = GlobalKey();
  final GlobalKey _newsListKey = GlobalKey();
  late TutorialCoachMark tutorialCoachMark;
  List<TargetFocus> targets = [];

  void _scrollToTop() {
    _scrollController.animateTo(
      0.0,
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeOut,
    );
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => _maybeShowTutorial());
  }

  Future<void> _maybeShowTutorial() async {
    final prefs = await SharedPreferences.getInstance();
    final seen = prefs.getBool('home_tutorial_seen') ?? false;
    if (seen) return;
    _initTargets();
    tutorialCoachMark = TutorialCoachMark(
      targets: targets,
      colorShadow: Colors.black.withOpacity(0.6),
      textSkip: "تخطي",
      onFinish: () async { await prefs.setBool('home_tutorial_seen', true); },
      onSkip: () { prefs.setBool('home_tutorial_seen', true); return true; },
    );
    await Future.delayed(const Duration(milliseconds: 300));
    if (!mounted) return;
    tutorialCoachMark.show(context: context);
  }

  void _initTargets() {
    targets = [
      TargetFocus(
        identify: "appbar_title",
        keyTarget: _appBarTitleKey,
        contents: [
          TargetContent(
            align: ContentAlign.bottom,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("شعار التطبيق", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("اضغط على العنوان للرجوع لأعلى الصفحة", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "collections",
        keyTarget: _collectionsKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("اختيار الدولة", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("اسحب يمين/يسار واختر دولة لرؤية أخبارها", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
      TargetFocus(
        identify: "news_list",
        keyTarget: _newsListKey,
        contents: [
          TargetContent(
            align: ContentAlign.top,
            child: Directionality(
              textDirection: TextDirection.rtl,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: const [
                  Text("قائمة الأخبار", style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold)),
                  SizedBox(height: 8),
                  Text("تصفح آخر العناوين وسوّب لأعلى لمزيد من الأخبار", style: TextStyle(color: Colors.white)),
                ],
              ),
            ),
          ),
        ],
      ),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: App_Bar(ontap: _scrollToTop, titleKey: _appBarTitleKey),
      body: CustomScrollView(
        controller: _scrollController,
        slivers: [
          SliverToBoxAdapter(
            child: KeyedSubtree(key: _collectionsKey, child: ColectionItemScroll()),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 20),
          ),
          SliverToBoxAdapter(
            child: SizedBox(height: 4),
          ),
          KeyedSubtree(
            key: _newsListKey,
            child: NewsTileScroll(source: 'EG',),
          ),
        ],
      ),
    );
  }
}
