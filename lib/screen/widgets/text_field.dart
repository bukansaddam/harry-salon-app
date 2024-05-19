import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String labelText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;

  const CustomTextField(
      {super.key,
      required this.controller,
      required this.labelText,
      this.isObscureText = false,
      this.keyboardType = TextInputType.text,
      this.inputFormatters});

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;

  @override
  void initState() {
    if (widget.isObscureText) {
      _obscureText = true;
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      obscureText: _obscureText,
      decoration: InputDecoration(
          labelText: widget.labelText,
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF3B59BA),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Color(0xFF3B59BA),
            ),
          ),
          suffixIcon: widget.isObscureText
              ? IconButton(
                  onPressed: () {
                    setState(() {
                      _obscureText = !_obscureText;
                    });
                  },
                  icon: Icon(
                    _obscureText ? Icons.visibility_off : Icons.visibility,
                  ),
                )
              : null),
      keyboardType: widget.keyboardType,
      inputFormatters: widget.inputFormatters,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return '${widget.labelText} is required';
        }
        return null;
      },
    );
  }
}
