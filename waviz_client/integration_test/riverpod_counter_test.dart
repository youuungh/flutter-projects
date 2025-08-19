import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

final counterProvider = StateProvider((ref) => 0);

class MyRiverpodWidget extends StatelessWidget {
  const MyRiverpodWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Consumer(
        builder: (context, ref, child) {
          final counter = ref.watch(counterProvider);
          return Center(
            child: ElevatedButton(
              onPressed: () {
                ref.read(counterProvider.notifier).state++;
              },
              child: Text("$counter"),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group("통합 테스트", () {
    testWidgets("버튼을 두 번 클릭하면 카운터가 2가 된다", (tester) async {
      await tester.pumpWidget(ProviderScope(child: MyRiverpodWidget()));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await Future.delayed(Duration(seconds: 3));

      await tester.tap(find.byType(ElevatedButton));
      await tester.pump();

      await Future.delayed(Duration(seconds: 3));

      expect(find.text("2"), findsOneWidget);
      expect(find.text("0"), findsNothing);
    });
  });
}
