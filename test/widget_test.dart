import 'package:flutter_test/flutter_test.dart';
import 'package:space_app/main.dart';

void main() {
  testWidgets('Login to Home Page Navigation Test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());
    
    // Tap the Explore button
    await tester.tap(find.text('Explore'));
    await tester.pumpAndSettle();
  });
}


