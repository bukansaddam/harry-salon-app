import 'package:flutter/material.dart';

class MySearchBar extends StatefulWidget {
  const MySearchBar({
    super.key,
    required TextEditingController searchController,
    required this.onChanged,
  }) : _searchController = searchController;

  final TextEditingController _searchController;
  final Function(String?) onChanged;

  @override
  State<MySearchBar> createState() => _MySearchBarState();
}

class _MySearchBarState extends State<MySearchBar> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget._searchController,
      decoration: const InputDecoration(
        hintText: 'Search employee',
        hintStyle: TextStyle(
          color: Color(0xFF959595),
        ),
        prefixIcon: Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Icon(
            Icons.search,
            color: Color(0xFF959595),
          ),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(30)),
          borderSide: BorderSide.none,
        ),
        filled: true,
        fillColor: Color(0xFFF3F5F9),
      ),
      onChanged: widget.onChanged,
      autocorrect: false,
    );
  }
}
