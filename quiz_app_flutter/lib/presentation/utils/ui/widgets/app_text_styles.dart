import 'package:flutter/material.dart';

class AppTextStyles {
  // Toolbar title
  static Text toolbarTitle(String text) => Text(
    text,
    style: const TextStyle(
      fontSize: 20, // equivalent to titleMedium
      fontWeight: FontWeight.w500,
    ),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  // Dashboard Item Title
  static Text dashboardTitle(String text, {TextStyle? style}) => Text(
    text,
    style: style ?? const TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.blue),
    maxLines: 2,
    overflow: TextOverflow.ellipsis,
  );

  // Quiz Body Title
  static Text quizBodyTitle(String text) => Text(
    text,
    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
    maxLines: 1,
    overflow: TextOverflow.ellipsis,
  );

  // Quiz Body Description
  static Text quizBodyDesc(String text) =>
      Text(text, style: const TextStyle(fontSize: 16), maxLines: 2, overflow: TextOverflow.ellipsis);

  // Medium body text
  static Text medium(String text) => Text(text, style: const TextStyle(fontSize: 16));

  // Large body text
  static Text large(String text) => Text(text, style: const TextStyle(fontSize: 20));

  // Small headline
  static Text headlineSmall(String text) =>
      Text(text, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w500));

  // Result title
  static Text resultTitle(String text) => Text(text, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold));

  // Result section title
  static Text resultSectionTitle(String text) =>
      Text(text, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600));
}
