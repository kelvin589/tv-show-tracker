import 'package:flutter/material.dart';
import 'package:track/models/show_detail.dart';
import 'package:track/widgets/seasons_list.dart';

class ProgressPage extends StatelessWidget {
  const ProgressPage({Key? key, required this.show}) : super(key: key);

  final ShowDetail show;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Flexible(child: SeasonsList(show: show)),
      ],
    );
  }
}
