import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

final counterProvider = StateProvider((ref) => 0);

class Listener extends Mock {
  void call(int? previous, int value);
}

void main() {
  test("초기값이 0이다", () {
    final container = ProviderContainer();

    expect(container.read(counterProvider), equals(0));
  });

  group("상태 변화 리스너", () {
    test("초기값 변화를 감지한다", () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final listener = Listener();
      container.listen(counterProvider, listener.call, fireImmediately: true);

      verify(listener(null, 0)).called(1);
      verifyNoMoreInteractions(listener);
    });

    test("값이 1 증가할 때 변화를 감지한다", () {
      final container = ProviderContainer();
      addTearDown(container.dispose);

      final listener = Listener();
      container.listen(counterProvider, listener.call, fireImmediately: true);

      verify(listener(null, 0)).called(1);
      verifyNoMoreInteractions(listener);

      container.read(counterProvider.notifier).state++;

      verify(listener(0, 1)).called(1);
      verifyNoMoreInteractions(listener);
    });
  });
}
