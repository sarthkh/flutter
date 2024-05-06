import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals_app/data/test_data.dart';

// use Provider if there is static/dummy data
final mealsProvider = Provider((ref) {
  return dummyMeals;
});
