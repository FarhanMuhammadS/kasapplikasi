import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:kasapplikasi/ui/pages/homescreen/home_screen.dart';
import 'package:kasapplikasi/ui/pages/homescreen/view_model.dart';
import 'package:provider/provider.dart';

class CustomBindings extends AutomatedTestWidgetsFlutterBinding {
  @override
  bool get overrideHttpClient => false;
}

void main() {
  CustomBindings();
  group('Home Screen', () {
    testWidgets(
        'Home screen',
        (WidgetTester tester) async {
      await tester.pumpWidget(ChangeNotifierProvider(
          create: (_) => Viewmodel(),
          child: const MaterialApp(home: HomeScreen())));
      await tester.pumpAndSettle();
      expect(find.text("Home Screen"), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
    });
  });
}