import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/articles.dart';
import 'package:hackathon_mobile_app/data/e_books.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/articles_card.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/e_books_card.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/featured_courses_card.dart';
import 'package:hackathon_mobile_app/providers/show_or_hide_bnb_provider.dart';
import 'package:hackathon_mobile_app/utils/screen_measurements.dart';
import 'package:url_launcher/url_launcher.dart';

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
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "E-Books",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: 250,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: generalEBooks.length,
                      itemBuilder: (context, index) {
                        final eachEbook = generalEBooks[index];

                        return EBooksCard(
                          eBookImageUrl: eachEbook['url'],
                          eBookUrl: eachEbook["access_url"],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    "Articles",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    height: ScreenMeasurements.screenHeight(context) * 0.34,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: articles.length,
                      itemBuilder: (context, index) {
                        final eachArticle = articles[index];

                        if (index % 2 == 0) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              children: [
                                ArticlesCard(
                                  text: eachArticle["title"],
                                  onTap: () async {
                                    Uri url = Uri.parse(eachArticle["url"]);
                                    await launchUrl(
                                      url,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  },
                                  cardColor: eachArticle["color"],
                                )
                              ],
                            ),
                          );
                        } else {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 5.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                ArticlesCard(
                                  text: eachArticle["title"],
                                  onTap: () async {
                                    Uri url = Uri.parse(eachArticle["url"]);
                                    await launchUrl(
                                      url,
                                      mode: LaunchMode.externalApplication,
                                    );
                                  },
                                  cardColor: eachArticle["color"],
                                ),
                              ],
                            ),
                          );
                        }
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
