import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hackathon_mobile_app/data/community_messages.dart';

StateNotifierProvider<CommunityMessagesProvider, List<Map<String, String>>>
    communityMessagesProvider =
    StateNotifierProvider<CommunityMessagesProvider, List<Map<String, String>>>(
  (ref) => CommunityMessagesProvider(),
);

class CommunityMessagesProvider
    extends StateNotifier<List<Map<String, String>>> {
  CommunityMessagesProvider() : super([]) {
    communityMembers.shuffle();
  }

  late Map<String, String> messagesData;

  void getMessages() {
    for (int i = 0; i < 5; i++) {
      messagesData = {
        "name": communityMembers[i]["name"],
        "avatar":communityMembers[i]["avatar"],
        "message": communityMessages[i],
      };
      state.add(messagesData);
    }
  }
}
