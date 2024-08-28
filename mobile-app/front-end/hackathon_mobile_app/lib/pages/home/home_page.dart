import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/data/e_books.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/featured_courses_card.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
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

                        return Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: GestureDetector(
                            onTap: () async {
                              Uri url = Uri.parse(eachEbook["access_url"]);
                              await launchUrl(
                                url,
                                mode: LaunchMode.externalApplication,
                              );
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.blueGrey,
                                borderRadius: BorderRadius.circular(20),
                              ),
                              child: Image.network(
                                eachEbook['url'],
                                fit: BoxFit.fill,
                                height: 20,
                              ),
                            ),
                          ),
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
                    height: 200,
                    child: ListView.builder(
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        if (index % 2 == 0) {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 0),
                            alignment: Alignment.centerLeft,
                            decoration: const BoxDecoration(),
                            child: const Chip(
                              label: Text(
                                "Sustainable Success: A Framework for Optimizing Profit ~By Nicholas Piscani",
                                style: TextStyle(fontSize: 8.5),
                              ),
                            ),
                          );
                        } else {
                          return Container(
                            margin: const EdgeInsets.only(bottom: 0),
                            alignment: Alignment.centerRight,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const Chip(
                              label: Text(
                                "Making short films is a powerful way to learn job skills ~ By Wendy Smidt",
                                style: TextStyle(fontSize: 8.5),
                                softWrap: true,
                              ),
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
