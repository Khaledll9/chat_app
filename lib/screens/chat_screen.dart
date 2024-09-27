import 'package:chat_app/theme/theme_provider.dart';
import 'package:chat_app/widget/chat_messages.dart';
import 'package:chat_app/widget/main_drawer.dart';
import 'package:chat_app/widget/new_message.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  Future<void> _logoutChat(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (ctx) {
        return AlertDialog(
          title: const Text('sign out'),
          content: const Text('Are you sure you want to exit ? '),
          actions: [
            TextButton(
              onPressed: () {
                return Navigator.pop(context);
              },
              child: Text(
                'No',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
            TextButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                return Navigator.pop(context);
              },
              child: Text(
                'Yes',
                style: TextStyle(color: Theme.of(context).colorScheme.primary),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrwer(onSelectScreen: (identifier) {
        if (identifier == 'logout') {
          Navigator.pop(context);
          _logoutChat(context);
        } else if (identifier == 'chat') {
          Navigator.pop(context);
        }
      }),
      appBar: AppBar(
        title: const Text(
          'خليها على اللًه',
          style: TextStyle(
            fontSize: 18,
            fontFamily: 'CooperArabic',
          ),
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () => _logoutChat(context),
            icon: const Icon(Icons.exit_to_app),
          )
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          filterQuality: FilterQuality.none,
          opacity: .3,
          fit: BoxFit.fill,
          image: AssetImage(
            "assets/images/black_background.png",
          ),
        )),
        child: const Column(
          children: [Expanded(child: ChatMessages()), NewMessage()],
        ),
      ),
    );
  }
}
