import "package:flutter/material.dart";

enum Categories {
  hardware,
  software,
  networking,
  programming,
  cloudComputing,
  cybersecurity,
  dataScience,
  mobileApps,
  webDevelopment,
  other
}

class Category {
  const Category(this.title, this.color);

  final String title;
  final Color color;
}
