import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/e_books.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/e_books_card.dart';
import 'package:hackathon_mobile_app/providers/show_or_hide_bnb_provider.dart';

class StudentEbooksPage extends ConsumerStatefulWidget {
  const StudentEbooksPage({super.key});

  @override
  ConsumerState<StudentEbooksPage> createState() => _StudentEbooksPageState();
}

class _StudentEbooksPageState extends ConsumerState<StudentEbooksPage> {
  final ScrollController eBookPageScrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    eBookPageScrollController.addListener(
      () {
        final ScrollDirection scrollDirection =
            eBookPageScrollController.position.userScrollDirection;

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
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 18,
          ),
          Expanded(
            flex: 1,
            child: Text(
              "E-Books for you",
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    fontSize: 25,
                  ),
            ),
          ),
          Expanded(
            flex: 16,
            child: GridView.builder(
              padding: EdgeInsets.only(top: 2),
              scrollDirection: Axis.vertical,
              controller: eBookPageScrollController,
              itemCount: eBooks.length,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 5,
                mainAxisSpacing: 10,
                childAspectRatio: 0.7,
              ),
              itemBuilder: (context, index) {
                final eachEbook = eBooks[index];

                return EBooksCard(
                  eBookImageUrl: eachEbook['url'],
                  eBookUrl: eachEbook["access_url"],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
