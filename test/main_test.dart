import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

import 'package:pokedex/app/pokedex.dart';
import 'package:pokedex/ui/home_page.dart';

void main() {
  group('Run main app', () {
    IntegrationTestWidgetsFlutterBinding.ensureInitialized();

    test('Initialize app', () {
      var result = Pokedex.instance.appState;

      expect(result, 0);
    });

    test('Go to main screen', () {
      var appState = 1;

      var update = updateAppState(appState);

      expect(update, 1);
    });
  });
}
