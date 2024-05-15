/* 
  USING FUTURE BUILDER
*/

// import 'dart:convert';

// import 'package:flutter/material.dart';
// import 'package:shop_app/data/categories.dart';
// import 'package:shop_app/models/tech_item.dart';
// import 'package:shop_app/widgets/new_item.dart';
// import 'package:http/http.dart' as http;

// class TechList extends StatefulWidget {
//   const TechList({super.key});

//   @override
//   State<TechList> createState() => _TechListState();
// }

// class _TechListState extends State<TechList> {
//   List<TechItem> _techItems = [];
//   late Future<List<TechItem>> _loadedItems;

//   @override
//   void initState() {
//     super.initState();
//     _loadedItems = _loadItems();
//   }

//   Future<List<TechItem>> _loadItems() async {
//     final url = Uri.https('shopapp-udemy-flutter-default-rtdb.firebaseio.com',
//         'shopping-list.json');
//     final response = await http.get(url);

//     if (response.statusCode >= 400) {
//       throw Exception("Failed to fetch tech items. Please try again later..");
//     }

//     if (response.body == 'null') {
//       return [];
//     }

//     final Map<String, dynamic> listData = json.decode(response.body);
//     final List<TechItem> loadedItems = [];

//     for (final item in listData.entries) {
//       final category = categories.entries
//           .firstWhere(
//               (catItem) => catItem.value.title == item.value['category'])
//           .value;

//       loadedItems.add(
//         TechItem(
//           id: item.key,
//           name: item.value['name'],
//           quantity: item.value['quantity'],
//           category: category,
//         ),
//       );
//     }

//     return loadedItems;
//   }

//   Future<void> _addItem() async {
//     final newItem = await Navigator.of(context).push<TechItem>(
//       MaterialPageRoute(
//         builder: (ctx) => const NewItem(),
//       ),
//     );

//     if (newItem != null) {
//       setState(() {
//         _techItems.add(newItem);
//       });
//     }
//   }

//   Future<void> _removeItem(TechItem item) async {
//     final removedIndex = _techItems.indexOf(item);
//     final ogIndex = removedIndex;

//     setState(() {
//       _techItems.removeAt(removedIndex);
//     });

//     final url = Uri.https('shopapp-udemy-flutter-default-rtdb.firebaseio.com',
//         'shopping-list/${item.id}.json');

//     final response = await http.delete(url);

