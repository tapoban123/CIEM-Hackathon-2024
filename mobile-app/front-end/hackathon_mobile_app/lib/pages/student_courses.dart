import 'package:flutter/material.dart';

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
                  fontSize: 25,
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                padding: const EdgeInsets.only(top: 0),
                shrinkWrap: true,
                itemCount: 15,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    padding: const EdgeInsets.only(
                      top: 20,
                      left: 20,
                    ),
                    margin: const EdgeInsets.only(bottom: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color(0xff624cab),
                    ),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("My Course"),
                        Text("Science"),
                      ],
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
