import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/courses.dart';
import 'package:hackathon_mobile_app/providers/show_or_hide_bnb_provider.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCourses extends ConsumerStatefulWidget {
  const StudentCourses({super.key});

  @override
  ConsumerState<StudentCourses> createState() => _StudentCoursesState();
}

class _StudentCoursesState extends ConsumerState<StudentCourses> {
  final ScrollController coursesPageController = ScrollController();

  @override
  void initState() {
    super.initState();

    coursesPageController.addListener(
      () {
        final scrollDirection =
            coursesPageController.position.userScrollDirection;

        if (scrollDirection == ScrollDirection.forward) {
          ref.read(showOrHideBNBProvider.notifier).showBNB();
        } else if (scrollDirection == ScrollDirection.reverse) {
          ref.read(showOrHideBNBProvider.notifier).hideBNB();
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 18,
            ),
            Expanded(
              flex: 1,
              child: Text(
                "Courses for You",
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 25),
              ),
            ),
            Expanded(
              flex: 15,
              child: ListView.builder(
                controller: coursesPageController,
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final eachCourse = courses[index];

                  return GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse(eachCourse["url"]);
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: eachCourse["color"]!,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eachCourse["title"]!,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: CustomColors.darkTextColor,
                            ),
                          ),
                          Text(
                            eachCourse["subtitle"]!,
                            style: TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: CustomColors.darkTextColor,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
