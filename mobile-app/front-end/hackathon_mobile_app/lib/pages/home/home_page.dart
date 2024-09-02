import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/pages/home/sections/articles_section.dart';
import 'package:hackathon_mobile_app/pages/home/sections/courses_section.dart';
import 'package:hackathon_mobile_app/pages/home/sections/e_books_section.dart';
import 'package:hackathon_mobile_app/pages/home/sections/featured_courses_section.dart';
import 'package:hackathon_mobile_app/providers/show_or_hide_bnb_provider.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  final ScrollController homePageScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    homePageScrollController.addListener(
      () {
        final scrollDirection =
            homePageScrollController.position.userScrollDirection;

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
    return SingleChildScrollView(
      controller: homePageScrollController,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height + 200,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  FeaturedCoursesSection(),
                  const SizedBox(
                    height: 20,
                  ),
                  EBooksSection(),
                  const SizedBox(
                    height: 20,
                  ),
                  CoursesSection(),
                  const SizedBox(
                    height: 20,
                  ),
                  ArticlesSection(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
