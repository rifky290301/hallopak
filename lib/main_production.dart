import 'package:hallopak/main.dart';
import 'flavors.dart';

void main() {
  F.appFlavor = Flavor.PRODUCTION;
  prepare(flavor: F.appFlavor);
}
