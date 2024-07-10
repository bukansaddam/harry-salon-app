import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir_app/model/order_history.dart';

class CardHistory extends StatelessWidget {
  const CardHistory(
      {super.key,
      required this.history,
      required this.onTap,
      this.padding = true});

  final OrderHistory history;
  final Function() onTap;
  final bool padding;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: padding
              ? const EdgeInsets.symmetric(horizontal: 16)
              : const EdgeInsets.all(0),
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
        Divider(
          indent: padding ? 16 : 0,
          endIndent: padding ? 16 : 0,
          height: 0,
        ),
      ],
    );
  }
}
