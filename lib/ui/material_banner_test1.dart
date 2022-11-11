import 'package:flutter/material.dart';

class MaterialBannerTest1 extends StatelessWidget {
  const MaterialBannerTest1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MaterialBanner Test")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).clearMaterialBanners();
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text("メッセージ表示！"),
                    actions: [
                      TextButton(
                        child: const Text("閉じる"),
                        onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Material Banner with 1 button"),
            ),
            ElevatedButton(
              onPressed: () {
                void closeAction() {
                  ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                }

                ScaffoldMessenger.of(context).clearMaterialBanners();
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    content: const Text("3つボタンがあるので好きなものをどうぞ！"),
                    actions: [
                      TextButton(
                        child: const Text("ボタン1"),
                        onPressed: () => closeAction(),
                      ),
                      TextButton(
                        child: const Text("ボタン2"),
                        onPressed: () => closeAction(),
                      ),
                      TextButton(
                        child: const Text("ボタン3"),
                        onPressed: () => closeAction(),
                      ),
                    ],
                  ),
                );
              },
              child: const Text("Show Material Banner with 3 buttons"),
            ),
          ],
        ),
      ),
    );
  }
}
