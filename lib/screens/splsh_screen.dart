import 'package:flutter/material.dart';

class SplshScreen extends StatelessWidget {
  const SplshScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Loading...',
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: Theme.of(context).colorScheme.primary),
            ),
            const SizedBox(
              height: 10,
            ),
            const CircularProgressIndicator(),
          ],
        ),
      ),
    );
  }
}
