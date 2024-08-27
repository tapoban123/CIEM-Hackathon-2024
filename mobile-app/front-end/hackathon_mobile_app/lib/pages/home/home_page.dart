import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/home_search_bar.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Featured Courses",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
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
                  const Text(
                    "E-Books",
                    style: TextStyle(color: Colors.black),
                  ),
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
                            decoration: const BoxDecoration(color: Colors.blueGrey),
                          ),
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text(
                    "Articles",
                    style: TextStyle(color: Colors.black),
                  ),
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
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
