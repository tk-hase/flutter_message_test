import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_message_test/bloc/count_down_bloc.dart';

class MaterialBannerTest2 extends StatefulWidget {
  const MaterialBannerTest2({super.key});

  @override
  State<StatefulWidget> createState() => _MaterialBannerTest2State();
}

class _MaterialBannerTest2State extends State<MaterialBannerTest2> {
  final _countDownBloc = CountDownBloc();

  @override
  void dispose() {
    _countDownBloc.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    _countDownBloc.input.add(null);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("MaterialBanner Test 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("メッセージ表示まであと"),
            StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data! == 0) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showMaterialBanner(MaterialBanner(
                      content: const Text("0になりました！"),
                      actions: [
                        TextButton(
                          child: const Text("再スタート"),
                          onPressed: () {
                            ScaffoldMessenger.of(context).hideCurrentMaterialBanner();
                            _countDownBloc.input.add(null);
                          },
                        )
                      ],
                    ));
                  });
                }
                return Text("${snapshot.data}", style: const TextStyle(fontSize: 30.0, fontWeight: FontWeight.bold));
              },
              stream: _countDownBloc.output,
            ),
          ],
        ),
      ),
    );
  }
}
