import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir_app/model/order_history.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({super.key, required this.history, required this.onTap});

  final OrderHistory history;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                history.serviceName,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                NumberFormat.currency(
                  locale: 'id',
                  symbol: 'Rp ',
                  decimalDigits: 0,
                ).format(history.servicePrice),
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                DateFormat("d MMM yyyy, HH:mm:ss 'WIB'")
                    .format(history.orderDate),
              ),
              Text(history.orderDescription),
            ],
          ),
          onTap: onTap,
        ),
        const Divider(
          indent: 16,
          endIndent: 16,
          height: 0,
        ),
      ],
    );
  }
}
