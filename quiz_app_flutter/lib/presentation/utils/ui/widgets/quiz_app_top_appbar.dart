import 'package:flutter/material.dart';

class QuizAppToolbar {
  final String title;
  final IconData? navigationIcon;
  final String? navigationIconContentDescription;
  final VoidCallback? onNavigationClick;
  final List<ToolbarAction> actions;

  QuizAppToolbar({
    this.title = '',
    this.navigationIcon,
    this.navigationIconContentDescription,
    this.onNavigationClick,
    this.actions = const [],
  });
}

class ToolbarAction {
  final IconData icon;
  final String contentDescription;
  final VoidCallback onClick;

  ToolbarAction({required this.icon, required this.contentDescription, required this.onClick});
}

class QuizAppTopAppBar extends StatelessWidget implements PreferredSizeWidget {
  final QuizAppToolbar toolbarConfig;
  final double elevation;

  const QuizAppTopAppBar({super.key, required this.toolbarConfig, this.elevation = 4.0});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(toolbarConfig.title),
      centerTitle: false,
      backgroundColor: Theme.of(context).colorScheme.primary,
      foregroundColor: Theme.of(context).colorScheme.onPrimary,
      elevation: elevation,
      leading:
          toolbarConfig.navigationIcon != null
              ? IconButton(
                icon: Icon(toolbarConfig.navigationIcon),
                tooltip: toolbarConfig.navigationIconContentDescription,
                onPressed: toolbarConfig.onNavigationClick,
              )
              : null,
      actions:
          toolbarConfig.actions
              .map(
                (action) =>
                    IconButton(icon: Icon(action.icon), tooltip: action.contentDescription, onPressed: action.onClick),
              )
              .toList(),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
