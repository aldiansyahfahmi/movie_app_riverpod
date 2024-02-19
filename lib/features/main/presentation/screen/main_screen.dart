import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/features/main/presentation/provider/theme_provider/theme_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    log('rebuild');
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Movie App Riverpod',
        ),
        actions: [
          IconButton(
            onPressed: () {
              ref.read(themeProvider.notifier).changeTheme();
            },
            icon: Consumer(
              builder: (context, widRef, child) {
                final theme = widRef.watch(themeProvider);
                return Icon(
                  theme == ThemeData.light()
                      ? Icons.dark_mode
                      : Icons.light_mode,
                );
              },
            ),
          )
        ],
      ),
      body: IndexedStack(
        index: 0,
        children: [
          Container(color: Colors.blue),
          Container(color: Colors.red),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.movie),
            label: 'Movies',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.tv),
            label: 'TV Show',
          ),
        ],
      ),
    );
  }
}
