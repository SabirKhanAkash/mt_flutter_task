import 'package:mt_flutter_task/utils/config.dart';

/// to print any line in the code for debug purpose
class Console {
  static void log(String log) {
    if (getDebugBanner()) {
      print(log);
    }
  }
}
