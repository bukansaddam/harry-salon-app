import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardAttendance extends StatelessWidget {
  const CardAttendance({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      decoration: BoxDecoration(
        border: Border.all(color: const Color(0xFFE1EAF8)),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Container(
            height: 50,
            decoration: BoxDecoration(
              color: const Color(0xFFC9DBF4),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    DateFormat('EEEE').format(DateTime.now()),
                    style: const TextStyle(
                        color: Color(0xFF293869),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(DateTime.now()),
                    style: const TextStyle(
                      color: Color(0xFF293869),
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Color(0xFF293869),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check In',
                          style: TextStyle(
                            color: Color(0xFF293869),
                          ),
                        ),
                        Text(
                          '08:00 AM',
                          style: TextStyle(
                            color: Color(0xFF293869),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.access_time_outlined,
                      color: Color(0xFF293869),
                    ),
                    SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Check Out',
                          style: TextStyle(
                            color: Color(0xFF293869),
                          ),
                        ),
                        Text(
                          '16:00 AM',
                          style: TextStyle(
                            color: Color(0xFF293869),
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
