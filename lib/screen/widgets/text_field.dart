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
  final bool counter;
  final Icon? prefixIcon, suffixIcon;
  final String? text;
  final Color? fillColor;

  const CustomTextField({
    super.key,
    required this.controller,
    this.labelText,
    this.hintText,
    this.isObscureText = false,
    this.keyboardType = TextInputType.text,
    this.minLines = 1,
    this.enabled = true,
    this.inputFormatters,
    this.counter = false,
    this.prefixIcon,
    this.text,
    this.fillColor,
    this.suffixIcon,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  bool _obscureText = false;
  late ValueNotifier<String> _charCountNotifier;

  @override
  void initState() {
    if (widget.isObscureText) {
      _obscureText = true;
    }
    _charCountNotifier = ValueNotifier<String>(widget.controller.text);
    widget.controller.addListener(_updateCharCount);

    if (widget.text != null) {
      widget.controller.text = widget.text!;
    }
    super.initState();
  }

  void _updateCharCount() {
    _charCountNotifier.value = widget.controller.text;
  }

  String _counterText() {
    if (widget.counter) {
      String text = widget.controller.text;
      if (text.isNotEmpty) {
        int score = 0;

        bool hasUpperCase = text.contains(RegExp(r'[A-Z]'));
        bool hasLowerCase = text.contains(RegExp(r'[a-z]'));
        bool hasDigits = text.contains(RegExp(r'[0-9]'));
        bool hasSpecialCharacters =
            text.contains(RegExp(r'[!@#$%^&*(),.?":{}|<>]'));

        if (text.length >= 8) score++;
        if (text.length >= 12) score++;
        if (hasUpperCase) score++;
        if (hasLowerCase) score++;
        if (hasDigits) score++;
        if (hasSpecialCharacters) score++;

        if (score <= 1) {
          return 'Very Weak';
        } else if (score == 2) {
          return 'Weak';
        } else if (score == 3) {
          return 'Medium';
        } else if (score == 4) {
          return 'Strong';
        } else if (score >= 5) {
          return 'Very Strong';
        }
      }
    }
    return '';
  }

  TextStyle _counterColor() {
    if (widget.counter) {
      String text = _counterText();
      if (text == 'Very Weak') {
        return TextStyle(color: Colors.red[700]);
      } else if (text == 'Weak') {
        return const TextStyle(color: Colors.red);
      } else if (text == 'Medium') {
        return const TextStyle(color: Colors.orange);
      } else if (text == 'Strong') {
        return const TextStyle(color: Colors.lightGreen);
      } else if (text == 'Very Strong') {
        return const TextStyle(color: Colors.green);
      }
    }
    return const TextStyle(color: Colors.transparent);
  }

  @override
  void dispose() {
    widget.controller.removeListener(_updateCharCount);
    _charCountNotifier.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _charCountNotifier,
      builder: (context, value, child) {
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
            prefixIcon: widget.prefixIcon,
            counterText: _counterText(),
            counterStyle: _counterColor(),
            filled: true,
            fillColor: widget.fillColor ?? Colors.grey[200],
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                color: widget.labelText != null && widget.hintText != null
                    ? Colors.transparent
                    : widget.controller.text.isEmpty
                        ? Colors.transparent
                        : const Color(0xFF3B59BA),
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
            suffixIcon: widget.suffixIcon ??
                (widget.isObscureText
                    ? IconButton(
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                      )
                    : null),
          ),
          keyboardType: widget.keyboardType,
          inputFormatters: widget.inputFormatters,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return '${widget.labelText} is required';
            }
            return null;
          },
        );
      },
    );
  }
}
