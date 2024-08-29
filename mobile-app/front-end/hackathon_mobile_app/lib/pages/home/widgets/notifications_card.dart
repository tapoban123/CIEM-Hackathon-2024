import 'package:flutter/material.dart';
import 'package:hackathon_mobile_app/utils/screen_measurements.dart';

class NotificationsCard extends StatelessWidget {
  final String notificationMessage;
  final String receivedTime;
  final String receivedDate;

  const NotificationsCard({
    super.key,
    required this.notificationMessage,
    required this.receivedTime,
    required this.receivedDate,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: Colors.black.withOpacity(0.5),
          ),
        ),
      ),
      child: Row(
        children: [
          const Icon(
            Icons.notifications_active_rounded,
            color: Colors.blue,
            size: 30,
          ),
          const SizedBox(
            width: 10,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: ScreenMeasurements.screenWidth(context) * 0.8,
                child: Text(
                  notificationMessage,
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              SizedBox(
                width: ScreenMeasurements.screenWidth(context) * 0.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      receivedTime,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 10,
                          ),
                    ),
                    Text(
                      receivedDate,
                      style: Theme.of(context).textTheme.displaySmall!.copyWith(
                            color: Colors.black.withOpacity(0.5),
                            fontSize: 10,
                          ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
