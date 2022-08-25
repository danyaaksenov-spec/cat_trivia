import 'package:flutter/material.dart';

List<Widget> factsCard(String text, String value) {
  return [
    Text(
      text,
      style: const TextStyle(fontSize: 13, color: Colors.black54),
    ),
    const SizedBox(height: 8),
    Text(
      value,
      style: const TextStyle(fontSize: 16, color: Colors.black),
    ),
  ];
}
