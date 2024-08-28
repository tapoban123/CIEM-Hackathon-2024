import 'package:flutter/material.dart';

class MessageCard extends StatelessWidget {
  final String avatarUrl;
  final String name;
  final String message;
  final bool currentUserMessage;

  const MessageCard({
    super.key,
    required this.avatarUrl,
    required this.message,
    required this.name,
    this.currentUserMessage = false,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment:
          currentUserMessage ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (currentUserMessage == false)
          CircleAvatar(
            backgroundImage: AssetImage(
              avatarUrl,
            ),
            backgroundColor: const Color(0xffe9e3d5),
          ),
        const SizedBox(
          width: 8,
        ),
        Container(
          height: 55,
          width: 280,
          decoration: const BoxDecoration(
            color: Colors.transparent,
          ),
          child: Column(
            crossAxisAlignment: currentUserMessage
                ? CrossAxisAlignment.end
                : CrossAxisAlignment.start,
            children: [
              Text(
                name,
                style: Theme.of(context).textTheme.displayMedium!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
              ),
              Text(
                message,
                style: Theme.of(context).textTheme.displaySmall!.copyWith(
                      color: Colors.black,
                    ),
                textAlign: currentUserMessage ? TextAlign.end : TextAlign.start,
              ),
            ],
          ),
        ),
        if (currentUserMessage)
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: CircleAvatar(
              backgroundImage: AssetImage(
                avatarUrl,
              ),
              backgroundColor: const Color(0xffe9e3d5),
            ),
          ),
      ],
    );
  }
}
