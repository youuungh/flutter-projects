import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

final widgetCounterProvider = StateProvider((ref) => 0);

class MyRiverpodWidget extends StatelessWidget {
  const MyRiverpodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(
        builder: (BuildContext context, WidgetRef ref, Widget? child) {
          final counter = ref.watch(widgetCounterProvider);
          return ElevatedButton(
            onPressed: () {
              ref.read(widgetCounterProvider.notifier).state++;
            },
            child: Text("$counter"),
          );
        },
      ),
    );
  }
}

void main() {
  testWidgets("버튼을 클릭하면 카운터가 증가한다", (tester) async {
    await tester.pumpWidget(ProviderScope(child: MyRiverpodWidget()));

    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);

    await tester.tap(find.byType(ElevatedButton));
    await tester.pump();

    expect(find.text("1"), findsOneWidget);
    expect(find.text("0"), findsNothing);
  });

  testWidgets("초기값이 0으로 표시된다", (tester) async {
    await tester.pumpWidget(ProviderScope(child: MyRiverpodWidget()));

    expect(find.text("0"), findsOneWidget);
    expect(find.text("1"), findsNothing);
  });
}
