import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';

class CardTasks extends StatelessWidget {
  const CardTasks({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0,
      color: const Color(0xFFF3F5F9),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(
                    Icons.qr_code,
                    color: Colors.blue,
                  ),
                ),
                SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Name',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text('Description'),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            const Text(
              'Potong Rambut',
              style: TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            const Text(
              'Description',
            ),
            const SizedBox(height: 12),
            const Row(
              children: [
                Icon(
                  Icons.attach_file,
                  size: 16,
                ),
                SizedBox(width: 4),
                Text('1 Reference'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    function: () {},
                    text: 'Detail',
                    height: 35,
                    radius: 5,
                    gradient: false,
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: CustomButton(
                    function: () {},
                    text: 'Accept',
                    height: 35,
                    radius: 5,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
