import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_mobile_app/home_navigation/widgets/end_drawer.dart';
import 'package:hackathon_mobile_app/home_navigation/widgets/nav_button.dart';
import 'package:hackathon_mobile_app/pages/community_page.dart';
import 'package:hackathon_mobile_app/pages/home/home_page.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/home_search_bar.dart';
import 'package:hackathon_mobile_app/pages/notifications_page.dart';
import 'package:hackathon_mobile_app/pages/profile_page.dart';
import 'package:hackathon_mobile_app/pages/student_courses.dart';
import 'package:hackathon_mobile_app/providers/navigation_provider.dart';
import 'package:hackathon_mobile_app/utils/scaffold_key.dart';

class BottomNavigationFunc extends ConsumerStatefulWidget {
  const BottomNavigationFunc({super.key});

  @override
  ConsumerState<BottomNavigationFunc> createState() =>
      _BottomNavigationFuncState();
}

class _BottomNavigationFuncState extends ConsumerState<BottomNavigationFunc> {
  late int currentPage;
  double navButtonIconSize = 24;
  // final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  final FocusNode inputFocusNode = FocusNode();

  List<Widget> pages = const [
    HomePage(),
    CommunityPage(),
    NotificationsPage(),
    ProfilePage(),
    StudentCourses(),
  ];

  void onNavButtonPressed(int pageNumber) {
    ref.read(navigationProvider.notifier).navigateToPage(pageNumber);
  }

  List<IconData> navButtonsIcons = [
    Icons.home_outlined,
    CupertinoIcons.person_3,
    CupertinoIcons.bell,
    Icons.person_2_outlined
  ];

  @override
  Widget build(BuildContext context) {
    currentPage = ref.watch(navigationProvider);
    final value = View.of(context).viewInsets.bottom;
    if (value == 0) {
      inputFocusNode.unfocus();
    }
    return Scaffold(
      key: ScaffoldKey.scaffoldKey,
      endDrawer: const EndDrawer(),
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: ListView.separated(
                shrinkWrap: true,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                scrollDirection: Axis.horizontal,
                separatorBuilder: (context, index) => const SizedBox(
                  width: 15,
                ),
                itemCount: pages.length - 1,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: NavButton(
                      onTap: () => onNavButtonPressed(index),
                      buttonIcon: navButtonsIcons[index],
                      iconSize: index == currentPage ? 28 : 24,
                      iconColor: index == currentPage
                          ? Colors.white
                          : Colors.white.withOpacity(0.5),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            SizedBox(
              width: double.infinity,
              child: Image.asset(
                "assets/images/top_bg_img.png",
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 40,
              left: 10,
              right: 16,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white,
                          ),
                          child: const Icon(
                            Icons.person,
                            color: Colors.black,
                          ),
                        ),
                        const SizedBox(
                          width: 200,
                          child: ListTile(
                            title: Text(
                              "Tapoban Ray",
                              overflow: TextOverflow.ellipsis,
                            ),
                            subtitle: Text("Student"),
                          ),
                        ),
                      ],
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldKey.scaffoldKey.currentState!.openEndDrawer();
                      },
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: SvgPicture.asset(
                          "assets/images/jam_menu.svg",
                          height: 15,
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
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
            Positioned(
              top: 130,
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: HomeSearchBar(
                  inputFocusNode: inputFocusNode,
                ),
              ),
            ),
            Positioned(
              top: 260,
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
