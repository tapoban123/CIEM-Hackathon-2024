import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/data/articles.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/articles_card.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:hackathon_mobile_app/utils/screen_measurements.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlesSection extends StatelessWidget {
  const ArticlesSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Articles",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            Text(
              "View all",
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                    color: CustomColors.darkTextColor,
                    decoration: TextDecoration.underline,
                  ),
            )
          ],
        ),
        const SizedBox(
          height: 10,
        ),
        SizedBox(
          height: ScreenMeasurements.screenHeight(context) * 0.245,
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
    );
  }
}
