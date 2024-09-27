import 'package:chat_app/theme/theme_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  @override
  Widget build(BuildContext context) {
    bool isDarkMode =
        Provider.of<ThemeProvider>(context, listen: false).isDarkMode;
    return Scaffold(
      appBar: AppBar(
        title: const Text('S E T T I N G'),
        centerTitle: true,
      ),
      body: Container(
        decoration: BoxDecoration(
            color: isDarkMode
                ? Theme.of(context).colorScheme.tertiaryContainer
                : Theme.of(context).colorScheme.surfaceContainerHighest,
            borderRadius: BorderRadius.circular(16)),
        padding: const EdgeInsets.all(16),
        margin: const EdgeInsets.all(25),
        child: SwitchListTile(
          title: Text(
            isDarkMode ? 'Dark Mode ' : 'Light Mode',
            style: Theme.of(context).textTheme.titleLarge!.copyWith(
                  color: isDarkMode
                      ? Colors.white70
                      : Theme.of(context).colorScheme.primary,
                  fontSize: 25,
                ),
          ),
          value: isDarkMode,
          activeColor: Theme.of(context).colorScheme.onSurface,
          onChanged: (value) =>
              Provider.of<ThemeProvider>(context, listen: false).toggleTheme(),
        ),
      ),
    );
  }
}
