import "package:flutter/material.dart";
import "package:shop_app/models/category.dart";

const categories = {
  Categories.hardware: Category(
    'Hardware',
    Color.fromARGB(255, 128, 128, 128),
  ),
  Categories.software: Category(
    'Software',
    Color.fromARGB(255, 0, 128, 255),
  ),
  Categories.networking: Category(
    'Networking',
    Color.fromARGB(255, 255, 128, 0),
  ),
  Categories.programming: Category(
    'Programming',
    Color.fromARGB(255, 0, 255, 0),
  ),
  Categories.cloudComputing: Category(
    'Cloud Computing',
    Color.fromARGB(255, 255, 0, 255),
  ),
  Categories.cybersecurity: Category(
    'Cybersecurity',
    Color.fromARGB(255, 255, 0, 0),
  ),
  Categories.dataScience: Category(
    'Data Science',
    Color.fromARGB(255, 255, 255, 0),
  ),
  Categories.mobileApps: Category(
    'Mobile Apps',
    Color.fromARGB(255, 0, 255, 255),
  ),
  Categories.webDevelopment: Category(
    'Web Development',
    Color.fromARGB(255, 128, 0, 255),
  ),
  Categories.other: Category(
    'Other',
    Color.fromARGB(255, 128, 128, 0),
  ),
};
