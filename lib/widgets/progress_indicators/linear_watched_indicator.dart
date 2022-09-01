import 'package:flutter/material.dart';

class LinearWatchedIndicator extends StatelessWidget {
  const LinearWatchedIndicator({Key? key, required this.value})
      : super(key: key);

  final double value;

  @override
  Widget build(BuildContext context) {
    return LinearProgressIndicator(
      value: value,
      backgroundColor: backgroundColor,
      color: color,
    );
  }

  Color get color => value > 0.66
      ? Colors.green
      : value > 0.33
          ? Colors.orange
          : Colors.red;

  Color get backgroundColor => value > 0.66
      ? Colors.green.shade200
      : value > 0.33
          ? Colors.orange.shade200
          : Colors.red.shade200;
}