import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:mt_flutter_task/utils/constants.dart';

Future<void> showCustomToast(
    BuildContext context, String text, String type) async {
  var backgroundColor = _getColor(context, type);
  var textColor = _getTextColor(context, type);

  FToast fToast = FToast();
  fToast.init(context);

  Widget toast = Container(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
    decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(5),
      color: backgroundColor,
    ),
    child: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        _getIcon(context, type),
        const SizedBox(width: 12),
        Expanded(
          child: Text(
            text, // Use the provided `text` parameter here
            style: TextStyle(
              fontFamily: 'rubik',
              fontSize: fontS,
              color: textColor,
            ),
          ),
        ),
      ],
    ),
  );

  fToast.showToast(
    child: toast,
    toastDuration: const Duration(milliseconds: 1500),
    gravity: ToastGravity.TOP,
  );
}

Icon _getIcon(BuildContext context, String type) {
  switch (type) {
    case "positive":
      return const Icon(Icons.check, color: Colors.green);
    case "neutral":
      return const Icon(Icons.info, color: Colors.blue);
    case "negative":
      return const Icon(Icons.error, color: Colors.red);
    default:
      return Icon(Icons.info, color: Theme.of(context).primaryColor); // Default
  }
}

Color _getColor(BuildContext context, String type) {
  switch (type) {
    case "positive":
      return const Color(0xffd7eccf); // Light green
    case "neutral":
      return const Color(0xffabcee5); // Light blue
    case "negative":
      return const Color(0xffefd7d7); // Light red
    default:
      return Theme.of(context)
          .colorScheme
          .surface; // Default to background color
  }
}

Color _getTextColor(BuildContext context, String type) {
  switch (type) {
    case "positive":
      return const Color(0xff3c763d); // Dark green
    case "neutral":
      return const Color(0xff3c647c); // Dark blue
    case "negative":
      return const Color(0xffab527b); // Dark red
    default:
      return Theme.of(context)
          .textTheme
          .bodyLarge!
          .color!; // Default to text color
  }
}
