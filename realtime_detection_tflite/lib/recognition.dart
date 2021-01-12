import 'package:flutter/material.dart';

class Recognition extends StatelessWidget {
  final List<dynamic> results;

  Recognition(this.results);

  @override
  Widget build(BuildContext context) {
    List<Widget> _renderStrings() {
      double offset = -10;
      return results.map((re) {
        offset = offset + 14;
        return
            // Text(
            //   "${re["label"]} ${(re["confidence"] * 100).toStringAsFixed(0)}%",
            // );
            Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Expanded(
              flex: 6, // 60%
              child: Text(
                "${re["label"]}",
                style: TextStyle(fontSize: 17),
              ),
            ),
            Expanded(
              flex: 4, // 60%
              child: Text(
                "${(re["confidence"] * 100).toStringAsFixed(0)}%",
                style: TextStyle(fontSize: 17),
                textAlign: TextAlign.right,
              ),
            ),
          ],
        );
      }).toList();
    }

    return Column(children: _renderStrings());
  }
}
