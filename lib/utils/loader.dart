import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:mt_flutter_task/utils/constants.dart';

class Loader extends StatelessWidget {
  final double size; // Optional size parameter for the loader
  final Color color; // Optional color parameter for the loader
  final String type; // Optional type parameter for the loader

  const Loader(
      {Key? key,
      this.size = 50.0,
      this.color = primaryColor,
      this.type = "on_center"})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    switch (type) {
      case "on_center":
        {
          return SizedBox(
            height:
                (MediaQuery.of(context).size.height) - (kToolbarHeight + 130),
            child: Dialog(
              elevation: 10,
              backgroundColor: Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0),
              ),
              insetPadding: EdgeInsets.symmetric(
                  horizontal: (MediaQuery.of(context).size.width / 4)),
              child: SizedBox(
                height: MediaQuery.of(context).size.height / 5,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Center(
                      child: SpinKitSpinningLines(
                        color: color,
                        size: size,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    // const Text(
                    //   "Preparing data...",
                    //   textAlign: TextAlign.center,
                    //   style: TextStyle(
                    //       color: primaryColor,
                    //       fontWeight: FontWeight.normal,
                    //       fontSize: 16.0),
                    // ),
                  ],
                ),
              ),
            ),
          );
        }
      case "replacing_item":
        {
          return Center(
            child: SpinKitSpinningLines(
              color: color,
              size: size,
            ),
          );
        }
      default:
        {
          return Center(
            child: SpinKitSpinningLines(
              color: color,
              size: size,
            ),
          );
        }
    }
  }
}
