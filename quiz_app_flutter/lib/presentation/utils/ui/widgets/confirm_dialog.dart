import 'package:flutter/material.dart';

class ConfirmDialog extends StatelessWidget {
  final String title;
  final String message;
  final VoidCallback onConfirm;
  final String confirmButtonLabel;
  final bool showDialogState;
  final VoidCallback? onDismiss;

  const ConfirmDialog({
    super.key,
    required this.title,
    required this.message,
    required this.onConfirm,
    required this.confirmButtonLabel,
    required this.showDialogState,
    this.onDismiss,
  });

  @override
  Widget build(BuildContext context) {
    if (!showDialogState) return const SizedBox.shrink();
    return AlertDialog(
      title: Text(title),
      content: Text(message),
      actions: [
        TextButton(onPressed: onDismiss ?? () => Navigator.of(context).pop(), child: const Text('Cancel')),
        TextButton(
          onPressed: () {
            onConfirm();
            onDismiss?.call();
          },
          child: Text(confirmButtonLabel),
        ),
      ],
    );
  }
}
