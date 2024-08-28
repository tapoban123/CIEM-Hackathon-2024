import 'package:flutter/material.dart';

class FeaturedCoursesCard extends StatelessWidget {
  final Color cardColor;
  final Widget cardImage;
  final String titleText;
  final String subtitleText;

  const FeaturedCoursesCard({
    super.key,
    required this.cardColor,
    required this.cardImage,
    required this.titleText,
    required this.subtitleText,
  });

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.of(context).size.width;

    return Container(
      height: screenWidth * 0.3,
      width: screenWidth * 0.3,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(18),
        color: cardColor,
      ),
      child: Padding(
        padding: const EdgeInsets.only(
          left: 15.0,
          top: 10.0,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  titleText,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontSize: 18,
                        fontWeight: FontWeight.w500,
                      ),
                ),
                Text(
                  subtitleText,
                  style: Theme.of(context).textTheme.displaySmall!.copyWith(
                        fontSize: 10,
                      ),
                ),
              ],
            ),
            Align(
              alignment: Alignment.bottomRight,
              child: cardImage,
            )
          ],
        ),
      ),
    );
  }
}
