import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatefulWidget {
  final TextEditingController controller;
  final String? labelText;
  final String? hintText;
  final bool isObscureText;
  final TextInputType keyboardType;
  final List<TextInputFormatter>? inputFormatters;
  final int minLines;
  final bool enabled;

  const CustomTextField(
      {super.key,
      required this.controller,
      this.labelText,
      this.hintText,
      this.isObscureText = false,
      this.keyboardType = TextInputType.text,
      this.minLines = 1,
      this.enabled = true,
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
      minLines: widget.minLines,
      maxLines: widget.minLines,
      enabled: widget.enabled,
      style: const TextStyle(
        color: Colors.black,
      ),
      decoration: InputDecoration(
          labelText: widget.labelText != null && widget.hintText != null
              ? null
              : widget.labelText,
          hintText: widget.hintText,
          hintStyle: const TextStyle(
            color: Colors.grey,
          ),
          floatingLabelBehavior:
              widget.labelText != null && widget.hintText != null
                  ? FloatingLabelBehavior.never
                  : FloatingLabelBehavior.auto,
          floatingLabelStyle: const TextStyle(
            color: Color(0xFF3B59BA),
          ),
          filled: true,
          fillColor: Colors.grey[200],
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
          ),
          disabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: const BorderSide(
              color: Colors.transparent,
            ),
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
