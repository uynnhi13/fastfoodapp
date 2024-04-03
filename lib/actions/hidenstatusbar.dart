import 'package:flutter/services.dart';

Future hidenstatusbar() async {
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
  overlays: [SystemUiOverlay.bottom]);
}