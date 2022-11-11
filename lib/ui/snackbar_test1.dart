import 'package:flutter/material.dart';

class SnackBarTest1Page extends StatelessWidget {
  const SnackBarTest1Page({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("SnackBar Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text("ボタンをタップして表示しました！"),
                    duration: Duration(seconds: 3),
                  ),
                );
              },
              child: const Text("Show SnackBar"),
            ),
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: const Text("5秒待つかボタンをタップすると消えます"),
                    duration: const Duration(seconds: 5),
                    action: SnackBarAction(
                      label: "閉じる",
                      onPressed: () {
                        ScaffoldMessenger.of(context).clearSnackBars();
                      },
                    ),
                  ),
                );
              },
              child: const Text("Show SnackBar with Button"),
            ),
          ],
        ),
      ),
    );
  }
}
