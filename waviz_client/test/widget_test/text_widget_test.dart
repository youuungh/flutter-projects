import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets("특정 텍스트를 찾을 수 있다", (tester) async {
    await tester.pumpWidget(MaterialApp(home: Scaffold(body: Text("A"))));
    expect(find.text("A"), findsOneWidget);
  });

  testWidgets("Key로 위젯을 찾을 수 있다", (tester) async {
    const testKey = Key("Key");

    await tester.pumpWidget(MaterialApp(key: testKey, home: Scaffold()));

    expect(find.byKey(testKey), findsOneWidget);
  });

  testWidgets("Widget 인스턴스로 위젯을 찾을 수 있다", (tester) async {
    const paddingWidget = Padding(padding: EdgeInsets.all(8));

    await tester.pumpWidget(Container(child: paddingWidget));

    expect(find.byWidget(paddingWidget), findsOneWidget);
  });
}
