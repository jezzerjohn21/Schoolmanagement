import 'package:flutter_test/flutter_test.dart';
import 'package:schoolmanagement/app/app.locator.dart';

import '../helpers/test_helpers.dart';

void main() {
  group('StudentViewModel Tests -', () {
    setUp(() => registerServices());
    tearDown(() => locator.reset());
  });
}