import 'package:shop_app/data/categories.dart';
import 'package:shop_app/models/category.dart';
import 'package:shop_app/models/tech_item.dart';

final techItems = [
  TechItem(
    id: 'a',
    name: 'Laptop',
    quantity: 1,
    category: categories[Categories.hardware]!,
  ),
  TechItem(
    id: 'b',
    name: 'Visual Studio Code',
    quantity: 3,
    category: categories[Categories.software]!,
  ),
  TechItem(
    id: 'c',
    name: 'Router',
    quantity: 1,
    category: categories[Categories.networking]!,
  ),
  TechItem(
    id: 'd',
    name: 'Python Course',
    quantity: 5,
    category: categories[Categories.programming]!,
  ),
  TechItem(
    id: 'e',
    name: 'AWS Services',
    quantity: 2,
    category: categories[Categories.cloudComputing]!,
  ),
];
