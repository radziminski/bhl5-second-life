import 'package:SecondLife/dtos/api/message_dto.dart';
import 'package:SecondLife/locator.dart';
import 'package:SecondLife/services/api_service.dart';
import 'package:flutter/material.dart';

class ChatModel extends ChangeNotifier {
  final ApiService service = locator<ApiService>();
  List<MessageDto> messages = [];

  Future<List<MessageDto>> getCurrMessages(
      int offerId, String sender, String reveicer) async {
    List<MessageDto> res =
        await service.getMessagesForChat(offerId, sender, reveicer);

    messages = res;
    notifyListeners();
  }

  Future createMessage(
      int offerId, String sender, String receiver, String message) async {
    await service.postMessagesForChat(offerId, sender, receiver, message);
    messages.add(MessageDto(text: message, receiver: receiver, sender: sender));
    notifyListeners();
  }

  void clear() {
    messages = [];
  }
}
