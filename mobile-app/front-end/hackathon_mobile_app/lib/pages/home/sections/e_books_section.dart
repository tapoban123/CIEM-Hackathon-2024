import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/e_books.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/e_books_card.dart';
import 'package:hackathon_mobile_app/providers/navigation_provider.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:hackathon_mobile_app/utils/enums.dart';

class EBooksSection extends ConsumerWidget {
  const EBooksSection({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "E-Books",
              style: Theme.of(context).textTheme.displayLarge,
            ),
            GestureDetector(
              onTap: () {
                ref
                    .read(navigationProvider.notifier)
                    .navigateToPage(PageNumber.ebooksPage);
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
          height: 250,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: 5,
            itemBuilder: (context, index) {
              final eachEbook = eBooks[index];

              return EBooksCard(
                eBookImageUrl: eachEbook['url'],
                eBookUrl: eachEbook["access_url"],
              );
            },
          ),
        ),
      ],
    );
  }
}
