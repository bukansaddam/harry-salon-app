import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
    required TextEditingController searchController,
    required this.onChanged,
    required this.hintText,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final Function(String?) onChanged;
  final String hintText;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._searchController,
      decoration: InputDecoration(
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Color(0xFF959595),
        ),
        prefixIcon: const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            Icons.search,
            color: Color(0xFF959595),
          ),
        ),
        border: const OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: const Color(0xFFF3F5F9),
      ),
      onChanged: widget.onChanged,
      autocorrect: false,
    );
  }
}
