import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_message_test/bloc/count_down_bloc.dart';

class SnackBarTest2Page extends StatefulWidget {
  const SnackBarTest2Page({super.key});

  @override
  State<StatefulWidget> createState() => _SnackBarTest2State();
}

class _SnackBarTest2State extends State<SnackBarTest2Page> {
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
      appBar: AppBar(title: const Text("SnackBar Test 2")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text("メッセージ表示まであと"),
            StreamBuilder(
              builder: (context, snapshot) {
                if (snapshot.hasData && snapshot.data! == 0) {
                  SchedulerBinding.instance.addPostFrameCallback((timeStamp) {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: const Text("0になりました！"),
                      duration: const Duration(seconds: 10),
                      action: SnackBarAction(
                        label: "再スタート",
                        onPressed: () => _countDownBloc.input.add(null),
                      ),
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
