import 'dart:async';

class CountDownBloc {
  final _inputStream = StreamController<void>();
  final _outputStream = StreamController<int>();

  CountDownBloc() {
    _inputStream.stream.listen((event) => _start());
  }

  int _counter = 5;
  Timer? _currentTimer;

  Sink<void> get input => _inputStream.sink;
  Stream<int> get output => _outputStream.stream;

  void _start() {
    _currentTimer?.cancel();
    _counter = 5;
    _outputStream.sink.add(_counter);

    _currentTimer = Timer.periodic(
      const Duration(seconds: 1),
      (timer) {
        _counter--;
        _outputStream.sink.add(_counter);
        if (_counter == 0) {
          timer.cancel();
        }
      },
    );
  }

  void dispose() {
    _currentTimer?.cancel();
    _currentTimer = null;
    _inputStream.close();
    _outputStream.close();
  }
}
