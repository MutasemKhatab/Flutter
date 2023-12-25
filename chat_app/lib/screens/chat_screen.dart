import 'package:chat_app/widgets/chat_messages.dart';
import 'package:chat_app/widgets/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  void setUpNotification() async {
    final fireMessaging = FirebaseMessaging.instance;
    await fireMessaging.requestPermission();
    await fireMessaging.getToken();
    fireMessaging.subscribeToTopic('chat');
  }

  @override
  void initState() {
    super.initState();
    setUpNotification();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          actions: [
            IconButton(
                onPressed: () {
                  FirebaseAuth.instance.signOut();
                },
                color: Theme.of(context).colorScheme.primary,
                icon: const Icon(Icons.exit_to_app))
          ],
          title: const Text('Flutter Chat'),
        ),
        body: const Column(
          children: [
            Expanded(child: ChatMessages()),
            NewMessage(),
          ],
        ));
  }
}
