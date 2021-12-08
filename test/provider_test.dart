import 'package:flutter_test/flutter_test.dart';
import 'package:login/provider/provider.dart';
import 'package:mockito/mockito.dart';

class MockPrcvider extends MyProvider with Mock {}

void main() {
  MockPrcvider newprovider = MockPrcvider();
  group("test MyProvider", () {
    test("define place object", () {
      newprovider.email = "test";
      newprovider.valul = 1;

      expect(newprovider.email, "test");
      expect(newprovider.valul, 1);
    });

    test("decrease", () {
      newprovider.decrease();
      expect(newprovider.valul, 0);
    });
  });

  test("increase", () {
    newprovider.increase();
    expect(newprovider.valul, 1);
  });
}
