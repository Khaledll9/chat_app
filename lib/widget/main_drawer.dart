import 'package:chat_app/widget/setting_page.dart';
import 'package:flutter/material.dart';

class MainDrwer extends StatelessWidget {
  const MainDrwer({
    super.key,
    required this.onSelectScreen,
  });

  final void Function(String identifier) onSelectScreen;

  @override
  Widget build(BuildContext context) {
    return Drawer(
        child: Column(
      children: [
        DrawerHeader(
          padding: const EdgeInsets.all(25),
          decoration: BoxDecoration(
              gradient: LinearGradient(colors: [
            Theme.of(context).colorScheme.primaryContainer,
            Theme.of(context).colorScheme.primaryContainer.withOpacity(.4),
          ])),
          child: Row(
            children: [
              const SizedBox(
                width: 65,
              ),
              Image.asset('assets/images/chat.png'),
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        ListTile(
          leading: Icon(
            Icons.chat_outlined,
            color: Theme.of(context).colorScheme.primary,
            size: 22,
          ),
          title: Text(
            'C H A T',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            onSelectScreen('chat');
          },
        ),
        ListTile(
          leading: Icon(
            Icons.settings,
            color: Theme.of(context).colorScheme.primary,
            size: 22,
          ),
          title: Text(
            'S E T T I N G S',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            // onSelectScreen('setting');
            Navigator.pop(context);
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const SettingPage(),
                ));
          },
        ),
        ListTile(
          leading: Icon(
            Icons.exit_to_app,
            color: Theme.of(context).colorScheme.primary,
            size: 22,
          ),
          title: Text(
            'L O G O U T ',
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                color: Theme.of(context).colorScheme.primary,
                fontSize: 18,
                fontWeight: FontWeight.bold),
          ),
          onTap: () {
            onSelectScreen('logout');
          },
        ),
      ],
    ));
  }
}
