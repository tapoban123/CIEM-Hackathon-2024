import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';
import 'package:url_launcher/url_launcher.dart';

class EBooksCard extends StatelessWidget {
  final String eBookUrl;
  final String eBookImageUrl;

  const EBooksCard({
    super.key,
    required this.eBookImageUrl,
    required this.eBookUrl,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: GestureDetector(
        onTap: () async {
          showDialog(
            context: context,
            builder: (context) => AlertDialog(
              backgroundColor: Colors.transparent,
              icon: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(
                      CupertinoIcons.clear_circled,
                      color: Colors.white,
                      size: 35,
                    ),
                  ),
                ],
              ),
              content: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network(
                  eBookImageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, child, loadingProgress) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Center(
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        backgroundColor: Colors.black,
                        value: loadingProgress.expectedTotalBytes != null
                            ? loadingProgress.cumulativeBytesLoaded /
                                loadingProgress.expectedTotalBytes!
                            : null,
                      ),
                    );
                  },
                ),
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () async {
                        Uri url = Uri.parse(eBookUrl);
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: CustomColors.orangeColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(14),
                        ),
                        fixedSize: Size(180, 50),
                      ),
                      child: Text(
                        "Read the book",
                        style:
                            Theme.of(context).textTheme.displayMedium!.copyWith(
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1.4,
                                  color: CustomColors.whiteColor,
                                ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: Image.network(
            eBookImageUrl,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
