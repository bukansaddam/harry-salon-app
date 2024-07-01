import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/model/order.dart';
import 'package:tugas_akhir_app/screen/widgets/button.dart';

class CardTasks extends StatelessWidget {
  const CardTasks(
      {super.key,
      required this.order,
      this.onAccept = _defaultFunction,
      required this.onDetail,
      this.btnOnAccept = false});

  static void _defaultFunction() {}

  final Order order;
  final Function() onAccept, onDetail;
  final bool btnOnAccept;

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
            Row(
              children: [
                const CircleAvatar(
                  backgroundColor: Colors.white,
                  radius: 25,
                  child: Icon(
                    Icons.qr_code,
                    color: Colors.blue,
                  ),
                ),
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      order.userName,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(order.userPhone.toString()),
                  ],
                )
              ],
            ),
            const SizedBox(height: 12),
            Text(
              order.serviceName,
              style: const TextStyle(
                fontWeight: FontWeight.w600,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              order.description,
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(
                  Icons.attach_file,
                  size: 16,
                ),
                const SizedBox(width: 4),
                order.reference != null
                    ? Text(order.reference!.name)
                    : const Text('No Reference'),
              ],
            ),
            const SizedBox(height: 24),
            Row(
              children: [
                Expanded(
                  child: CustomButton(
                    function: onDetail,
                    text: 'Detail',
                    height: 35,
                    radius: 5,
                    gradient: false,
                  ),
                ),
                btnOnAccept
                    ? const SizedBox(width: 8)
                    : const SizedBox.shrink(),
                btnOnAccept
                    ? Expanded(
                        child: CustomButton(
                          function: onAccept,
                          text: 'Accept',
                          height: 35,
                          radius: 5,
                        ),
                      )
                    : const SizedBox.shrink(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
