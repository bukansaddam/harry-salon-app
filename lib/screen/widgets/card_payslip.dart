import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:tugas_akhir_app/model/payslip.dart';

class CardPayslip extends StatelessWidget {
  const CardPayslip({super.key, required this.payslip, required this.onTap});

  final Payslip payslip;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        decoration: BoxDecoration(
          border: Border.all(color: const Color(0xFFE1EAF8)),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 50,
              decoration: BoxDecoration(
                color: const Color(0xFFC9DBF4),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      payslip.name,
                      style: const TextStyle(
                          color: Color(0xFF293869),
                          fontWeight: FontWeight.bold,
                          fontSize: 16),
                    ),
                    Text(
                      DateFormat('dd-MMM-yyyy').format(payslip.createdAt),
                      style: const TextStyle(
                        color: Color(0xFF293869),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Text(
                  NumberFormat.currency(
                    locale: 'id',
                    symbol: 'Rp ',
                    decimalDigits: 0,
                  ).format(payslip.total),
                  style: const TextStyle(
                    color: Color(0xFF293869),
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ))
          ],
        ),
      ),
    );
  }
}
