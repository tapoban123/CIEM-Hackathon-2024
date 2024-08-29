import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';

class CoursesSearchBar extends StatelessWidget {
  const CoursesSearchBar({super.key});

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
        decoration: InputDecoration(
          enabledBorder: InputBorder.none,
          focusedBorder: InputBorder.none,
          hintText: "Search resources",
          hintStyle: TextStyle(
            color: CustomColors.darkTextColor.withOpacity(0.3),
          ),
          contentPadding: const EdgeInsets.only(top: 14),
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
