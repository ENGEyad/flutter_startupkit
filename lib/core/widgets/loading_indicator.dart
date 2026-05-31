import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class LoadingIndicator extends StatelessWidget {
  final double size;
  final Color? color;

  const LoadingIndicator({
    super.key,
    this.size = 50.0,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final indicatorColor = color ?? theme.colorScheme.primary;

    return Center(
      child: SpinKitDoubleBounce(
        color: indicatorColor,
        size: size,
      ),
    );
  }
}
