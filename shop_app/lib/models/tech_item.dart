import 'package:shop_app/models/category.dart';

class TechItem {
  const TechItem({
    required this.id,
    required this.name,
    required this.quantity,
    required this.category,
  });

  final String id;
  final String name;
  final int quantity;
  final Category category;
}
