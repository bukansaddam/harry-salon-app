import 'package:flutter/material.dart';
import 'package:tugas_akhir_app/model/hairstyle.dart';

class CardHairstyle extends StatefulWidget {
  const CardHairstyle({
    super.key,
    this.index = 0,
    required this.onTap,
    required this.hairstyle,
  });

  final int index;
  final Function() onTap;
  final Hairstyle hairstyle;

  @override
  State<CardHairstyle> createState() => _CardHairstyleState();
}

class _CardHairstyleState extends State<CardHairstyle> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: widget.onTap,
      child: Container(
        height: widget.index == 1 ? 300 : 400,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Image.network(
                  widget.hairstyle.image,
                  fit: BoxFit.cover,
                  width: double.infinity,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Text(
                widget.hairstyle.name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
            ),
            const SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
