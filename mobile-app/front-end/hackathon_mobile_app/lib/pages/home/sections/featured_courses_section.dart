import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/featured_courses_card.dart';

class FeaturedCoursesSection extends StatelessWidget {
  const FeaturedCoursesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Featured Courses",
          style: Theme.of(context).textTheme.displayLarge,
        ),
        const SizedBox(
          height: 10,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            FeaturedCoursesCard(
              cardColor: const Color(0xffFF7340),
              cardImage: SizedBox(
                height: 70,
                width: double.infinity,
                child: Image.asset(
                  "assets/images/finance.png",
                  fit: BoxFit.scaleDown,
                ),
              ),
              titleText: "Finance",
              subtitleText: "22 lessons",
            ),
            FeaturedCoursesCard(
              cardColor: const Color(0xff624CAB),
              cardImage: SizedBox(
                height: 70,
                width: 70,
                child: Image.asset(
                  "assets/images/dev.png",
                  fit: BoxFit.cover,
                ),
              ),
              titleText: "Web-Dev",
              subtitleText: "27 lessons",
            ),
            FeaturedCoursesCard(
              cardColor: const Color(0xff25C3DB),
              cardImage: SizedBox(
                height: 50,
                width: 50,
                child: Image.asset(
                  "assets/images/cam.png",
                  fit: BoxFit.cover,
                ),
              ),
              titleText: "Film-making",
              subtitleText: "25 lessons",
            ),
          ],
        ),
      ],
    );
  }
}
