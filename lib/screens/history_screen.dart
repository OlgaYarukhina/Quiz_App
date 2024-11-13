import 'package:flutter/material.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Quiz History')),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Previous Quiz Results:'),
            // Тут відображення списку результатів
            // Можете використовувати ListView для відображення кожного результату
          ],
        ),
      ),
    );
  }
}
