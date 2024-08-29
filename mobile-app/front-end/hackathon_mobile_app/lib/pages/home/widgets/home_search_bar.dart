import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/home_button.dart';
import 'package:hackathon_mobile_app/theme/colors.dart';

class HomeSearchBar extends StatelessWidget {
  final FocusNode inputFocusNode;

  const HomeSearchBar({
    super.key,
    required this.inputFocusNode,
  });

  @override
  Widget build(BuildContext context) {
    const textFieldBorder = UnderlineInputBorder(
      borderSide: BorderSide(
        width: 3,
        color: Colors.black,
      ),
    );
    return Container(
      height: 105,
      margin: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
      decoration: BoxDecoration(
        boxShadow: const [
          BoxShadow(
            color: Colors.black,
            offset: Offset(3, 5),
            spreadRadius: 1.4,
          ),
        ],
        color: Colors.white,
        borderRadius: BorderRadius.circular(18),
      ),
      child: Column(
        children: [
          TextFormField(
            focusNode: inputFocusNode,
            decoration: InputDecoration(
              enabledBorder: textFieldBorder,
              focusedBorder: textFieldBorder,
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
          Padding(
            padding: EdgeInsets.only(
              left: 5.0,
              top: 18,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "Recommended",
                  style: TextStyle(
                    fontSize: 12,
                    color: CustomColors.darkTextColor,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeButton(
                      buttonText: "Design",
                      buttonColor: CustomColors.orangeColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    HomeButton(
                      buttonText: "Psychology",
                      buttonColor: CustomColors.lightBlueColor,
                    ),
                    SizedBox(
                      width: 8,
                    ),
                    HomeButton(
                      buttonText: "Architecture",
                      buttonColor: CustomColors.violetColor,
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
