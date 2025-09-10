import 'package:flutter/material.dart';

class BaseCardView extends StatelessWidget {
  final Widget child;
  final VoidCallback onClick;
  final EdgeInsetsGeometry? padding;
  final ShapeBorder? shape;
  final double? elevation;

  const BaseCardView({
    super.key,
    required this.child,
    required this.onClick,
    this.padding,
    this.shape,
    this.elevation,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape:
          shape ??
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      elevation: elevation ?? 4,
      color: Theme.of(context).colorScheme.surface,
      child: InkWell(
        onTap: onClick,
        child: Padding(
          padding: padding ?? const EdgeInsets.all(16.0), // 16.dp equivalent
          child: child,
        ),
      ),
    );
  }
}
