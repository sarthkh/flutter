import 'package:flutter/material.dart';

class Category {
  const Category({
    required this.id,
    required this.title,
    this.color = const Color.fromARGB(255, 190, 255, 100),
  });

  final String id;
  final String title;
  final Color color;
}
