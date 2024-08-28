import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/data/courses.dart';
import 'package:url_launcher/url_launcher.dart';

class StudentCourses extends StatelessWidget {
  const StudentCourses({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 12,
            ),
            const Expanded(
              flex: 1,
              child: Text(
                "Courses for You",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: courses.length,
                itemBuilder: (context, index) {
                  final eachCourse = courses[index];

                  return GestureDetector(
                    onTap: () async {
                      Uri url = Uri.parse(eachCourse["url"]);
                      await launchUrl(
                        url,
                        mode: LaunchMode.externalApplication,
                      );
                    },
                    child: Container(
                      height: 100,
                      padding: const EdgeInsets.only(
                        top: 20,
                        left: 20,
                      ),
                      margin: const EdgeInsets.only(bottom: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: eachCourse["color"]!,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eachCourse["title"]!,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                              color: Colors.black,
                            ),
                          ),
                          Text(
                            eachCourse["subtitle"]!,
                            style: const TextStyle(
                              fontSize: 12,
                              fontWeight: FontWeight.normal,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
