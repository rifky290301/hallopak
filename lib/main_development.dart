import 'flavors.dart';
import 'main.dart';

void main() {
  F.appFlavor = Flavor.DEVELOPMENT;
  prepare(flavor: F.appFlavor);
}
