// 1 - Create a debounce instance
//final Debounce _debounce = Debounce(Duration(milliseconds: 400));

import 'dart:async';

class Debounce {
  Duration delay;
  Timer? _timer;

  Debounce(
    this.delay,
  );

  call(void Function() callback) {
    _timer?.cancel();
    _timer = Timer(delay, callback);
  }

  dispose() {
    _timer?.cancel();
  }
}