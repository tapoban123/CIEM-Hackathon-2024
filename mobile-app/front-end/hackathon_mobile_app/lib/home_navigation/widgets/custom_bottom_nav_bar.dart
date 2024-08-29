import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/home_navigation/widgets/nav_button.dart';
import 'package:hackathon_mobile_app/providers/community_messages_provider.dart';
import 'package:hackathon_mobile_app/providers/navigation_provider.dart';
import 'package:hackathon_mobile_app/providers/other_providers.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';

class CustomBottomNavBar extends ConsumerStatefulWidget {
  final int currentPage;
  final List<Widget> pages;

  const CustomBottomNavBar({
    super.key,
    required this.currentPage,
    required this.pages,
  });

  @override
  ConsumerState<CustomBottomNavBar> createState() => _CustomBottomNavBarState();
}

class _CustomBottomNavBarState extends ConsumerState<CustomBottomNavBar> {
  final TextEditingController messageTextController = TextEditingController();

  void onNavButtonPressed(int pageNumber) {
    ref.read(navigationProvider.notifier).navigateToPage(pageNumber);
  }

  bool readOnly = true;

  List<IconData> navButtonsIcons = [
    Icons.home_outlined,
    CupertinoIcons.person_3,
    CupertinoIcons.bell,
    Icons.person_2_outlined
  ];

  double getKeyboardheight() {
    final keyboardOff = (View.of(context).viewInsets.bottom) == 0;
    final keyboardHeight = MediaQuery.of(context).viewInsets.bottom;

    if (keyboardOff) {
      return 100;
    } else {
      return keyboardHeight + 32;
    }
  }

  @override
  Widget build(BuildContext context) {
    readOnly = ref.watch(readOnlyCommunityTextfieldProvider);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 18),
      width: double.infinity,
      height: widget.currentPage == 1 ? getKeyboardheight() : 50,
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              if (widget.currentPage == 1)
                Container(
                  width: MediaQuery.of(context).size.width * 0.908,
                  height: 48,
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    ),
                  ),
                  child: TextField(
                    controller: messageTextController,
                    focusNode: ref.read(communityTextFieldFocusNodeProvider),
                    readOnly: readOnly,
                    decoration: InputDecoration(
                      enabledBorder: InputBorder.none,
                      focusedBorder: InputBorder.none,
                      hintText: "Text it out",
                      suffixIcon: GestureDetector(
                        onTap: () {
                          if (messageTextController.text.isNotEmpty) {
                            ref
                                .read(communityMessagesProvider.notifier)
                                .addNewMessage(messageTextController.text);
                            messageTextController.clear();
                          }
                        },
                        child: Icon(
                          Icons.send_rounded,
                          color: CustomColors.darkTextColor,
                        ),
                      ),
                      hintStyle: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(
                            color: CustomColors.darkTextColor.withOpacity(0.5),
                          ),
                      contentPadding: const EdgeInsets.only(
                        left: 25,
                        top: 15,
                      ),
                    ),
                    onTap: () {
                      ref
                          .read(readOnlyCommunityTextfieldProvider.notifier)
                          .update(
                        (state) {
                          state = false;
                          return state;
                        },
                      );
                    },
                    style: Theme.of(context)
                        .textTheme
                        .displayMedium!
                        .copyWith(color: CustomColors.darkTextColor),
                  ),
                ),
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => const SizedBox(
                    width: 15,
                  ),
                  itemCount: widget.pages.length - 1,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 12.0),
                      child: NavButton(
                        isProfilePage: index == 3,
                        onTap: () => onNavButtonPressed(index),
                        buttonIcon: navButtonsIcons[index],
                        iconSize: index == widget.currentPage ? 28 : 24,
                        iconColor: index == widget.currentPage
                            ? Colors.white
                            : Colors.white.withOpacity(0.5),
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
