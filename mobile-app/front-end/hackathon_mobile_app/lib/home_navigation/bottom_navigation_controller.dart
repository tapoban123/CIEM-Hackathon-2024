import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/home_navigation/widgets/custom_bottom_nav_bar.dart';
import 'package:hackathon_mobile_app/home_navigation/widgets/end_drawer.dart';
import 'package:hackathon_mobile_app/pages/community/community_page.dart';
import 'package:hackathon_mobile_app/pages/community/widgets/community_app_bar.dart';
import 'package:hackathon_mobile_app/pages/community/widgets/community_drawer.dart';
import 'package:hackathon_mobile_app/pages/home/home_page.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/courses_search_bar.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/home_appbar.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/home_search_bar.dart';
import 'package:hackathon_mobile_app/pages/notifications_page.dart';
import 'package:hackathon_mobile_app/pages/profile_page.dart';
import 'package:hackathon_mobile_app/pages/student_courses.dart';
import 'package:hackathon_mobile_app/providers/navigation_provider.dart';
import 'package:hackathon_mobile_app/providers/show_or_hide_bnb_provider.dart';
import 'package:hackathon_mobile_app/utils/scaffold_key.dart';

class BottomNavigationController extends ConsumerStatefulWidget {
  const BottomNavigationController({super.key});

  @override
  ConsumerState<BottomNavigationController> createState() =>
      _BottomNavigationFuncState();
}

class _BottomNavigationFuncState
    extends ConsumerState<BottomNavigationController> {
  late int currentPage;
  double navButtonIconSize = 24;
  final FocusNode inputFocusNode = FocusNode();

  List<Widget> pages = const [
    HomePage(),
    CommunityPage(),
    NotificationsPage(),
    ProfilePage(),
    StudentCourses(),
  ];

  String setPageTopBg() {
    if (currentPage == 1) {
      return "assets/images/community_top_bg.png";
    } else {
      return "assets/images/top_bg_img.png";
    }
  }

  Widget setPageAppbar() {
    if (currentPage == 1) {
      return const CommunityAppBar();
    } else {
      return const HomeAppbar();
    }
  }

  Widget? pageSpecificSearchBar() {
    if (currentPage == 0) {
      return HomeSearchBar(inputFocusNode: inputFocusNode);
    } else if (currentPage == 4) {
      return const CoursesSearchBar();
    }
    return null;
  }

  double paddingFromTop() {
    if (currentPage == 0) {
      return 260;
    } else if (currentPage == 1) {
      return 180;
    } else if (currentPage == 2) {
      return 140;
    } else {
      return 200;
    }
  }

  @override
  Widget build(BuildContext context) {
    final showBNB = ref.watch(showOrHideBNBProvider);

    currentPage = ref.watch(navigationProvider);
    final value = View.of(context).viewInsets.bottom;
    if (value == 0) {
      inputFocusNode.unfocus();
    }

    return Scaffold(
      key: ScaffoldKey.scaffoldKey,
      endDrawer: currentPage != 1 ? const EndDrawer() : null,
      resizeToAvoidBottomInset: false,
      drawer: const CommunityDrawer(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
      floatingActionButton: showBNB
          ? CustomBottomNavBar(
              currentPage: currentPage,
              pages: pages,
            )
          : null,
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                setPageTopBg(),
                fit: BoxFit.cover,
              ),
            ),
            setPageAppbar(),
            Positioned(
              top: 120,
              right: 2,
              left: 2,
              bottom: 0,
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(40),
                    topLeft: Radius.circular(40),
                  ),
                  color: Color(0xffe9e3d5),
                ),
              ),
            ),
            if ([0, 2, 4].contains(currentPage))
              Positioned(
                top: 130,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: pageSpecificSearchBar(),
                ),
              ),
            if (currentPage == 1)
              Positioned(
                top: 140,
                left: 80,
                child: Text(
                  "Psychologists' Community",
                  style: Theme.of(context).textTheme.displayLarge,
                ),
              ),
            Positioned(
              top: paddingFromTop(),
              right: 2,
              left: 2,
              bottom: 0,
              child: IndexedStack(
                index: ref.watch(navigationProvider),
                children: pages,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
