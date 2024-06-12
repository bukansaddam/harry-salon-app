import 'package:flutter/material.dart';

class ItemProfile extends StatelessWidget {
  const ItemProfile({
    super.key,
    required this.onTap,
    required this.title,
    required this.subtitle,
  });

  final String title, subtitle;
  final Function() onTap;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 0),
      title: Text(
        title,
        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
      ),
      subtitle: Text(subtitle),
      trailing: const Icon(
        Icons.arrow_forward_ios,
        size: 16,
      ),
    );
  }
}
