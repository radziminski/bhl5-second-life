class MessageDto {
  String text;
  String receiver;
  String sender;
  DateTime timestamp;

  MessageDto({this.sender, this.receiver, this.text});
  MessageDto.fromJson(json) {
    text = json['message_content'];
    receiver = json['receiver'];
    sender = json['sender'];
    //timestamp = DateTime(json['message_timestamp']);
  }
}
