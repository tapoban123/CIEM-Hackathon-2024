import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/pages/home/widgets/notifications_card.dart';

class NotificationsPage extends StatelessWidget {
  const NotificationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Padding(
            padding: const EdgeInsets.only(right: 16.0),
            child: Text(
              "Notifications",
              style: Theme.of(context).textTheme.displayLarge,
            ),
          ),
          const SizedBox(
            height: 25,
          ),
          const NotificationsCard(
            notificationMessage: "You have one new message from Subham.",
            receivedTime: "07:00 AM",
            receivedDate: "30-08-2024",
          ),
          const NotificationsCard(
            notificationMessage:
                "A new course just got added to your curriculum",
            receivedTime: "10:00 AM",
            receivedDate: "29-08-2024",
          ),
        ],
      ),
    );
  }
}