//     if (response.statusCode >= 400) {
//       setState(() {
//         _techItems.insert(ogIndex, item);
//       });
//       ScaffoldMessenger.of(context).showSnackBar(
//         const SnackBar(
//           content: Text("Failed to remove item."),
//         ),
//       );
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(
//           content: Text("Item ${item.name} removed!"),
//         ),
//       );
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Your Tech Store"),
//         actions: [
//           IconButton(
//             onPressed: _addItem,
//             icon: const Icon(Icons.add),
//           ),
//         ],
//       ),
//       body: FutureBuilder(
//         future: _loadedItems,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return const Center(child: CircularProgressIndicator());
//           }

//           if (snapshot.hasError) {
//             return Center(child: Text(snapshot.error.toString()));
//           }

//           if (snapshot.data!.isEmpty) {
//             return const Center(child: Text("No items yet :/"));
//           }

//           return ListView.builder(
//             itemCount: snapshot.data!.length,
//             itemBuilder: (ctx, index) => Dismissible(
//               key: ValueKey(snapshot.data![index].id),
//               background: Container(
//                 color: const Color.fromARGB(199, 239, 83, 80),
//                 alignment: Alignment.centerRight,
//                 padding: const EdgeInsets.only(right: 20),
//                 child: const Icon(
//                   Icons.delete,
//                   color: Colors.white,
//                 ),
//               ),
//               onDismissed: (direction) {
//                 _removeItem(snapshot.data![index]);
//               },
//               child: ListTile(
//                 title: Text(snapshot.data![index].name),
//                 leading: Container(
//                   width: 24,
//                   height: 24,
//                   color: snapshot.data![index].category.color,
//                 ),
//                 trailing: Text(snapshot.data![index].quantity.toString()),
//               ),
//             ),
//           );
//         },
//       ),
//     );
//   }
// }

/*
  NORMAL APPROACH
*/

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:shop_app/data/categories.dart';
import 'package:shop_app/models/tech_item.dart';
import 'package:shop_app/widgets/new_item.dart';
import 'package:http/http.dart' as http;

class TechList extends StatefulWidget {
  const TechList({super.key});

  @override
  State<TechList> createState() => _TechListState();
}

class _TechListState extends State<TechList> {
  List<TechItem> _techItems = [];
  var _isLoading = true;
  String? _error;

  @override
  void initState() {
    super.initState();
    _loadItems();
  }

  Future<void> _loadItems() async {
    final url = Uri.https('shopapp-udemy-flutter-default-rtdb.firebaseio.com',
        'shopping-list.json');
    try {
      final response = await http.get(url);

      if (response.statusCode >= 400) {
        setState(() {
          _error = "Failed to fetch data. Please try again later..";
          _isLoading = false;
        });
        return;
      }

      if (response.body == 'null') {
        setState(() {
          _isLoading = false;
        });

        return;
      }

      final Map<String, dynamic> listData = json.decode(response.body);
      final List<TechItem> loadedItems = [];

      for (final item in listData.entries) {
        final category = categories.entries
            .firstWhere(
                (catItem) => catItem.value.title == item.value['category'])
            .value;

        loadedItems.add(
          TechItem(
            id: item.key,
            name: item.value['name'],
            quantity: item.value['quantity'],
            category: category,
          ),
        );
      }

      setState(() {
        _techItems = loadedItems;
        _isLoading = false;
      });
    } catch (error) {
      setState(() {
        _error = "Something went wrong. Please try again later..";
        _isLoading = false;
      });
    }
  }

  Future<void> _addItem() async {
    final newItem = await Navigator.of(context).push<TechItem>(
      MaterialPageRoute(
        builder: (ctx) => const NewItem(),
      ),
    );

    if (newItem != null) {
      setState(() {
        _techItems.add(newItem);
      });
    }
  }

  Future<void> _removeItem(TechItem item) async {
    final removedIndex = _techItems.indexOf(item);
    final ogIndex = removedIndex;

    setState(() {
      _techItems.removeAt(removedIndex);
    });

    final url = Uri.https('shopapp-udemy-flutter-default-rtdb.firebaseio.com',
        'shopping-list/${item.id}.json');

    final response = await http.delete(url);

    if (response.statusCode >= 400) {
      setState(() {
        _techItems.insert(ogIndex, item);
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Failed to remove item."),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text("Item ${item.name} removed!"),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget content;

    if (_isLoading) {
      content = const Center(
        child: CircularProgressIndicator(),
      );
    } else if (_techItems.isEmpty) {
      content = const Center(
        child: Text(
          "No items yet :/",
        ),
      );
    } else if (_error != null) {
      content = Center(
        child: Text(_error!),
      );
    } else {
      content = ListView.builder(
        itemCount: _techItems.length,
        itemBuilder: (ctx, index) => Dismissible(
          key: ValueKey(_techItems[index].id),
          background: Container(
            color: const Color.fromARGB(199, 239, 83, 80),
            alignment: Alignment.centerRight,
            padding: const EdgeInsets.only(right: 20),
            child: const Icon(
              Icons.delete,
              color: Colors.white,
            ),
          ),
          onDismissed: (direction) {
            _removeItem(_techItems[index]);
          },
          child: ListTile(
            title: Text(_techItems[index].name),
            leading: Container(
              width: 24,
              height: 24,
              color: _techItems[index].category.color,
            ),
            trailing: Text(_techItems[index].quantity.toString()),
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Your Tech Store"),
        actions: [
          IconButton(
            onPressed: _addItem,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      body: content,
    );
  }
}
