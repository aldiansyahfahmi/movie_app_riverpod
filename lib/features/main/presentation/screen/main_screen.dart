import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:movie_app_riverpod/features/main/presentation/provider/bottom_navigation_provider/bottom_navigation_provider.dart';
import 'package:movie_app_riverpod/features/main/presentation/provider/theme_provider/theme_provider.dart';

class MainScreen extends ConsumerWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
      body: Consumer(
        builder: (context, widRef, child) {
          int index = widRef.watch(bottomNavigationProvider);
          return IndexedStack(
            index: index,
            children: [
              Container(color: Colors.blue),
              Container(color: Colors.red),
            ],
          );
        },
      ),
      bottomNavigationBar: Consumer(
        builder: (context, widRef, child) {
          int index = widRef.watch(bottomNavigationProvider);
          return BottomNavigationBar(
            currentIndex: index,
            selectedLabelStyle: const TextStyle(
              fontWeight: FontWeight.bold,
            ),
            onTap: (index) {
              ref.read(bottomNavigationProvider.notifier).changeTab(index);
            },
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
          );
        },
      ),
    );
  }
}
