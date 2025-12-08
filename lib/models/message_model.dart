import 'package:chat_app/constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class MessageModel {
  final String messageData;
  final Timestamp messageTime;
  final String senderId;
  final String senderName;


  MessageModel({
    required this.messageData,
    required this.messageTime,
    required this.senderId,
    required this.senderName,
  });
  // Convert a Firestore document (obj) into a MessageModel
  factory MessageModel.fromJson(QueryDocumentSnapshot doc) {
    Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      messageData: data[kMessageData],
      messageTime: data[kMessageTime],
      senderId: data[kMessageId],
      senderName: data[kUserName],
    );
  }
}