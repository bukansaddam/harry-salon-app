import 'package:flutter/material.dart';

class CardHistory extends StatelessWidget {
  const CardHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          title: const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                'Potong Rambut',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
              Text(
                'Rp. 100.000',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          subtitle: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('12 April 2022, 18:30 WIB'),
              Text('Description'),
            ],
          ),
          onTap: () {},
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
