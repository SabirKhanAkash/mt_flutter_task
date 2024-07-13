import 'package:flutter/material.dart';
import 'package:mt_flutter_task/utils/config.dart';

/// UI of the footer text containing version & dev name
class Footer extends StatelessWidget {
  const Footer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        const SizedBox(
          height: 10,
        ),
        Text(
          'v${getVersionName()}',
          style: const TextStyle(
              color: Colors.grey,
              fontFamily: 'rubik',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        const Text(
          'by Akash',
          style: TextStyle(
              color: Colors.grey,
              fontFamily: 'rubik',
              fontWeight: FontWeight.bold,
              fontSize: 12),
        ),
        const SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
