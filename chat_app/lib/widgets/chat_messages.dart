import 'package:chat_app/widgets/message_bubble.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class ChatMessages extends StatelessWidget {
  const ChatMessages({super.key});

  @override
  Widget build(BuildContext context) {
    final currentUser = FirebaseAuth.instance.currentUser!;

    return StreamBuilder(
      stream: FirebaseFirestore.instance
          .collection('chat')
          .orderBy(
            'created-at',
            descending: true,
          )
          .snapshots(),
      builder: (ctx, chatSnapshot) {
        if (chatSnapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        }
        if (!chatSnapshot.hasData || chatSnapshot.data!.docs.isEmpty) {
          return const Center(child: Text('No messages found'));
        }
        if (chatSnapshot.hasError) {
          return const Center(child: Text('An error occuerd'));
        }
        final loaddedMessages = chatSnapshot.data!.docs;
        return ListView.builder(
          reverse: true,
          padding: const EdgeInsets.only(bottom: 40, left: 13, right: 13),
          itemBuilder: (context, index) {
            final message = loaddedMessages[index].data();
            final nextMessage = index + 1 < loaddedMessages.length
                ? loaddedMessages[index + 1].data()
                : null;
            final currentMessageID = message['id'];
            final nextMessageID =
                nextMessage != null ? nextMessage['id'] : null;
            final nextUserSame = currentMessageID == nextMessageID;
            if (nextUserSame) {
              return MessageBubble.next(
                  message: message['text'],
                  isMe: currentUser.uid == currentMessageID);
            } else {
              return MessageBubble.first(
                  userImage: message['user-image'],
                  username: message['username'],
                  message: message['text'],
                  isMe: currentUser.uid == currentMessageID);
            }
          },
          itemCount: loaddedMessages.length,
        );
      },
    );
  }
}
