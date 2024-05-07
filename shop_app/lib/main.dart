import "package:flutter/material.dart";
import "package:shop_app/widgets/tech_list.dart";

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "The Shop App",
      theme: ThemeData.dark().copyWith(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color.fromARGB(255, 112, 187, 166),
          brightness: Brightness.dark,
          surface: const Color.fromARGB(255, 30, 53, 53),
        ),
        scaffoldBackgroundColor: const Color.fromARGB(255, 23, 29, 35),
      ),
      home: const TechList(),
      debugShowCheckedModeBanner: false,
    );
  }
}
