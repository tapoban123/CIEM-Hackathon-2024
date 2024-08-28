import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/community_messages.dart';
import 'package:hackathon_mobile_app/pages/community/widgets/message_card.dart';
import 'package:hackathon_mobile_app/providers/community_messages_provider.dart';
import 'package:hackathon_mobile_app/providers/other_providers.dart';
import 'package:hackathon_mobile_app/utils/screen_measurements.dart';

class CommunityPage extends ConsumerStatefulWidget {
  const CommunityPage({super.key});

  @override
  ConsumerState<CommunityPage> createState() => _CommunityPageState();
}

class _CommunityPageState extends ConsumerState<CommunityPage> {
  @override
  void initState() {
    ref.read(communityMessagesProvider.notifier).getMessages();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final value = View.of(context).viewInsets.bottom;
    if (value == 0) {
      ref.read(communityTextFieldFocusNodeProvider).unfocus();
    }
    return SingleChildScrollView(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  SizedBox(
                    height: ScreenMeasurements.screenHeight(context) * 0.6,
                    child: ListView.builder(
                      padding: const EdgeInsets.only(top: 0),
                      itemCount: ref.read(communityMessagesProvider).length,
                      itemBuilder: (context, index) {
                        final eachMessage =
                            ref.read(communityMessagesProvider)[index];

                        if (index == 4) {
                          return Padding(
                            padding: const EdgeInsets.only(bottom: 15.0),
                            child: MessageCard(
                              avatarUrl: "assets/images/male_avatar2.png",
                              name: "Tapoban",
                              message: eachMessage["message"]!,
                              currentUserMessage: true,
                            ),
                          );
                        }

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 15.0),
                          child: MessageCard(
                            avatarUrl: eachMessage["avatar"]!,
                            name: eachMessage["name"]!,
                            message: eachMessage["message"]!,
                          ),
                        );
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
