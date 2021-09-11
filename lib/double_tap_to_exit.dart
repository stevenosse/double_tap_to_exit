library double_tap_to_exit;

import 'dart:io';

import 'package:eyro_toast/eyro_toast.dart';
import 'package:flutter/material.dart';

class DoubleTapToExit extends StatefulWidget {
  const DoubleTapToExit({
    Key? key,
    required this.child,
    this.tapDelay,
    this.message,
  }) : super(key: key);

  /// The message to display when notifying the user
  /// they should tap twice to close the app
  /// Default: "Hit back button again to quit"
  final String? message;

  /// Child
  /// Should normally be the content of the page
  final Widget child;

  /// Delay between the first tap and the second one
  /// Default: Duration(seconds: 1) => 1 second.
  final Duration? tapDelay;

  @override
  _DoubleTapToExitState createState() => _DoubleTapToExitState();
}

class _DoubleTapToExitState extends State<DoubleTapToExit> {
  late int _tappedTimes;

  @override
  void initState() {
    _tappedTimes = 0;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: widget.child,
      onWillPop: () {
        ++_tappedTimes;
        if (_tappedTimes == 1) {
          EyroToast.showToast(
            text: widget.message ?? "Hit back button again to quit",
            duration: ToastDuration.long,
          );
          Future.delayed(widget.tapDelay ?? Duration(seconds: 1)).then((value) {
            _tappedTimes = 0;
          });
        } else if (_tappedTimes == 2) {
          exit(0);
        }
        return Future.value(false);
      },
    );
  }
}
