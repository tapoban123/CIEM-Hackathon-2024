import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/home_button.dart';

class HomePage2 extends StatelessWidget {
  const HomePage2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: const Color(0xffe9e3d5),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Container(
        margin: const EdgeInsets.symmetric(horizontal: 18),
        width: double.infinity,
        height: 50,
        decoration: BoxDecoration(
          color: Colors.black,
          borderRadius: BorderRadius.circular(20),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.person_3,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.home_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                CupertinoIcons.bell,
                color: Colors.white,
                size: 28,
              ),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(
                Icons.person_2_outlined,
                color: Colors.white,
                size: 28,
              ),
            ),
          ],
        ),
      ),
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  height: 105,
                  margin: const EdgeInsets.symmetric(horizontal: 20)
                      .copyWith(top: 20),
                  decoration: BoxDecoration(
                    boxShadow: const [
                      BoxShadow(
                        color: Colors.black,
                        blurRadius: 1,
                        offset: Offset(3, 5),
                        spreadRadius: 2,
                      ),
                    ],
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(18),
                  ),
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(
                              width: 3,
                              color: Colors.black,
                            ),
                          ),
                          hintText: "Search resources",
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
                      ),
                      const Padding(
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
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                HomeButton(
                                  buttonText: "Design",
                                  buttonColor: Color(0xffff7340),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                HomeButton(
                                  buttonText: "Psychology",
                                  buttonColor: Color(0xff25c3db),
                                ),
                                SizedBox(
                                  width: 8,
                                ),
                                HomeButton(
                                  buttonText: "Architecture",
                                  buttonColor: Color(0xff624cab),
                                ),
                              ],
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Featured Courses"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 150,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.only(right: 10),
                        height: 150,
                        width: 150,
                        decoration: const BoxDecoration(
                          color: Colors.grey,
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("E-Books"),
                SizedBox(
                  height: 250,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Container(
                          width: 150,
                          height: 250,
                          decoration:
                              const BoxDecoration(color: Colors.blueGrey),
                        ),
                      );
                    },
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text("Articles"),
                const SizedBox(
                  height: 10,
                ),
                SizedBox(
                  height: 200,
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      if (index % 2 == 0) {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          alignment: Alignment.centerLeft,
                          decoration: const BoxDecoration(),
                          child: const Chip(
                            label: Text(
                              "Sustainable Success: A Framework for Optimizing Profit ~By Nicholas Piscani",
                              style: TextStyle(fontSize: 8.5),
                            ),
                          ),
                        );
                      } else {
                        return Container(
                          margin: const EdgeInsets.only(bottom: 0),
                          alignment: Alignment.centerRight,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Chip(
                            label: Text(
                              "Making short films is a powerful way to learn job skills ~ By Wendy Smidt",
                              style: TextStyle(fontSize: 8.5),
                              softWrap: true,
                            ),
                          ),
                        );
                      }
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
