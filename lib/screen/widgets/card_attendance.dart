import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir_app/model/presence.dart';

class CardAttendance extends StatelessWidget {
  const CardAttendance({
    super.key,
    required this.attendance,
  });

  final Presence attendance;

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
                    DateFormat('EEEE').format(attendance.date),
                    style: const TextStyle(
                        color: Color(0xFF293869),
                        fontWeight: FontWeight.bold,
                        fontSize: 16),
                  ),
                  Text(
                    DateFormat('dd-MMM-yyyy').format(attendance.date),
                    style: const TextStyle(
                      color: Color(0xFF293869),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  children: [
                    const Icon(
                      Icons.access_time_outlined,
                      color: Color(0xFF293869),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Check In',
                          style: TextStyle(
                            color: Color(0xFF293869),
                          ),
                        ),
                        Text(
                          DateFormat('HH:mm').format(attendance.entryTime),
                          style: const TextStyle(
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
                    const Icon(
                      Icons.access_time_outlined,
                      color: Color(0xFF293869),
                    ),
                    const SizedBox(width: 10),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Check Out',
                          style: TextStyle(
                            color: Color(0xFF293869),
                          ),
                        ),
                        Text(
                          attendance.exitTime != null
                              ? DateFormat('HH:mm').format(attendance.exitTime!)
                              : '--',
                          style: const TextStyle(
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
