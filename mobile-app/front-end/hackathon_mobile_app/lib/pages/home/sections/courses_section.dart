import 'package:any_link_preview/any_link_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/courses.dart';
import 'package:hackathon_mobile_app/providers/navigation_provider.dart';
import 'package:hackathon_mobile_app/providers/show_or_hide_bnb_provider.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:hackathon_mobile_app/utils/enums.dart';
import 'package:url_launcher/url_launcher_string.dart';

class CoursesSection extends ConsumerWidget {
  const CoursesSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Courses",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(),
            ),
            GestureDetector(
              onTap: () {
                ref
                    .read(navigationProvider.notifier)
                    .navigateToPage(PageNumber.coursesPage);
                ref.invalidate(showOrHideBNBProvider);
              },
              child: Text(
                "View all",
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: CustomColors.darkTextColor,
                      decoration: TextDecoration.underline,
                    ),
              ),
            ),
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: 220,
          child: ListView.builder(
            itemCount: 5,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final eachCourse = courses[index];

              return Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: Container(
                  width: 250,
                  height: 100,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                    color: Colors.grey.withOpacity(0.5),
                  ),
                  child: AnyLinkPreview(
                    link: eachCourse["url"],
                    borderRadius: 15,
                    removeElevation: true,
                    placeholderWidget: Center(
                      child: CircularProgressIndicator(),
                    ),
                    bodyTextOverflow: TextOverflow.ellipsis,
                    displayDirection: UIDirection.uiDirectionVertical,
                    titleStyle:
                        Theme.of(context).textTheme.displayMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              overflow: TextOverflow.ellipsis,
                              color: CustomColors.darkTextColor,
                            ),
                    urlLaunchMode: LaunchMode.externalApplication,
                    bodyMaxLines: 3,
                    bodyStyle:
                        Theme.of(context).textTheme.displaySmall!.copyWith(
                              overflow: TextOverflow.ellipsis,
                              color: CustomColors.darkTextColor,
                            ),
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
