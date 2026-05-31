import 'package:flutter/material.dart';

class AppButton extends StatefulWidget {
  final String text;
  final VoidCallback onTap;
  final bool isLoading;
  final Color? backgroundColor;
  final Color? textColor;

  const AppButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false,
    this.backgroundColor,
    this.textColor,
  });

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 100),
    );
    _scaleAnimation = Tween<double>(begin: 1.0, end: 0.96).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeOut),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final buttonColor = widget.backgroundColor ?? theme.colorScheme.primary;
    final contentColor = widget.textColor ?? (widget.backgroundColor == null ? Colors.white : theme.colorScheme.onPrimary);

    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: GestureDetector(
        onTapDown: (_) => widget.isLoading ? null : _controller.forward(),
        onTapUp: (_) => widget.isLoading ? null : _controller.reverse(),
        onTapCancel: () => widget.isLoading ? null : _controller.reverse(),
        onTap: widget.isLoading ? null : widget.onTap,
        child: ScaleTransition(
          scale: _scaleAnimation,
          child: Container(
            height: 56,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: buttonColor,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: buttonColor.withOpacity(0.3),
                  blurRadius: 16,
                  offset: const Offset(0, 8),
                ),
              ],
            ),
            child: widget.isLoading
                ? const SizedBox(
                    height: 24,
                    width: 24,
                    child: CircularProgressIndicator(
                      valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                      strokeWidth: 2.5,
                    ),
                  )
                : Text(
                    widget.text,
                    style: theme.textTheme.labelLarge?.copyWith(
                      color: contentColor,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
