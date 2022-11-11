import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Message Test"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () => context.push("/snackbar_test1"),
              child: const Text("SnackBar Test (ボタンタップVer.)"),
            ),
            ElevatedButton(
              onPressed: () => context.push("/snackbar_test2"),
              child: const Text("SnackBar Test (カウントダウンVer.)"),
            ),
            ElevatedButton(
              onPressed: () => context.push("/material_banner_test1"),
              child: const Text("MaterialBanner Test1 (ボタンタップVer.)"),
            ),
            ElevatedButton(
              onPressed: () => context.push("/material_banner_test2"),
              child: const Text("MaterialBanner Test2 (カウントダウンVer.)"),
            )
          ],
        ),
      ),
    );
  }
}
