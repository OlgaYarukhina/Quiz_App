import 'package:flutter/material.dart';

class ResultScreen extends StatelessWidget {
  const ResultScreen({super.key});

  @override
  Widget build(BuildContext context) {
        final correctAnswers = ModalRoute.of(context)!.settings.arguments as int;

    return Scaffold(
      appBar: AppBar(title: Text('Results')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Your Score: : $correctAnswers'),
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, ModalRoute.withName('/'));
              },
              child: Text('Back to Home'),
            ),
          ],
        ),
      ),
    );
  }
}
