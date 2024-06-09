import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

class MyTimelineTile extends StatelessWidget {
  const MyTimelineTile({
    super.key,
    required this.start,
    required this.end,
    required this.title,
    required this.description,
    this.enabled = true,
  });

  final bool start, end, enabled;
  final String title, description;

  @override
  Widget build(BuildContext context) {
    return TimelineTile(
      nodePosition: 0,
      contents: Padding(
        padding: const EdgeInsets.only(left: 12, top: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                fontSize: 16,
                color: enabled ? const Color(0xFF3B59BA) : Colors.grey,
              ),
            ),
            Text(
              description,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
      node: TimelineNode(
        indicator: DotIndicator(
          color: enabled ? const Color(0xFF3B59BA) : Colors.grey,
        ),
        startConnector: start
            ? SolidLineConnector(
                color: enabled ? const Color(0xFF3B59BA) : Colors.grey,
              )
            : null,
        endConnector: end
            ? SolidLineConnector(
                color: enabled ? const Color(0xFF3B59BA) : Colors.grey,
              )
            : null,
      ),
    );
  }
}
