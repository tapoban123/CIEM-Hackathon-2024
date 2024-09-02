import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';

class OnlySearchBar extends ConsumerStatefulWidget {
  const OnlySearchBar({super.key});

  @override
  ConsumerState<OnlySearchBar> createState() => _OnlySearchBarState();
}

class _OnlySearchBarState extends ConsumerState<OnlySearchBar> {
  final TextEditingController _homeSearchController = TextEditingController();
  final TextEditingController _coursesSearchController =
      TextEditingController();
  final TextEditingController _ebooksSearchController = TextEditingController();

  // TextEditingController? pageSpecificTextController() {
  //   int _currentPage = ref.read(navigationProvider);

  //   if (_currentPage == 0) {
  //     return _homeSearchController;
  //   } else if (_currentPage == 4) {
  //     return _coursesSearchController;
  //   } else if (_currentPage == 5) {
  //     return _ebooksSearchController;
  //   }
  //   return null;
  // }

  @override
  void dispose() {
    // pageSpecificTextController()?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            blurRadius: 2.6,
            offset: Offset(3, 5),
            spreadRadius: 1,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: TextFormField(
        // controller: pageSpecificTextController(),
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search resources",
          hintStyle: TextStyle(
            color: CustomColors.darkTextColor.withOpacity(0.3),
          ),
          contentPadding: const EdgeInsets.only(top: 12),
          prefixIcon: const Icon(CupertinoIcons.search),
          suffixIcon: Container(
            alignment: Alignment.center,
            width: 20,
            height: 20,
            child: SvgPicture.asset(
              "assets/images/Vector.svg",
              height: 18,
              fit: BoxFit.scaleDown,
            ),
          ),
        ),
        style: TextStyle(color: CustomColors.darkTextColor),
        cursorColor: CustomColors.darkTextColor,
      ),
    );
  }
}
