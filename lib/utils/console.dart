import 'package:mt_flutter_task/utils/config.dart';

class Console {
  static void log(String log) {
    if (getDebugBanner()) {
      print(log);
    }
  }
}
