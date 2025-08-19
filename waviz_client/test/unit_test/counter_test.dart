import 'package:flutter_test/flutter_test.dart';

class Counter {
  int value = 0;

  void increment() => value += 2;

  void decrement() => value--;
}

void main() {
  test("increment 호출 시 값이 2 증가한다", () {
    final counter = Counter();
    counter.increment();
    expect(counter.value, 2);
  });

  group("Counter 클래스", () {
    test("초기값은 0이다", () {
      expect(Counter().value, 0);
    });

    test("increment 호출 시 값이 2 증가한다", () {
      final counter = Counter();
      counter.increment();
      expect(counter.value, 2);
    });

    test("decrement 호출 시 값이 1 감소한다", () {
      final counter = Counter();
      counter.decrement();
      expect(counter.value, -1);
    });
  });
}
