import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackathon_mobile_app/utils/scaffold_key.dart';

class HomeAppbar extends StatelessWidget {
  const HomeAppbar({super.key});

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 40,
      left: 10,
      right: 16,
      child: SizedBox(
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    color: Colors.white,
                  ),
                  child: Image.asset(
                    "assets/images/profile_img.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: 200,
                  child: ListTile(
                    title: Text(
                      "Tapoban Ray",
                      style:
                          Theme.of(context).textTheme.displayMedium!.copyWith(
                                fontWeight: FontWeight.bold,
                                letterSpacing: 1.2,
                              ),
                      overflow: TextOverflow.ellipsis,
                    ),
                    subtitle: Text(
                      "Student",
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.white.withOpacity(0.8),
                            letterSpacing: 1.4,
                          ),
                    ),
                  ),
                ),
              ],
            ),
            GestureDetector(
              onTap: () {
                ScaffoldKey.scaffoldKey.currentState!.openEndDrawer();
              },
              child: SizedBox(
                width: 30,
                height: 30,
                child: SvgPicture.asset(
                  "assets/images/jam_menu.svg",
                  height: 15,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
