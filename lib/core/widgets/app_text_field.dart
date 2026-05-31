import 'package:flutter/material.dart';

class AppTextField extends StatelessWidget {
  final String labelText;
  final String hintText;
  final TextEditingController? controller;
  final TextInputType keyboardType;
  final bool isObscure;
  final Widget? prefixIcon;
  final Widget? suffixIcon;
  final String? Function(String?)? validator;

  const AppTextField({
    super.key,
    required this.labelText,
    required this.hintText,
    this.controller,
    this.keyboardType = TextInputType.text,
    this.isObscure = false,
    this.prefixIcon,
    this.suffixIcon,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          labelText,
          style: theme.textTheme.bodyMedium?.copyWith(
            fontWeight: FontWeight.w600,
            color: theme.colorScheme.onBackground.withOpacity(0.8),
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          obscureText: isObscure,
          validator: validator,
          style: theme.textTheme.bodyLarge,
          decoration: InputDecoration(
            hintText: hintText,
            hintStyle: theme.textTheme.bodyMedium?.copyWith(
              color: theme.colorScheme.onSurface.withOpacity(0.5),
            ),
            prefixIcon: prefixIcon,
            suffixIcon: suffixIcon,
          ),
        ),
      ],
    );
  }
}
